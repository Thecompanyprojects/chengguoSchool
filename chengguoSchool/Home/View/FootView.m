//
//  FootView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/22.
//

#import "FootView.h"

@implementation FootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.numImg];
        [self addSubview:self.numLab];
        [self addSubview:self.messageLab];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.numImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(130*s_ScaleWidth);
        make.height.mas_offset(130*s_ScaleWidth);
        make.top.equalTo(weakSelf).offset(20);
        make.left.equalTo(weakSelf);
    }];
    [weakSelf.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.numImg).offset(30);
        make.left.equalTo(weakSelf.numImg.mas_right).offset(20);
        make.right.equalTo(weakSelf).offset(-10);
        make.height.mas_offset(36);
    }];
    [weakSelf.messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.numLab);
        make.top.equalTo(weakSelf.numLab.mas_bottom).offset(12);
        make.right.equalTo(weakSelf);
    }];
}

#pragma mark - getters

-(UIImageView *)numImg
{
    if(!_numImg)
    {
        _numImg = [UIImageView new];
        _numImg.image = [UIImage imageNamed:@"编组 8"];
    }
    return _numImg;
}

-(UILabel *)numLab
{
    if(!_numLab)
    {
        _numLab = [UILabel new];
        _numLab.font = [UIFont systemFontOfSize:37];
        _numLab.textColor = RGBA(0xFF7A33, 1);
        _numLab.text = @"96%";
    }
    return _numLab;
}


-(UILabel *)messageLab
{
    if(!_messageLab)
    {
        _messageLab = [UILabel new];
        _messageLab.font = [UIFont systemFontOfSize:18];
        _messageLab.textColor = RGBA(0x333333, 1);
        _messageLab.text = @"实习学生人数占比";
    }
    return _messageLab;
}
@end
