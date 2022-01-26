//
//  StudentHeadView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "StudentHeadView.h"

@interface StudentHeadView()
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UILabel *lab0;
@property (nonatomic,strong) UILabel *lab1;

@end

@implementation StudentHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGBA(0xF1F6FB, 1);
        [self addSubview:self.bgView];
        [self addSubview:self.lab0];
        [self addSubview:self.lab1];
        [self addSubview:self.btn];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.centerX.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(20);
        make.height.mas_offset(123);
    }];
    [weakSelf.lab0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(24);
        make.top.equalTo(weakSelf.bgView).offset(27);
        make.centerX.equalTo(weakSelf.bgView);
    }];
    [weakSelf.lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(24);
        make.top.equalTo(weakSelf.lab0.mas_bottom).offset(8);
        make.centerX.equalTo(weakSelf.bgView);
    }];
    [weakSelf.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(24);
        make.top.equalTo(weakSelf.lab1.mas_bottom).offset(11);
        make.width.mas_offset(48);
        make.height.mas_offset(18);
    }];
}

#pragma mark - getters

-(UIView *)bgView
{
    if(!_bgView)
    {
        _bgView = [UIView new];
        _bgView.layer.masksToBounds = true;
        _bgView.layer.cornerRadius = 8;
        _bgView.backgroundColor = RGBA(0xFF7A33, 1);
    }
    return _bgView;
}

-(UILabel *)lab0
{
    if(!_lab0)
    {
        _lab0 = [UILabel new];
        _lab0.font = [UIFont systemFontOfSize:18];
        _lab0.textColor = RGBA(0xFFFFFF, 1);
        _lab0.text = @"我的实习生";
    }
    return _lab0;
}

-(UILabel *)lab1
{
    if(!_lab1)
    {
        _lab1 = [UILabel new];
        _lab1.font = [UIFont systemFontOfSize:12];
        _lab1.textColor = RGBA(0xFFFFFF, 1);
        _lab1.text = @"实时查询实习生状态";
    }
    return _lab1;
}

-(UIButton *)btn
{
    if(!_btn)
    {
        _btn = [UIButton new];
        [_btn setTitleColor:[UIColor whiteColor] forState:normal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btn setTitle:@"查看" forState:normal];
        _btn.backgroundColor = RGBA(0xF8A87B, 1);
        _btn.layer.masksToBounds = true;
        _btn.layer.cornerRadius = 9;
    }
    return _btn;
}




@end

