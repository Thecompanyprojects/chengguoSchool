//
//  HomeheadView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "HomeheadView.h"

@interface HomeheadView()
@property (nonatomic,strong) UITextField *searchText;
@property (nonatomic,strong) UIButton *searchBtn;
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) UIView *bgNumView0;
@property (nonatomic,strong) UIView *bgNumView1;
@property (nonatomic,strong) UILabel *numLab0;
@property (nonatomic,strong) UILabel *numLab1;
@property (nonatomic,strong) UILabel *messageLab0;
@property (nonatomic,strong) UILabel *messageLab1;
@end

@implementation HomeheadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(0xF1F6FB, 1);
        [self addSubview:self.searchText];
        [self addSubview:self.searchBtn];
        [self addSubview:self.managerView0];
        [self addSubview:self.managerView1];
        [self addSubview:self.nameLab];
        [self addSubview:self.bgNumView0];
        [self addSubview:self.bgNumView1];
        [self addSubview:self.numLab0];
        [self addSubview:self.messageLab0];
        [self addSubview:self.numLab1];
        [self addSubview:self.messageLab1];
        [self addSubview:self.screenBtn];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.searchText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(20);
        make.top.equalTo(weakSelf).offset(8);
        make.height.mas_offset(34);
        make.centerX.equalTo(weakSelf);
    }];
    [weakSelf.searchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(43);
        make.height.mas_offset(22);
        make.centerY.equalTo(weakSelf.searchText);
        make.right.equalTo(weakSelf.searchText.mas_right).offset(-10);
    }];
    [weakSelf.managerView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(20);
        make.top.equalTo(weakSelf.searchText.mas_bottom).offset(20);
        make.right.equalTo(weakSelf.mas_centerX).offset(-8);
        make.height.mas_offset(83);
    }];
    [weakSelf.managerView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-20);
        make.top.equalTo(weakSelf.searchText.mas_bottom).offset(20);
        make.left.equalTo(weakSelf.mas_centerX).offset(8);
        make.height.mas_offset(83);
    }];
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.searchText);
        make.top.equalTo(weakSelf.managerView1.mas_bottom).offset(32);
        make.height.mas_offset(18);
    }];
    [weakSelf.bgNumView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLab.mas_bottom).offset(11);
        make.left.equalTo(weakSelf.nameLab);
        make.width.mas_offset(64);
        make.height.mas_offset(35);
    }];
    [weakSelf.bgNumView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLab.mas_bottom).offset(11);
        make.left.equalTo(weakSelf.bgNumView0.mas_right).offset(6);
        make.width.mas_offset(64);
        make.height.mas_offset(35);
    }];
    [weakSelf.numLab0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView0);
        make.centerX.equalTo(weakSelf.bgNumView0);
        make.top.equalTo(weakSelf.bgNumView0).offset(4);
    }];
    [weakSelf.messageLab0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView0);
        make.centerX.equalTo(weakSelf.bgNumView0);
        make.bottom.equalTo(weakSelf.bgNumView0).offset(-4);
    }];
    [weakSelf.numLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView1);
        make.centerX.equalTo(weakSelf.bgNumView1);
        make.top.equalTo(weakSelf.bgNumView1).offset(4);
    }];
    [weakSelf.messageLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgNumView1);
        make.centerX.equalTo(weakSelf.bgNumView1);
        make.bottom.equalTo(weakSelf.bgNumView1).offset(-4);
    }];
    [weakSelf.screenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(22);
        make.right.equalTo(weakSelf).offset(-20);
        make.centerY.equalTo(weakSelf.bgNumView1);
        make.width.mas_offset(56);
    }];
}

#pragma mark - getters

-(UITextField *)searchText
{
    if(!_searchText)
    {
        _searchText = [UITextField new];
        _searchText.layer.masksToBounds = true;
        _searchText.layer.cornerRadius = 34/2;
        _searchText.backgroundColor = [UIColor whiteColor];
        _searchText.layer.borderColor = RGBA(0xE9E9E9, 1).CGColor;
        _searchText.layer.borderWidth = 1;
        _searchText.font = [UIFont systemFontOfSize:14];
        
        //创建左侧视图
        UIImage *im = [UIImage imageNamed:@"home_search"];
        UIImageView *iv = [[UIImageView alloc] initWithImage:im];
        UIView *lv = [[UIView alloc] initWithFrame:CGRectMake(4, 0, 22, 22)];//宽度根据需求进行设置，高度必须大于 textField 的高度
        iv.center = lv.center;
        iv.backgroundColor = [UIColor whiteColor];
        [lv addSubview:iv];

        //设置 textField 的左侧视图
        //设置左侧视图的显示模式
        _searchText.leftViewMode = UITextFieldViewModeAlways;
        _searchText.leftView = lv;
    }
    return _searchText;
}

-(UIButton *)searchBtn
{
    if(!_searchBtn)
    {
        _searchBtn = [UIButton new];
        [_searchBtn setTitle:@"搜索" forState:normal];
        _searchBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_searchBtn setTitleColor:RGBA(0xFF7A33, 1) forState:normal];
        _searchBtn.backgroundColor = RGBA(0xFF7A33, 0.3);
        _searchBtn.layer.masksToBounds = true;
        _searchBtn.layer.cornerRadius = 11;
    }
    return _searchBtn;
}

