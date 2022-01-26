//
//  HomeReusableView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/22.
//

#import "HomeReusableView.h"
#import "ColorGradientTool.h"


@implementation HomeReusableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgView];
        [self addSubview:self.iconImg];
        [self addSubview:self.nameLab];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
//    [weakSelf.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(weakSelf);
//        make.top.equalTo(weakSelf);
//        make.centerX.equalTo(weakSelf);
//        make.centerY.equalTo(weakSelf);
//    }];
    [weakSelf.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(18);
        make.height.mas_offset(18);
        make.centerY.equalTo(weakSelf.bgView);
        make.left.equalTo(weakSelf.bgView).offset(8);
    }];
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf.iconImg.mas_right).offset(8);
        make.height.mas_offset(20);
        make.right.equalTo(weakSelf.bgView);
    }];
}

#pragma mark - getters

-(UIView *)bgView
{
    if(!_bgView)
    {
        _bgView = [UIView new];
        _bgView.frame = CGRectMake(0, 0, kScreenWidth-40, 56);
        _bgView.layer.masksToBounds = true;
        _bgView.layer.cornerRadius = 4;
    }
    return _bgView;
}

-(UIImageView *)iconImg
{
    if(!_iconImg)
    {
        _iconImg = [UIImageView new];
        
    }
    return _iconImg;
}

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:16];
        _nameLab.textColor = RGBA(0x333333, 1);
    }
    return _nameLab;
}



@end
