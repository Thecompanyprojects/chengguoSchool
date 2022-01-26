//
//  LoginVC.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "LoginVC.h"

@interface LoginVC ()
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) UIImageView *logoImg;
@property (nonatomic,strong) UIButton *submitBtn;
@property (nonatomic,strong) UILabel *phoneLab;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.nameLab];
    [self.view addSubview:self.logoImg];
    [self.view addSubview:self.submitBtn];
    [self.view addSubview:self.phoneLab];
    [self setuplayout];
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(20);
        make.top.equalTo(weakSelf.view).offset(180);
        make.centerX.equalTo(weakSelf.view);
    }];
    [weakSelf.logoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(80);
        make.height.mas_offset(80);
        make.centerX.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.nameLab.mas_bottom).offset(26);
    }];
    [weakSelf.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.view).offset(26);
        make.centerX.equalTo(weakSelf.view);
        make.bottom.equalTo(weakSelf.view).offset(-90);
        make.height.mas_offset(56);
    }];
    [weakSelf.phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nameLab);
        make.centerX.equalTo(weakSelf.nameLab);
        make.top.equalTo(weakSelf.logoImg.mas_bottom).offset(23);
    }];
}

#pragma mark - getters

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:28];
        _nameLab.textColor = RGBA(0x333333, 1);
        _nameLab.text = @"欢迎来到橙果校园教师端";
        _nameLab.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLab;
}

-(UIImageView *)logoImg
{
    if(!_logoImg)
    {
        _logoImg = [UIImageView new];
        _logoImg.image = [UIImage imageNamed:@"logoImg"];
    }
    return _logoImg;
}

-(UIButton *)submitBtn
{
    if(!_submitBtn)
    {
        _submitBtn = [UIButton new];
        _submitBtn.backgroundColor = RGBA(0xFF7A33, 1);
        _submitBtn.layer.masksToBounds = true;
        _submitBtn.layer.cornerRadius = 8;
        _submitBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_submitBtn setTitle:@"一键登录" forState:normal];
        [_submitBtn setTitleColor:[UIColor whiteColor] forState:normal];
        [_submitBtn addTarget:self action:@selector(submitbtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitBtn;
}

-(UILabel *)phoneLab
{
    if(!_phoneLab)
    {
        _phoneLab = [UILabel new];
        _phoneLab.textColor = RGBA(0x333333, 1);
        _phoneLab.font = [UIFont systemFontOfSize:22];
        _phoneLab.textAlignment = NSTextAlignmentCenter;
        _phoneLab.text = @"139-****-0108";
    }
    return _phoneLab;
}

-(void)submitbtnClick
{
    [[NSUserDefaults standardUserDefaults] setObject:@"111" forKey:@"token"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    TabBarController *tabbar = [TabBarController new];
    UIWindow *window =  [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    window.rootViewController = tabbar;
}

@end
