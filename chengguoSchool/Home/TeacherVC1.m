//
//  TeacherVC1.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "TeacherVC1.h"
#import "HomeTimeView.h"
#import "HomeMessageView.h"
#import "HomeaddImageView.h"


@interface TeacherVC1 ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,worktagsAddImageDelegate,SPDateTimePickerViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) HomeTimeView *timeView;
@property (nonatomic,strong) HomeMessageView *messageView;
@property (nonatomic,strong) HomeaddImageView *addImageView;
@property (nonatomic,strong) NSMutableArray *chooseImgArray;
@property (nonatomic,strong) UILabel *numLab;
@property (nonatomic,strong) UITextField *numText;
@property (nonatomic,strong) UIButton *submitBtn;
@property (nonatomic,strong) SPDateTimePickerView *TimepickerView;
@end

@implementation TeacherVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.timeView];
    [self.scrollView addSubview:self.messageView];
    [self.scrollView addSubview:self.addImageView];
    [self.scrollView addSubview:self.numLab];
    [self.scrollView addSubview:self.numText];
    [self.scrollView addSubview:self.submitBtn];
    [self setuplayout];
    
    self.chooseImgArray = [NSMutableArray new];
    tasksChooseImgModel *imgModel = [tasksChooseImgModel new];
    imgModel.typeStr = @"0";
    [self.chooseImgArray addObject:imgModel];
    self.addImageView.chooseImgArray = [NSMutableArray new];
    self.addImageView.chooseImgArray = self.chooseImgArray;
    [self.addImageView.collectionView reloadData];
    
    self.TimepickerView = [[SPDateTimePickerView alloc]initWithFrame:CGRectMake(0, 88, kScreenWidth,  kScreenHeight)];
    self.TimepickerView.delegate = self;
    [self.view addSubview:self.TimepickerView];
    
    self.timeView.contentLab.text = [Public getTodayTimes];
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
    [weakSelf.timeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.scrollView).offset(2);
        make.top.equalTo(weakSelf.scrollView);
        make.centerX.equalTo(weakSelf.scrollView);
        make.height.mas_offset(56);
    }];
    [weakSelf.messageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.timeView.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.timeView);
        make.centerX.equalTo(weakSelf.timeView);
        make.height.mas_offset(162+50);
    }];
    [weakSelf.addImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.messageView.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.messageView);
        make.centerX.equalTo(weakSelf.messageView);
        make.height.mas_offset(92);
    }];
    [weakSelf.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.addImageView.mas_bottom).offset(40);
        make.left.equalTo(weakSelf.addImageView).offset(20);
        make.width.mas_offset(100);
    }];
    [weakSelf.numText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(38);
        make.width.mas_offset(56);
        make.centerY.equalTo(weakSelf.numLab);
        make.left.equalTo(weakSelf.numLab.mas_right).offset(20);
    }];
    [weakSelf.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(47);
        make.left.equalTo(weakSelf.scrollView).offset(20);
        make.top.equalTo(weakSelf.numText.mas_bottom).offset(20);
        make.centerX.equalTo(weakSelf.messageView);
    }];
}

#pragma mark - getters

-(HomeTimeView *)timeView
{
    if(!_timeView)
    {
        _timeView = [HomeTimeView new];
        [_timeView.chooseBtn addTarget:self action:@selector(choosetimeClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _timeView;
}
-(HomeMessageView *)messageView
{
    if(!_messageView)
    {
        _messageView = [HomeMessageView new];
        _messageView.nameLab.text = @"文本";
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
//    [self.addImageView.chooseImgArray removeObjectAtIndex:index.item];
    self.addImageView.chooseImgArray = self.chooseImgArray;
    [self.addImageView.collectionView reloadData];
}

-(UILabel *)numLab
{
    if(!_numLab)
    {
        _numLab = [UILabel new];
        _numLab.font = [UIFont systemFontOfSize:16];
        _numLab.textColor = RGBA(0x333333, 1);
        _numLab.text = @"设置最大字数";
    }
    return _numLab;
}

-(UITextField *)numText
{
    if(!_numText)
    {
        _numText = [UITextField new];
        _numText.layer.masksToBounds = true;
        _numText.layer.cornerRadius = 4;
        _numText.layer.borderWidth = 1;
        _numText.layer.borderColor = RGBA(0xE9E9E9, 1).CGColor;
        
    }
    return _numText;
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


-(void)choosetimeClick
{
    [[IQKeyboardManager sharedManager] resignFirstResponder];
    self.TimepickerView.pickerViewMode = SPDatePickerModeDate;
    [self.TimepickerView showDateTimePickerView];
}


- (void)didClickFinishDateTimePickerView:(NSString*)date{
    NSString *dateStr = date;
    self.timeView.contentLab.text = dateStr;
}

- (void)didClickCancelDateTimePickerView{
    
}

-(void)submitbtnClick
{
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
