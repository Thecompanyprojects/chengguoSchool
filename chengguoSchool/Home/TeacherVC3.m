//
//  TeacherVC3.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "TeacherVC3.h"
#import "HomeTextView.h"
#import "HomeMessageView.h"
#import "HomeaddImageView.h"
#import "HomeAddressView.h"


@interface TeacherVC3 ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,worktagsAddImageDelegate,CLLocationManagerDelegate>
{//添加代理协议 CLLocationManagerDelegate
    CLLocationManager *_locationManager;//定位服务管理类
    CLGeocoder * _geocoder;//初始化地理编码器
}
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) HomeTextView *textView;
@property (nonatomic,strong) HomeTextView *textView2;
@property (nonatomic,strong) HomeMessageView *messageView;
@property (nonatomic,strong) HomeaddImageView *addImageView;
@property (nonatomic,strong) NSMutableArray *chooseImgArray;
@property (nonatomic,strong) HomeAddressView *addressView;
@property (nonatomic,strong) UIButton *submitBtn;
@end

@implementation TeacherVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
    [self.view addSubview:self.scrollView];
    
    [self.scrollView addSubview:self.textView];
    [self.scrollView addSubview:self.textView2];
    [self.scrollView addSubview:self.messageView];
    [self.scrollView addSubview:self.addImageView];
    [self.scrollView addSubview:self.addressView];
    [self.scrollView addSubview:self.submitBtn];
    [self setuplayout];
    
    self.chooseImgArray = [NSMutableArray new];
    tasksChooseImgModel *imgModel = [tasksChooseImgModel new];
    imgModel.typeStr = @"0";
    [self.chooseImgArray addObject:imgModel];
    self.addImageView.chooseImgArray = [NSMutableArray new];
    self.addImageView.chooseImgArray = self.chooseImgArray;
    [self.addImageView.collectionView reloadData];
    
    [self initializeLocationService];
}

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

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.scrollView).offset(2);
        make.top.equalTo(weakSelf.scrollView);
        make.centerX.equalTo(weakSelf.scrollView);
        make.height.mas_offset(56);
    }];
    [weakSelf.textView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.scrollView).offset(2);
        make.top.equalTo(weakSelf.textView.mas_bottom).offset(10);
        make.centerX.equalTo(weakSelf.scrollView);
        make.height.mas_offset(56);
    }];
    [weakSelf.messageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.textView2.mas_bottom).offset(10);
        make.left.equalTo(weakSelf.textView2);
        make.centerX.equalTo(weakSelf.textView2);
        make.height.mas_offset(162+50);
    }];
    
    [weakSelf.addImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.messageView.mas_bottom).offset(16);
        make.left.equalTo(weakSelf.messageView);
        make.centerX.equalTo(weakSelf.messageView);
        make.height.mas_offset(92);
    }];
    
    [weakSelf.addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addImageView.mas_bottom).offset(16);
        make.left.equalTo(weakSelf.addImageView);
        make.right.equalTo(weakSelf.addImageView);
        make.height.mas_offset(110);
    }];
    
    [weakSelf.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(47);
        make.left.equalTo(weakSelf.scrollView).offset(20);
        make.top.equalTo(weakSelf.addressView.mas_bottom).offset(20);
        make.centerX.equalTo(weakSelf.messageView);
    }];
}

#pragma mark - getters

-(HomeTextView *)textView
{
    if(!_textView)
    {
        _textView = [HomeTextView new];
        _textView.nameLab.text = @"企业名称";
    }
    return _textView;
}


-(HomeTextView *)textView2
{
    if(!_textView2)
    {
        _textView2 = [HomeTextView new];
        _textView2.nameLab.text = @"寻访标题";
    }
    return _textView2;
}

-(HomeMessageView *)messageView
{
    if(!_messageView)
    {
        _messageView = [HomeMessageView new];
        _messageView.nameLab.text = @"巡访内容";
    }
    return _messageView;
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
    self.addImageView.chooseImgArray = self.chooseImgArray;
    [self.addImageView.collectionView reloadData];
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
        [_submitBtn setTitle:@"确定" forState:normal];
        [_submitBtn setTitleColor:[UIColor whiteColor] forState:normal];
    }
    return _submitBtn;
}

-(void)submitbtnClick{
    if (self.messageView.messageText.text.length==0) {
        [SVProgressHUD hudConfig];
        [SVProgressHUD showHudText:@"请输入文本"];
        return;
    }
    sleep(0.5);
    [SVProgressHUD showSuccess:@"提交成功"];
    [self.navigationController popViewControllerAnimated:true];
}

@end
