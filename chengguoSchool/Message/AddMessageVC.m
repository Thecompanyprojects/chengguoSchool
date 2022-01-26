//
//  AddMessageVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "AddMessageVC.h"
#import "HomeTextView.h"
#import "HomeMessageView.h"
#import "HomeaddImageView.h"

@interface AddMessageVC ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,worktagsAddImageDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) HomeTextView *textView0;
@property (nonatomic,strong) HomeTextView *textView1;
@property (nonatomic,strong) HomeMessageView *messageView;
@property (nonatomic,strong) HomeaddImageView *addImageView;
@property (nonatomic,strong) NSMutableArray *chooseImgArray;
@property (nonatomic,strong) UILabel *typeLab;
@property (nonatomic,strong) UIButton *chooseBtn0;
@property (nonatomic,strong) UIButton *chooseBtn1;
@property (nonatomic,strong) UIView *point0;
@property (nonatomic,strong) UIView *point1;
@property (nonatomic,strong) UILabel *lab0;
@property (nonatomic,strong) UILabel *lab1;
@property (nonatomic,strong) UIButton *submitBtn;

@end

@implementation AddMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"添加通知";
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.textView0];
    [self.scrollView addSubview:self.textView1];
    [self.scrollView addSubview:self.messageView];
    [self.scrollView addSubview:self.addImageView];
    [self.scrollView addSubview:self.typeLab];
    [self.scrollView addSubview:self.chooseBtn0];
    [self.scrollView addSubview:self.chooseBtn1];
    [self.chooseBtn0 addSubview:self.point0];
    [self.chooseBtn0 addSubview:self.lab0];
    [self.chooseBtn1 addSubview:self.point1];
    [self.chooseBtn1 addSubview:self.lab1];
    [self.scrollView addSubview:self.submitBtn];
    [self setuplayout];
    
    self.chooseImgArray = [NSMutableArray new];
    tasksChooseImgModel *imgModel = [tasksChooseImgModel new];
    imgModel.typeStr = @"0";
    [self.chooseImgArray addObject:imgModel];
    self.addImageView.chooseImgArray = [NSMutableArray new];
    self.addImageView.chooseImgArray = self.chooseImgArray;
    [self.addImageView.collectionView reloadData];
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.textView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(20);
        make.top.equalTo(weakSelf.view).offset(88+16);
        make.centerX.equalTo(weakSelf.view);
        make.height.mas_offset(56);
    }];
    [weakSelf.textView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(20);
        make.top.equalTo(weakSelf.textView0.mas_bottom).offset(16);
        make.centerX.equalTo(weakSelf.view);
        make.height.mas_offset(56);
    }];
    [weakSelf.messageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.textView1.mas_bottom).offset(16);
        make.left.equalTo(weakSelf.textView1);
        make.centerX.equalTo(weakSelf.textView1);
        make.height.mas_offset(162+50);
    }];
    
    [weakSelf.addImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.messageView.mas_bottom).offset(16);
        make.left.equalTo(weakSelf.messageView);
        make.centerX.equalTo(weakSelf.messageView);
        make.height.mas_offset(92);
    }];
    [weakSelf.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.addImageView).offset(20);
        make.top.equalTo(weakSelf.addImageView.mas_bottom).offset(30);
        make.width.mas_offset(56);
        make.height.mas_offset(20);
    }];
    [weakSelf.chooseBtn0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.typeLab);
        make.width.mas_offset(60);
        make.height.mas_offset(32);
        make.left.equalTo(weakSelf.typeLab.mas_right).offset(20);
    }];
    [weakSelf.chooseBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.typeLab);
        make.width.mas_offset(60);
        make.height.mas_offset(32);
        make.left.equalTo(weakSelf.chooseBtn0.mas_right).offset(20);
    }];
    [weakSelf.point0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(8);
        make.height.mas_offset(8);
        make.centerY.equalTo(weakSelf.chooseBtn0);
        make.left.equalTo(weakSelf.chooseBtn0).offset(6);
    }];
    [weakSelf.lab0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.chooseBtn0);
        make.left.equalTo(weakSelf.point0.mas_right).offset(6);
        make.height.mas_offset(18);
    }];
    [weakSelf.point1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(8);
        make.height.mas_offset(8);
        make.centerY.equalTo(weakSelf.chooseBtn1);
        make.left.equalTo(weakSelf.chooseBtn1).offset(6);
    }];
    [weakSelf.lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.chooseBtn1);
        make.left.equalTo(weakSelf.point1.mas_right).offset(6);
        make.height.mas_offset(18);
    }];
    
    [weakSelf.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.chooseBtn0.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.typeLab);
        make.centerX.equalTo(weakSelf.scrollView);
        make.height.mas_offset(47);
    }];
}

