//
//  TeacherVC0.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "TeacherVC0.h"
#import "HomeAddressView.h"
#import "HomeaddImageView.h"
#import "HomeMessageView.h"
#import <CoreLocation/CoreLocation.h>      //添加定位服务头文件（不可缺少）


@interface TeacherVC0 ()<FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance,UINavigationControllerDelegate,UIImagePickerControllerDelegate,worktagsAddImageDelegate,CLLocationManagerDelegate>
{//添加代理协议 CLLocationManagerDelegate
    CLLocationManager *_locationManager;//定位服务管理类
    CLGeocoder * _geocoder;//初始化地理编码器
}
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) FSCalendar *calendarView;
@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) UIButton *rightBtn;
@property (nonatomic,strong) UILabel *timeLab;
@property (nonatomic,strong) UIView *footView;
@property (nonatomic,strong) UIButton *animanBtn;
@property (nonatomic,strong) UIView *lineView0;
@property (nonatomic,strong) UIView *lineView1;
@property (nonatomic,strong) HomeAddressView *addressView;
@property (nonatomic,strong) HomeaddImageView *addImageView;
@property (nonatomic,strong) NSMutableArray *chooseImgArray;
@property (strong, nonatomic) NSCalendar *gregorian;
@property (nonatomic,strong) NSDateFormatter *dateFormatter;
@property (nonatomic,strong) HomeMessageView *messageView;
@property (nonatomic,strong) UIButton *submitBtn;
@end

@implementation TeacherVC0

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
    [self.view addSubview:self.scrollView];
    self.gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [self.scrollView addSubview:self.calendarView];
    [self.scrollView addSubview:self.headView];
    [self.scrollView addSubview:self.footView];
    [self.scrollView addSubview:self.addressView];
    [self.scrollView addSubview:self.addImageView];
    [self.scrollView addSubview:self.messageView];
    [self.scrollView addSubview:self.submitBtn];
    [self setuplayout];

    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"yyyy-MM";
    NSString *str = [self.dateFormatter stringFromDate:[NSDate new]];
    self.timeLab.text = str?:@"";
    
    self.chooseImgArray = [NSMutableArray new];
    tasksChooseImgModel *imgModel = [tasksChooseImgModel new];
    imgModel.typeStr = @"0";
    [self.chooseImgArray addObject:imgModel];
    self.addImageView.chooseImgArray = [NSMutableArray new];
    self.addImageView.chooseImgArray = self.chooseImgArray;
    [self.addImageView.collectionView reloadData];
    
    [self initializeLocationService];
    
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.scrollView).with.offset(16);
        make.centerX.equalTo(weakSelf.scrollView);
        make.top.equalTo(weakSelf.scrollView).with.offset(20);
        make.height.mas_offset(340);
    }];
    [weakSelf.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.scrollView);
        make.left.equalTo(weakSelf.scrollView);
        make.height.mas_offset(60);
        make.centerX.equalTo(weakSelf.scrollView);
    }];
    [weakSelf.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.headView);
        make.width.mas_offset(8);
        make.height.mas_offset(13);
        make.left.equalTo(weakSelf.headView).offset(36);
    }];
    [weakSelf.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.headView);
        make.width.mas_offset(8);
        make.height.mas_offset(13);
        make.right.equalTo(weakSelf.headView).offset(-36);
    }];
    [weakSelf.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.headView);
        make.left.equalTo(weakSelf.leftBtn.mas_right);
        make.centerY.equalTo(weakSelf.headView);
    }];

    [weakSelf.footView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.calendarView);
        make.centerX.equalTo(weakSelf.calendarView);
        make.height.mas_offset(40);
        make.top.equalTo(weakSelf.calendarView).offset(120);
    }];
    [weakSelf.animanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.footView);
        make.width.mas_offset(25);
        make.height.mas_offset(25);
        make.centerY.equalTo(weakSelf.footView);
    }];
    [weakSelf.lineView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.footView);
        make.left.equalTo(weakSelf.footView);
        make.height.mas_offset(1);
        make.right.equalTo(weakSelf.animanBtn.mas_left).offset(-10);
    }];
    [weakSelf.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.footView);
        make.right.equalTo(weakSelf.footView);
        make.height.mas_offset(1);
        make.left.equalTo(weakSelf.animanBtn.mas_right).offset(10);
    }];
    
    [weakSelf.addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.footView.mas_bottom).offset(1);
        make.left.equalTo(weakSelf.footView);
        make.right.equalTo(weakSelf.footView);
        make.height.mas_offset(60);
    }];
    [weakSelf.addImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addressView.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.addressView);
        make.centerX.equalTo(weakSelf.addressView);
        make.height.mas_offset(92);
    }];
    [weakSelf.messageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addImageView.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.addressView);
        make.centerX.equalTo(weakSelf.addressView);
        make.height.mas_offset(108+50);
    }];
    [weakSelf.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(47);
        make.left.equalTo(weakSelf.scrollView).offset(40);
        make.top.equalTo(weakSelf.messageView.mas_bottom).offset(20);
        make.centerX.equalTo(weakSelf.messageView);
    }];
}

