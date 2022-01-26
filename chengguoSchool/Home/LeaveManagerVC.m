//
//  LeaveManagerVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "LeaveManagerVC.h"

@interface LeaveManagerVC ()
@property (nonatomic,strong) UILabel *leftLab0;
@property (nonatomic,strong) UILabel *leftLab1;
@property (nonatomic,strong) UILabel *leftLab2;
@property (nonatomic,strong) UILabel *leftLab3;
@property (nonatomic,strong) UILabel *leftLab4;
@property (nonatomic,strong) UILabel *messageLab0;
@property (nonatomic,strong) UILabel *messageLab1;
@property (nonatomic,strong) UILabel *messageLab2;
@property (nonatomic,strong) UILabel *messageLab3;
@property (nonatomic,strong) UILabel *messageLab4;

@property (nonatomic,strong) UIButton *submitBtn;
@property (nonatomic,strong) UIButton *declineBtn;

@end

@implementation LeaveManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGBA(0xF1F6FB, 1);
    self.navigationItem.title = @"请假申请";
    [self.view addSubview:self.leftLab0];
    [self.view addSubview:self.leftLab1];
    [self.view addSubview:self.leftLab2];
    [self.view addSubview:self.leftLab3];
    [self.view addSubview:self.leftLab4];
    [self.view addSubview:self.messageLab0];
    [self.view addSubview:self.messageLab1];
    [self.view addSubview:self.messageLab2];
    [self.view addSubview:self.messageLab3];
    [self.view addSubview:self.messageLab4];
    [self.view addSubview:self.submitBtn];
    [self.view addSubview:self.declineBtn];
    [self setuplayout];
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.leftLab0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(20);
        make.top.equalTo(weakSelf.view).offset(20+88);
        make.height.mas_offset(20);
        make.width.mas_offset(80);
    }];
    [weakSelf.messageLab0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftLab0.mas_right).offset(12);
        make.height.mas_offset(20);
        make.right.equalTo(weakSelf.view).offset(-20);
        make.centerY.equalTo(weakSelf.leftLab0);
    }];
    [weakSelf.leftLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftLab0);
        make.top.equalTo(weakSelf.leftLab0.mas_bottom).offset(16);
        make.height.mas_offset(20);
        make.width.mas_offset(80);
    }];
    [weakSelf.messageLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftLab1.mas_right).offset(12);
        make.height.mas_offset(20);
        make.right.equalTo(weakSelf.view).offset(-20);
        make.centerY.equalTo(weakSelf.leftLab1);
    }];
    [weakSelf.leftLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftLab0);
        make.top.equalTo(weakSelf.leftLab1.mas_bottom).offset(16);
        make.height.mas_offset(20);
        make.width.mas_offset(80);
    }];
    [weakSelf.messageLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftLab1.mas_right).offset(12);
        make.height.mas_offset(20);
        make.right.equalTo(weakSelf.view).offset(-20);
        make.centerY.equalTo(weakSelf.leftLab2);
    }];
    [weakSelf.leftLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftLab0);
        make.top.equalTo(weakSelf.leftLab2.mas_bottom).offset(16);
        make.height.mas_offset(20);
        make.width.mas_offset(80);
    }];
    [weakSelf.messageLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftLab1.mas_right).offset(12);
        make.height.mas_offset(20);
        make.right.equalTo(weakSelf.view).offset(-20);
        make.centerY.equalTo(weakSelf.leftLab3);
    }];
    [weakSelf.leftLab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftLab0);
        make.top.equalTo(weakSelf.leftLab3.mas_bottom).offset(16);
        make.height.mas_offset(20);
        make.width.mas_offset(80);
    }];
    [weakSelf.messageLab4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.leftLab1.mas_right).offset(12);
        make.height.mas_offset(20);
        make.right.equalTo(weakSelf.view).offset(-20);
        make.centerY.equalTo(weakSelf.leftLab4);
    }];
    [weakSelf.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(47);
        make.left.equalTo(weakSelf.leftLab0);
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.leftLab4.mas_bottom).offset(20);
    }];
    [weakSelf.declineBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(47);
        make.left.equalTo(weakSelf.leftLab0);
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.submitBtn.mas_bottom).offset(20);
    }];
}

#pragma mark - getters

