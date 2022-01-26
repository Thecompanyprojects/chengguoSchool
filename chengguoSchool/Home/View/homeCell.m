//
//  homeCell.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/22.
//

#import "homeCell.h"

@interface homeCell()

@end

@implementation homeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.numLab];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(1);
        make.centerX.equalTo(weakSelf);
        make.top.equalTo(weakSelf).offset(16);
        make.height.mas_offset(15);
    }];
    [weakSelf.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(1);
        make.centerX.equalTo(weakSelf);
        make.top.equalTo(weakSelf.nameLab.mas_bottom).offset(14);
        make.height.mas_offset(36);
    }];
}

#pragma mark - getters

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:14];
        _nameLab.textAlignment = NSTextAlignmentCenter;
        _nameLab.textColor = RGBA(0x999999, 1);
    }
    return _nameLab;
}

-(UILabel *)numLab
{
    if(!_numLab)
    {
        _numLab = [UILabel new];
        _numLab.textAlignment = NSTextAlignmentCenter;
        _numLab.font = [UIFont systemFontOfSize:37];
        _numLab.textColor = RGBA(0xFF7A33, 1);
    }
    return _numLab;
}



@end