#pragma mark - getters

-(UIScrollView *)scrollView
{
    if(!_scrollView)
    {
        _scrollView = [UIScrollView new];
        _scrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-88-40-20);
        _scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
    }
    return _scrollView;
}

-(UIView *)headView
{
    if(!_headView)
    {
        _headView = [UIView new];
        _headView.backgroundColor = RGBA(0xF1F6FB, 1);
        [_headView addSubview:self.leftBtn];
        [_headView addSubview:self.rightBtn];
        [_headView addSubview:self.timeLab];
    }
    return _headView;
}

-(UIView *)footView
{
    if(!_footView)
    {
        _footView = [UIView new];
        [_footView addSubview:self.animanBtn];
        [_footView addSubview:self.lineView0];
        [_footView addSubview:self.lineView1];
    }
    return _footView;
}


-(UIButton *)leftBtn
{
    if(!_leftBtn)
    {
        _leftBtn = [UIButton new];
        [_leftBtn addTarget:self action:@selector(previousClicked) forControlEvents:UIControlEventTouchUpInside];
        [_leftBtn setImage:[UIImage imageNamed:@"leftbtn"] forState:normal];
        _leftBtn.hitEdgeInsets = UIEdgeInsetsMake(-8, -8, -8, -8);
    }
    return _leftBtn;
}

-(UIButton *)rightBtn
{
    if(!_rightBtn)
    {
        _rightBtn = [UIButton new];
        [_rightBtn addTarget:self action:@selector(nextClicked) forControlEvents:UIControlEventTouchUpInside];
        [_rightBtn setImage:[UIImage imageNamed:@"rightbtn"] forState:normal];
        _rightBtn.hitEdgeInsets = UIEdgeInsetsMake(-8, -8, -8, -8);
    }
    return _rightBtn;
}

-(UILabel *)timeLab
{
    if(!_timeLab)
    {
        _timeLab = [UILabel new];
        _timeLab.textAlignment = NSTextAlignmentCenter;
        _timeLab.font = [UIFont systemFontOfSize:16];
        _timeLab.textColor = RGBA(0x333333, 1);
        _timeLab.text = @"2021年12月";
    }
    return _timeLab;
}

-(UIButton *)animanBtn
{
    if(!_animanBtn)
    {
        _animanBtn = [UIButton new];
        [_animanBtn setImage:[UIImage imageNamed:@"down"] forState:normal];
        [_animanBtn addTarget:self action:@selector(animanbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _animanBtn;
}

-(UIView *)lineView0
{
    if(!_lineView0)
    {
        _lineView0 = [UIView new];
        _lineView0.backgroundColor = RGBA(0xF0F0F0, 1);
        
    }
    return _lineView0;
}


-(UIView *)lineView1
{
    if(!_lineView1)
    {
        _lineView1 = [UIView new];
        _lineView1.backgroundColor = RGBA(0xF0F0F0, 1);
    }
    return _lineView1;
}


-(FSCalendar *)calendarView
{
    if(!_calendarView)
    {
        _calendarView = [FSCalendar new];
        _calendarView.frame = CGRectMake(0, 0, kScreenWidth, 340);
        _calendarView.delegate = self;
        _calendarView.dataSource = self;
        _calendarView.appearance.weekdayTextColor = RGBA(0x6E6E6E, 1);
        _calendarView.appearance.headerTitleColor = RGBA(0x333333, 1);
        _calendarView.appearance.headerMinimumDissolvedAlpha = 0;
        _calendarView.appearance.todayColor = [UIColor clearColor];
        _calendarView.appearance.titleTodayColor = RGBA(0x333333, 1);;
        _calendarView.appearance.selectionColor = [UIColor clearColor];
        _calendarView.appearance.borderSelectionColor = RGBA(0x333333, 1);;
        _calendarView.appearance.caseOptions = FSCalendarCaseOptionsWeekdayUsesDefaultCase;
        _calendarView.appearance.titleSelectionColor = RGBA(0x333333, 1);;
        [_calendarView setScope:FSCalendarScopeWeek animated:false];
        _calendarView.appearance.titleDefaultColor = RGBA(0x333333, 1);;
        _calendarView.placeholderType = FSCalendarPlaceholderTypeNone;
        [_calendarView selectDate:[NSDate date]]; // 设置默认选中日期是今天
    }
    return _calendarView;
}


- (void)calendar:(FSCalendar *)calendar boundingRectWillChange:(CGRect)bounds animated:(BOOL)animated
{
    if (self.calendarView.scope==FSCalendarScopeMonth) {
        [self.animanBtn setImage:[UIImage imageNamed:@"arrow-up"] forState:normal];
    }
    else
    {
        [self.animanBtn setImage:[UIImage imageNamed:@"down"] forState:normal];
    }
    
    [self.calendarView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(bounds.size.height));
        // Do other updates
        
    }];
    [self.view layoutIfNeeded];
    
}

// 对有事件的显示一个点,默认是显示三个点
- (NSInteger)calendar:(FSCalendar *)calendar numberOfEventsForDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";

    NSMutableArray *dateArray = [NSMutableArray new];
    [dateArray addObject:@"2021-11-20"];
    [dateArray addObject:@"2021-11-22"];

    if ([dateArray containsObject:[dateFormatter stringFromDate:date]]) {
        return 1;
    }
    return 0;
}