-(UILabel *)leftLab0
{
    if(!_leftLab0)
    {
        _leftLab0 = [UILabel new];
        _leftLab0.textColor = RGBA(0x666666, 1);
        _leftLab0.text = @"申请";
        _leftLab0.font = [UIFont systemFontOfSize:16];
    }
    return _leftLab0;
}

-(UILabel *)messageLab0
{
    if(!_messageLab0)
    {
        _messageLab0 = [UILabel new];
        _messageLab0.font = [UIFont systemFontOfSize:16];
        _messageLab0.textColor = RGBA(0x333333, 1);
        _messageLab0.text = @"研发部";
    }
    return _messageLab0;
}

-(UILabel *)leftLab1
{
    if(!_leftLab1)
    {
        _leftLab1 = [UILabel new];
        _leftLab1.textColor = RGBA(0x666666, 1);
        _leftLab1.text = @"申请人";
        _leftLab1.font = [UIFont systemFontOfSize:16];
    }
    return _leftLab1;
}

-(UILabel *)messageLab1
{
    if(!_messageLab1)
    {
        _messageLab1 = [UILabel new];
        _messageLab1.font = [UIFont systemFontOfSize:16];
        _messageLab1.textColor = RGBA(0x333333, 1);
        _messageLab1.text = @"齐肖贤（部门经理）";
    }
    return _messageLab1;
}

-(UILabel *)leftLab2
{
    if(!_leftLab2)
    {
        _leftLab2 = [UILabel new];
        _leftLab2.textColor = RGBA(0x666666, 1);
        _leftLab2.text = @"请假类别";
        _leftLab2.font = [UIFont systemFontOfSize:16];
    }
    return _leftLab2;
}

-(UILabel *)messageLab2
{
    if(!_messageLab2)
    {
        _messageLab2 = [UILabel new];
        _messageLab2.font = [UIFont systemFontOfSize:16];
        _messageLab2.textColor = RGBA(0x333333, 1);
        _messageLab2.text = @"事假";
    }
    return _messageLab2;
}

-(UILabel *)leftLab3
{
    if(!_leftLab3)
    {
        _leftLab3 = [UILabel new];
        _leftLab3.textColor = RGBA(0x666666, 1);
        _leftLab3.text = @"请假时长";
        _leftLab3.font = [UIFont systemFontOfSize:16];
    }
    return _leftLab3;
}

-(UILabel *)messageLab3
{
    if(!_messageLab3)
    {
        _messageLab3 = [UILabel new];
        _messageLab3.font = [UIFont systemFontOfSize:16];
        _messageLab3.textColor = RGBA(0x333333, 1);
        _messageLab3.text = @"2021年11月14日-2021年11月18日";
    }
    return _messageLab3;
}

-(UILabel *)leftLab4
{
    if(!_leftLab4)
    {
        _leftLab4 = [UILabel new];
        _leftLab4.textColor = RGBA(0x666666, 1);
        _leftLab4.text = @"请假理由";
        _leftLab4.font = [UIFont systemFontOfSize:16];
    }
    return _leftLab4;
}

-(UILabel *)messageLab4
{
    if(!_messageLab4)
    {
        _messageLab4 = [UILabel new];
        _messageLab4.font = [UIFont systemFontOfSize:16];
        _messageLab4.textColor = RGBA(0x333333, 1);
        _messageLab4.text = @"回家有事";
    }
    return _messageLab4;
}

-(UIButton *)submitBtn
{
    if(!_submitBtn)
    {
        _submitBtn = [UIButton new];
        _submitBtn.layer.masksToBounds = true;
        _submitBtn.layer.cornerRadius = 4;
        _submitBtn.backgroundColor = RGBA(0xFF7A33, 1);
        _submitBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_submitBtn setTitle:@"通过" forState:normal];
        [_submitBtn setTitleColor:[UIColor whiteColor] forState:normal];
        [_submitBtn addTarget:self action:@selector(submitbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitBtn;
}

-(UIButton *)declineBtn
{
    if(!_declineBtn)
    {
        _declineBtn = [UIButton new];
        _declineBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_declineBtn setTitle:@"拒绝" forState:normal];
        _declineBtn.backgroundColor = RGBA(0xF1F6FB, 1);
        [_declineBtn setTitleColor:[UIColor blackColor] forState:normal];
        [_declineBtn addTarget:self action:@selector(declinebtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _declineBtn;
}

-(void)submitbtnClick
{
    [self.navigationController popViewControllerAnimated:true];
}

-(void)declinebtnClick
{
    [self.navigationController popViewControllerAnimated:true];
}

@end