-(UIScrollView *)scrollView
{
    if(!_scrollView)
    {
        _scrollView = [UIScrollView new];
        _scrollView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-20);
        _scrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight);
    }
    return _scrollView;
}

-(HomeTextView *)textView0
{
    if(!_textView0)
    {
        _textView0 = [HomeTextView new];
        _textView0.nameLab.text = @"发送对象";
    }
    return _textView0;
}

-(HomeTextView *)textView1
{
    if(!_textView1)
    {
        _textView1 = [HomeTextView new];
        _textView1.nameLab.text = @"标题";
    }
    return _textView1;
}


-(HomeMessageView *)messageView
{
    if(!_messageView)
    {
        _messageView = [HomeMessageView new];
        _messageView.nameLab.text = @"正文";
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

-(UILabel *)typeLab
{
    if(!_typeLab)
    {
        _typeLab = [UILabel new];
        _typeLab.font = [UIFont systemFontOfSize:16];
        _typeLab.text = @"状态";
        _typeLab.textColor = [UIColor blackColor];
    }
    return _typeLab;
}

-(UIButton *)chooseBtn0
{
    if(!_chooseBtn0)
    {
        _chooseBtn0 = [UIButton new];
        _chooseBtn0.layer.masksToBounds = true;
        _chooseBtn0.layer.cornerRadius = 8;
        _chooseBtn0.layer.borderWidth = 1;
        _chooseBtn0.layer.borderColor = RGBA(0xFF7A33, 1).CGColor;
        [_chooseBtn0 addTarget:self action:@selector(choosebtn0Click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chooseBtn0;
}

-(UIButton *)chooseBtn1
{
    if(!_chooseBtn1)
    {
        _chooseBtn1 = [UIButton new];
        _chooseBtn1.layer.masksToBounds = true;
        _chooseBtn1.layer.cornerRadius = 8;
        _chooseBtn1.layer.borderWidth = 1;
        _chooseBtn1.layer.borderColor = RGBA(0x666666, 1).CGColor;
        [_chooseBtn1 addTarget:self action:@selector(choosebtn1Click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chooseBtn1;
}

-(UIView *)point0
{
    if(!_point0)
    {
        _point0 = [UIView new];
        _point0.backgroundColor = [UIColor redColor];
        _point0.layer.masksToBounds = true;
        _point0.layer.cornerRadius = 4;
    }
    return _point0;
}

-(UIView *)point1
{
    if(!_point1)
    {
        _point1 = [UIView new];
        _point1.backgroundColor = [UIColor blueColor];
        _point1.layer.masksToBounds = true;
        _point1.layer.cornerRadius = 4;
        
    }
    return _point1;
}

-(UILabel *)lab0
{
    if(!_lab0)
    {
        _lab0 = [UILabel new];
        _lab0.font = [UIFont systemFontOfSize:16];
        _lab0.text = @"紧急";
        _lab0.textColor = RGBA(0xFF7A33, 1);
    }
    return _lab0;
}

-(UILabel *)lab1
{
    if(!_lab1)
    {
        _lab1 = [UILabel new];
        _lab1.font = [UIFont systemFontOfSize:16];
        _lab1.text = @"普通";
        _lab1.textColor = RGBA(0x666666, 1);
    }
    return _lab1;
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

-(void)choosebtn0Click{
    self.point0.backgroundColor = [UIColor redColor];
    self.point1.backgroundColor = [UIColor blueColor];
    self.lab0.textColor = RGBA(0xFF7A33, 1);
    self.lab1.textColor = RGBA(0x666666, 1);
    self.chooseBtn0.layer.borderColor = RGBA(0xFF7A33, 1).CGColor;
    self.chooseBtn1.layer.borderColor = RGBA(0x666666, 1).CGColor;
}

-(void)choosebtn1Click{
    self.point1.backgroundColor = [UIColor redColor];
    self.point0.backgroundColor = [UIColor blueColor];
    self.lab1.textColor = RGBA(0xFF7A33, 1);
    self.lab0.textColor = RGBA(0x666666, 1);
    self.chooseBtn1.layer.borderColor = RGBA(0xFF7A33, 1).CGColor;
    self.chooseBtn0.layer.borderColor = RGBA(0x666666, 1).CGColor;
}

@end
