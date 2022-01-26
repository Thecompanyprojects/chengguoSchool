//
//  studentlistHeadView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "studentlistHeadView.h"

@implementation studentlistHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.leftLab];
        [self addSubview:self.middleLab];
        [self addSubview:self.rightLab];
        [self setuplayout];
    }
    return self;
}


-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.middleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).offset(15);
        make.width.mas_offset((kScreenWidth-40)/3);
        make.height.mas_offset(20);
        make.centerX.equalTo(weakSelf);
    }];
    [weakSelf.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).offset(15);
        make.width.mas_offset((kScreenWidth-40)/3);
        make.height.mas_offset(20);
        make.right.equalTo(weakSelf.middleLab.mas_left);
    }];

    [weakSelf.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).offset(15);
        make.width.mas_offset((kScreenWidth-40)/3);
        make.height.mas_offset(20);
        make.left.equalTo(weakSelf.middleLab.mas_right);
    }];
}

#pragma mark - getters

-(UILabel *)leftLab
{
    if(!_leftLab)
    {
        _leftLab = [UILabel new];
        _leftLab.font = [UIFont systemFontOfSize:16];
        _leftLab.textColor = RGBA(0x666666, 1);
        _leftLab.text = @"姓名";
        _leftLab.textAlignment = NSTextAlignmentCenter;
    }
    return _leftLab;
}

-(UILabel *)middleLab
{
    if(!_middleLab)
    {
        _middleLab = [UILabel new];
        _middleLab.font = [UIFont systemFontOfSize:16];
        _middleLab.textColor = RGBA(0x666666, 1);
        _middleLab.text = @"项目名称";
        _middleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _middleLab;
}

-(UILabel *)rightLab
{
    if(!_rightLab)
    {
        _rightLab = [UILabel new];
        _rightLab.font = [UIFont systemFontOfSize:16];
        _rightLab.textColor = RGBA(0x666666, 1);
        _rightLab.text = @"专业";
        _rightLab.textAlignment = NSTextAlignmentCenter;
    }
    return _rightLab;
}

@end