-(homeSetView *)managerView0
{
    if(!_managerView0)
    {
        _managerView0 = [homeSetView new];
        _managerView0.bgView.backgroundColor = RGBA(0x086EF6, 1);
        _managerView0.nameLab.text = @"教师任务";
        _managerView0.rightImg.image = [UIImage imageNamed:@"right1"];
    }
    return _managerView0;
}

-(homeSetView *)managerView1
{
    if(!_managerView1)
    {
        _managerView1 = [homeSetView new];
        _managerView1.bgView.backgroundColor = RGBA(0xFF7A33, 1);
        _managerView1.nameLab.text = @"学生管理";
        _managerView1.rightImg.image = [UIImage imageNamed:@"right0"];
    }
    return _managerView1;
}

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.textColor = RGBA(0x333333, 1);
        _nameLab.font = [UIFont systemFontOfSize:16];
        _nameLab.text = @"待办事项";
    }
    return _nameLab;
}

-(UIView *)bgNumView0
{
    if(!_bgNumView0)
    {
        _bgNumView0 = [UIView new];
        _bgNumView0.backgroundColor = RGBA(0xFF7A33, 0.1);
        _bgNumView0.layer.masksToBounds = true;
        _bgNumView0.layer.cornerRadius = 8;
        _bgNumView0.userInteractionEnabled = true;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgViewClick0)];
        [_bgNumView0 addGestureRecognizer:singleTap];
    }
    return _bgNumView0;
}

-(UIView *)bgNumView1
{
    if(!_bgNumView1)
    {
        _bgNumView1 = [UIView new];
        _bgNumView1.backgroundColor = RGBA(0xF1F6FB, 1);
        _bgNumView1.layer.masksToBounds = true;
        _bgNumView1.layer.cornerRadius = 8;
        _bgNumView1.userInteractionEnabled = true;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bgViewClick1)];
        [_bgNumView1 addGestureRecognizer:singleTap];
    }
    return _bgNumView1;
}

-(UILabel *)numLab0
{
    if(!_numLab0)
    {
        _numLab0 = [UILabel new];
        _numLab0.textAlignment = NSTextAlignmentCenter;
        _numLab0.font = [UIFont systemFontOfSize:12];
        _numLab0.text = @"19";
        _numLab0.textColor = RGBA(0xFF7A33, 1);
    }
    return _numLab0;
}

-(UILabel *)numLab1
{
    if(!_numLab1)
    {
        _numLab1 = [UILabel new];
        _numLab1.textAlignment = NSTextAlignmentCenter;
        _numLab1.font = [UIFont systemFontOfSize:12];
        _numLab1.text = @"333";
        _numLab1.textColor = RGBA(0x666666, 1);
    }
    return _numLab1;
}

-(UILabel *)messageLab0
{
    if(!_messageLab0)
    {
        _messageLab0 = [UILabel new];
        _messageLab0.textAlignment = NSTextAlignmentCenter;
        _messageLab0.font = [UIFont systemFontOfSize:12];
        _messageLab0.text = @"待处理";
        _messageLab0.textColor = RGBA(0xFF7A33, 1);
    }
    return _messageLab0;
}

-(UILabel *)messageLab1
{
    if(!_messageLab1)
    {
        _messageLab1 = [UILabel new];
        _messageLab1.textAlignment = NSTextAlignmentCenter;
        _messageLab1.font = [UIFont systemFontOfSize:12];
        _messageLab1.text = @"已处理";
        _messageLab1.textColor = RGBA(0x666666, 1);
    }
    return _messageLab1;
}

-(UIButton *)screenBtn
{
    if(!_screenBtn)
    {
        _screenBtn = [UIButton new];
        [_screenBtn setTitle:@"筛选" forState:normal];
        [_screenBtn setImage:[UIImage imageNamed:@"shaixuan"] forState:normal];
        _screenBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_screenBtn setTitleColor:RGBA(0x666666, 1) forState:normal];
    }
    return _screenBtn;
}

-(void)bgViewClick0
{
    self.bgNumView0.backgroundColor = RGBA(0xFF7A33, 0.1);
    self.bgNumView1.backgroundColor = RGBA(0xF1F6FB, 1);
    
    self.numLab0.textColor = RGBA(0xFF7A33, 1);
    self.messageLab0.textColor = RGBA(0xFF7A33, 1);
    
    self.numLab1.textColor = RGBA(0x666666, 1);
    self.messageLab1.textColor = RGBA(0x666666, 1);
}

-(void)bgViewClick1
{
    self.bgNumView1.backgroundColor = RGBA(0xFF7A33, 0.1);
    self.bgNumView0.backgroundColor = RGBA(0xF1F6FB, 1);
    
    self.numLab1.textColor = RGBA(0xFF7A33, 1);
    self.messageLab1.textColor = RGBA(0xFF7A33, 1);
    
    self.numLab0.textColor = RGBA(0x666666, 1);
    self.messageLab0.textColor = RGBA(0x666666, 1);
}


@end
