//
//  StatisticsheadView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "StatisticsheadView.h"

@interface StatisticsheadView()
@property (nonatomic,strong) UITextField *searchText;
@property (nonatomic,strong) UIButton *searchBtn;
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) UIImageView *img;
@property (nonatomic,strong) UILabel *lab0;
@property (nonatomic,strong) UIView *point0;
@property (nonatomic,strong) UIView *point1;
@property (nonatomic,strong) UILabel *text0;
@property (nonatomic,strong) UILabel *text1;

@property (nonatomic,strong) UILabel *nameLab1;
@property (nonatomic,strong) UIView *bgNumView0;
@property (nonatomic,strong) UIView *bgNumView1;
@property (nonatomic,strong) UILabel *numLab0;
@property (nonatomic,strong) UILabel *numLab1;
@property (nonatomic,strong) UILabel *messageLab0;
@property (nonatomic,strong) UILabel *messageLab1;
@end

@implementation StatisticsheadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.searchText];
        [self addSubview:self.searchBtn];
        [self addSubview:self.bgView];
        [self addSubview:self.nameLab];
        [self addSubview:self.lab0];
        [self addSubview:self.img];
        [self addSubview:self.leftBtn];
        [self addSubview:self.rightBtn];
        [self.leftBtn addSubview:self.point0];
        [self.leftBtn addSubview:self.text0];
        [self.rightBtn addSubview:self.point1];
        [self.rightBtn addSubview:self.text1];
        
        [self addSubview:self.nameLab1];
        [self addSubview:self.bgNumView0];
        [self addSubview:self.bgNumView1];
        [self.bgNumView0 addSubview:self.numLab0];
        [self.bgNumView0 addSubview:self.messageLab0];
        [self.bgNumView1 addSubview:self.numLab1];
        [self.bgNumView1 addSubview:self.messageLab1];
        
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
    [weakSelf.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.searchText.mas_bottom).offset(16);
        make.left.equalTo(weakSelf).offset(20);
        make.centerX.equalTo(weakSelf);
        make.height.mas_offset(295);
    }];
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(20);
        make.top.equalTo(weakSelf.bgView).offset(25);
        make.height.mas_offset(22);
    }];
    [weakSelf.lab0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLab);
        make.height.mas_offset(22);
        make.right.equalTo(weakSelf.bgView).offset(-20);
    }];
    [weakSelf.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.bgView);
        make.centerY.equalTo(weakSelf.bgView);
        make.height.mas_offset(158);
        make.width.mas_offset(249);
    }];
    [weakSelf.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.bgView).offset(-20);
        make.left.equalTo(weakSelf.bgView).offset(20);
        make.height.mas_offset(36);
        make.right.equalTo(weakSelf.bgView.mas_centerX).offset(-10);
    }];
    [weakSelf.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.bgView).offset(-20);
        make.right.equalTo(weakSelf.bgView).offset(-20);
        make.height.mas_offset(36);
        make.left.equalTo(weakSelf.bgView.mas_centerX).offset(10);
    }];
    [weakSelf.point0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.leftBtn);
        make.left.equalTo(weakSelf.leftBtn).offset(24);
        make.width.mas_offset(8);
        make.height.mas_offset(8);
    }];
    [weakSelf.text0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.leftBtn);
        make.left.equalTo(weakSelf.point0.mas_right).offset(20);
    }];
    [weakSelf.point1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.rightBtn);
        make.left.equalTo(weakSelf.rightBtn).offset(24);
        make.width.mas_offset(8);
        make.height.mas_offset(8);
    }];
    [weakSelf.text1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.rightBtn);
        make.left.equalTo(weakSelf.point1.mas_right).offset(20);
    }];
    
    [weakSelf.nameLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView);
        make.top.equalTo(weakSelf.bgView.mas_bottom).offset(16);
        make.height.mas_offset(18);
    }];
    [weakSelf.bgNumView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLab1.mas_bottom).offset(11);
        make.left.equalTo(weakSelf.nameLab1);
        make.width.mas_offset(64);
        make.height.mas_offset(35);
    }];
    [weakSelf.bgNumView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLab1.mas_bottom).offset(11);
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
        _searchText.placeholder = @"搜索学生姓名";
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