- (void)calendarCurrentPageDidChange:(FSCalendar *)calendar
{
    self.dateFormatter = [[NSDateFormatter alloc] init];
    self.dateFormatter.dateFormat = @"yyyy-MM";
    NSString *str = [self.dateFormatter stringFromDate:calendar.currentPage];
    self.timeLab.text = str?:@"";
}

-(void)animanbtnClick
{
    [self.view layoutIfNeeded];
    if (self.calendarView.scope==FSCalendarScopeMonth) {
        [self.calendarView setScope:FSCalendarScopeWeek animated:false];
        __weak typeof (self) weakSelf = self;
        [weakSelf.footView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.calendarView);
            make.centerX.equalTo(weakSelf.calendarView);
            make.height.mas_offset(40);
            make.top.equalTo(weakSelf.calendarView).offset(120);
        }];
    }
    else
    {
        [self.calendarView setScope:FSCalendarScopeMonth animated:false];
        __weak typeof (self) weakSelf = self;
        [weakSelf.footView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.calendarView);
            make.centerX.equalTo(weakSelf.calendarView);
            make.height.mas_offset(40);
            make.top.equalTo(weakSelf.calendarView).offset(350);
        }];
    }
}

- (void)previousClicked
{
    NSDate *currentMonth = self.calendarView.currentPage;
    NSDate *previousMonth = [self.gregorian dateByAddingUnit:NSCalendarUnitMonth value:-1 toDate:currentMonth options:0];
    [self.calendarView setCurrentPage:previousMonth animated:YES];
}

- (void)nextClicked
{
    NSDate *currentMonth = self.calendarView.currentPage;
    NSDate *nextMonth = [self.gregorian dateByAddingUnit:NSCalendarUnitMonth value:1 toDate:currentMonth options:0];
    [self.calendarView setCurrentPage:nextMonth animated:YES];
}

- (NSString *)calendar:(FSCalendar *)calendar titleForDate:(NSDate *)date
{
    if ([self.gregorian isDateInToday:date]) {
        return @"今";
    }
    return nil;
}

- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance titleDefaultColorForDate:(NSDate *)date
{
    if ([self.gregorian isDateInToday:date]) {
        return RGBA(0xDF532F, 1);
    }
    return nil;
}

- (nullable UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance titleSelectionColorForDate:(NSDate *)date
{
    if ([self.gregorian isDateInToday:date]) {
        return RGBA(0xDF532F, 1);
    }
    return nil;
}

-(HomeAddressView *)addressView
{
    if(!_addressView)
    {
        _addressView = [HomeAddressView new];
        [_addressView.refreshBtn addTarget:self action:@selector(initializeLocationService) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addressView;
}

-(HomeaddImageView *)addImageView
{
    if(!_addImageView)
    {
        _addImageView = [HomeaddImageView new];
        _addImageView.delegate = self;
        
    }
    return _addImageView;
}

- (void)initializeLocationService {
    // 初始化定位管理器
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager requestWhenInUseAuthorization];
    //[_locationManager requestAlwaysAuthorization];//iOS8必须，这两行必须有一行执行，否则无法获取位置信息，和定位
    // 设置代理
    _locationManager.delegate = self;
    // 设置定位精确度到米
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // 设置过滤器为无
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    // 开始定位
    [_locationManager startUpdatingLocation];//开始定位之后会不断的执行代理方法更新位置会比较费电所以建议获取完位置即时关闭更新位置服务
    //初始化地理编码器
    _geocoder = [[CLGeocoder alloc] init];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{

    NSLog(@"%lu",(unsigned long)locations.count);
    CLLocation * location = locations.lastObject;
    [_geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSLog(@"%@",placemark.name);
            //获取城市
            NSString *city = placemark.locality;
            if (!city) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                city = placemark.administrativeArea;
            }
            self.addressView.addressLab.text = [NSString stringWithFormat:@"%@%@%@",placemark.subLocality,@"-",placemark.name];
        }else if (error == nil && [placemarks count] == 0) {
            NSLog(@"No results were returned.");
        } else if (error != nil){
            NSLog(@"An error occurred = %@", error);
        }
    }];
//    [manager stopUpdatingLocation];不用的时候关闭更新位置服务
}



