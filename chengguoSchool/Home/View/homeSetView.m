//
//  homeSetView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "homeSetView.h"

@interface homeSetView()

@end

@implementation homeSetView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgView];
        [self addSubview:self.nameLab];
        [self addSubview:self.rightImg];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf);
        make.top.equalTo(weakSelf);
        make.right.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf);
    }];
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(16);
        make.top.equalTo(weakSelf.bgView).offset(12);
        make.height.mas_offset(18);
    }];
    [weakSelf.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(28);
        make.height.mas_offset(28);
        make.top.equalTo(weakSelf.bgView).offset(16);
        make.right.equalTo(weakSelf.bgView).offset(-16);
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
    }
    return _bgView;
}


-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:16];
        _nameLab.textColor = RGBA(0xFFFFFF, 1);
        
    }
    return _nameLab;
}

-(UIImageView *)rightImg
{
    if(!_rightImg)
    {
        _rightImg = [UIImageView new];
        
    }
    return _rightImg;
}



@end