-(UIView *)bgView
{
    if(!_bgView)
    {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.masksToBounds = true;
        _bgView.layer.cornerRadius = 8;
        
    }
    return _bgView;
}


-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.textColor = [UIColor blackColor];
        _nameLab.font = [UIFont systemFontOfSize:18];
        _nameLab.text = @"学生数量";
    }
    return _nameLab;
}

-(UILabel *)lab0
{
    if(!_lab0)
    {
        _lab0 = [UILabel new];
        _lab0.font = [UIFont systemFontOfSize:18];
        _lab0.textColor = [UIColor blackColor];
        _lab0.text = @"395";
        _lab0.textAlignment = NSTextAlignmentRight;
    }
    return _lab0;
}

-(UIImageView *)img
{
    if(!_img)
    {
        _img = [UIImageView new];
        _img.image = [UIImage imageNamed:@"sats"];
    }
    return _img;
}

-(UIButton *)leftBtn
{
    if(!_leftBtn)
    {
        _leftBtn = [UIButton new];
        _leftBtn.layer.masksToBounds = true;
        _leftBtn.layer.cornerRadius = 8;
        _leftBtn.layer.borderWidth = 1;
        _leftBtn.layer.borderColor = RGBA(0xE1E1E1, 1).CGColor;
    }
    return _leftBtn;
}

-(UIButton *)rightBtn
{
    if(!_rightBtn)
    {
        _rightBtn = [UIButton new];
        _rightBtn.layer.masksToBounds = true;
        _rightBtn.layer.cornerRadius = 8;
        _rightBtn.layer.borderWidth = 1;
        _rightBtn.layer.borderColor = RGBA(0xE1E1E1, 1).CGColor;
    }
    return _rightBtn;
}

-(UIView *)point0
{
    if(!_point0)
    {
        _point0 = [UIView new];
        _point0.layer.masksToBounds = true;
        _point0.layer.cornerRadius = 4;
        _point0.backgroundColor = [UIColor blueColor];
    }
    return _point0;
}

-(UILabel *)text0
{
    if(!_text0)
    {
        _text0 = [UILabel new];
        _text0.textColor = RGBA(0x666666, 1);
        _text0.font = [UIFont systemFontOfSize:14];
        _text0.text = @"已填报";
    }
    return _text0;
}



-(UIView *)point1
{
    if(!_point1)
    {
        _point1 = [UIView new];
        _point1.layer.masksToBounds = true;
        _point1.layer.cornerRadius = 4;
        _point1.backgroundColor = [UIColor redColor];
    }
    return _point1;
}

-(UILabel *)text1
{
    if(!_text1)
    {
        _text1 = [UILabel new];
        _text1.textColor = RGBA(0x666666, 1);
        _text1.font = [UIFont systemFontOfSize:14];
        _text1.text = @"未填报";
    }
    return _text1;
}



-(UILabel *)nameLab1
{
    if(!_nameLab1)
    {
        _nameLab1 = [UILabel new];
        _nameLab1.textColor = RGBA(0x333333, 1);
        _nameLab1.font = [UIFont systemFontOfSize:16];
        _nameLab1.text = @"待办事项";
    }
    return _nameLab1;
}

-(UIView *)bgNumView0
{
    if(!_bgNumView0)
    {
        _bgNumView0 = [UIView new];
        _bgNumView0.backgroundColor = RGBA(0xFF7A33, 0.1);
        _bgNumView0.layer.masksToBounds = true;
        _bgNumView0.layer.cornerRadius = 8;
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
        _messageLab0.text = @"未审核";
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
        _messageLab1.text = @"已审核";
        _messageLab1.textColor = RGBA(0x666666, 1);
    }
    return _messageLab1;
}
@end
