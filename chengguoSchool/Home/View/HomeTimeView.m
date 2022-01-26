//
//  HomeTimeView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "HomeTimeView.h"

@implementation HomeTimeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.nameLab];
        [self addSubview:self.chooseBtn];
        [self addSubview:self.contentLab];
        [self addSubview:self.rightImg];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(20);
        make.width.mas_offset(68);
        make.height.mas_offset(20);
    }];
    [weakSelf.chooseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nameLab.mas_right).offset(16);
        make.height.mas_offset(38);
        make.right.equalTo(weakSelf).offset(-20);
        make.centerY.equalTo(weakSelf);
    }];

    [weakSelf.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.chooseBtn);
        make.right.equalTo(weakSelf.chooseBtn).offset(-16);
        make.width.mas_offset(24);
        make.height.mas_offset(24);
    }];
    [weakSelf.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.chooseBtn).offset(15);
        make.centerY.equalTo(weakSelf.chooseBtn);
        make.right.equalTo(weakSelf.rightImg.mas_left).offset(-12);
    }];
}


-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:16];
        _nameLab.textColor = RGBA(0x333333, 1);
        _nameLab.text = @"日期";
    }
    return _nameLab;
}

-(UIButton *)chooseBtn
{
    if(!_chooseBtn)
    {
        _chooseBtn = [UIButton new];
        _chooseBtn.layer.masksToBounds = true;
        _chooseBtn.layer.cornerRadius = 8;
        _chooseBtn.layer.borderWidth = 1;
        _chooseBtn.layer.borderColor = RGBA(0xE9E9E9, 1).CGColor;
        
    }
    return _chooseBtn;
}

-(UIImageView *)rightImg
{
    if(!_rightImg)
    {
        _rightImg = [UIImageView new];
        _rightImg.image = [UIImage imageNamed:@"down2"];
    }
    return _rightImg;
}

-(UILabel *)contentLab
{
    if(!_contentLab)
    {
        _contentLab = [UILabel new];
        _contentLab.font = [UIFont systemFontOfSize:16];
        _contentLab.textColor = RGBA(0x333333, 1);
        _contentLab.text = @"2020-11-06";
    }
    return _contentLab;
}




@end