-(void)selectImage{
                    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                 
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"没有相册使用权限，请前往设置页面开启权限" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionDelete = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                         
        }];
        [alert addAction:actionDelete];
        UIAlertAction *actionSure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:[NSDictionary new] completionHandler:^(BOOL success) {
                            
            }];
        }];
        [alert addAction:actionSure];
        [self presentViewController:alert animated:YES completion:nil];
                
        return;
                    
    }else{
                     
        UIImagePickerController *controller = [[UIImagePickerController alloc] init];
        controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        controller.editing = YES;
        controller.delegate = self;
        [self presentViewController:controller animated:YES completion:^(void){
            NSLog(@"Picker View Controller is presented");
        }];
        }
    }]];
    [alertVC addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                 
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusRestricted || status == AVAuthorizationStatusDenied)
        {
                     
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"没有相机使用权限，请前往设置页面开启权限" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *actionDelete = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                         
            }];
            [alert addAction:actionDelete];
            UIAlertAction *actionSure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                         //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:[NSDictionary new] completionHandler:^(BOOL success) {
                             
                }];
            }];
            [alert addAction:actionSure];
            [self presentViewController:alert animated:YES completion:nil];
            return;
        }else{
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypeCamera;
            controller.editing = YES;
            controller.delegate = self;
            [self presentViewController:controller animated:true completion:^{
                         
            }];
        }
    }]];
             
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                 
    }]];
    [self presentViewController:alertVC animated:YES completion:nil];
             
    }

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        if (!portraitImg) {
            return;
        }
        tasksChooseImgModel *model = [tasksChooseImgModel new];
        model.typeStr = @"1";
        model.fileImage = portraitImg;
        [self.chooseImgArray addObject:model];
        [self changeImageList];
        [self.addImageView.collectionView reloadData];
    }];
}

-(void)changeImageList
{
    tasksChooseImgModel *temp = [tasksChooseImgModel new];
    bool flag = false;
    for (int i=0; i<self.chooseImgArray.count; i++) {
        tasksChooseImgModel *student = self.chooseImgArray[i];
        if ([student.typeStr intValue]==0) {
            temp = student;
            flag = true;
            [self.chooseImgArray removeObjectAtIndex:i];
            break;
        }
    }
    if (flag) {
        if (self.chooseImgArray.count<5) {
            [self.chooseImgArray addObject:temp];
        }
    }
}

-(void)addImagefileWith:(UIView *)cell{
    [self selectImage];
}

-(void)deleteImgwithFileCell:(NSIndexPath *)index{
    [self.chooseImgArray removeObjectAtIndex:index.item];
//    [self.addImageView.chooseImgArray removeObjectAtIndex:index.item];
    self.addImageView.chooseImgArray = self.chooseImgArray;
    [self.addImageView.collectionView reloadData];
}

-(HomeMessageView *)messageView
{
    if(!_messageView)
    {
        _messageView = [HomeMessageView new];
        
    }
    return _messageView;
}


-(UIButton *)submitBtn
{
    if(!_submitBtn)
    {
        _submitBtn = [UIButton new];
        [_submitBtn addTarget:self action:@selector(submitbtnClick) forControlEvents:UIControlEventTouchUpInside];
        _submitBtn.layer.masksToBounds = true;
        _submitBtn.layer.cornerRadius = 8;
        _submitBtn.backgroundColor = RGBA(0xFF7A33, 1);
        _submitBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_submitBtn setTitle:@"签到" forState:normal];
        [_submitBtn setTitleColor:[UIColor whiteColor] forState:normal];
    }
    return _submitBtn;
}

-(void)submitbtnClick
{
    sleep(0.5);
    [SVProgressHUD showSuccess:@"签到成功"];
    [self.navigationController popViewControllerAnimated:true];
}

@end
