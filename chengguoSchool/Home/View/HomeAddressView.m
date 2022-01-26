//
//  HomeAddressView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "HomeAddressView.h"

@implementation HomeAddressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.nameLab];
        [self addSubview:self.addressImg];
        [self addSubview:self.addressLab];
        [self addSubview:self.refreshBtn];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(20);
        make.top.equalTo(weakSelf).offset(10);
        make.height.mas_offset(18);
        make.centerX.equalTo(weakSelf);
    }];
    [weakSelf.addressImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(24);
        make.height.mas_offset(24);
        make.left.equalTo(weakSelf.nameLab);
        make.top.equalTo(weakSelf.nameLab.mas_bottom).offset(8);
    }];
    [weakSelf.refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.addressImg);
        make.right.equalTo(weakSelf).offset(-20);
        make.height.mas_offset(20);
        make.width.mas_offset(98);
    }];
    [weakSelf.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.addressImg);
        make.left.equalTo(weakSelf.addressImg.mas_right).offset(12);
        make.right.equalTo(weakSelf.refreshBtn.mas_left).offset(-12);
    }];
}

#pragma mark - getters

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:16];
        _nameLab.textColor = RGBA(0x333333, 1);
        _nameLab.text = @"位置";
    }
    return _nameLab;
}

-(UIImageView *)addressImg
{
    if(!_addressImg)
    {
        _addressImg = [UIImageView new];
        _addressImg.image = [UIImage imageNamed:@"address"];
    }
    return _addressImg;
}

-(UIButton *)refreshBtn
{
    if(!_refreshBtn)
    {
        _refreshBtn = [UIButton new];
        _refreshBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_refreshBtn setTitle:@"刷新位置" forState:normal];
        [_refreshBtn setTitleColor:RGBA(0xFF5B3C, 1) forState:normal];
        [_refreshBtn setImage:[UIImage imageNamed:@"refresh"] forState:normal];
    }
    return _refreshBtn;
}

-(UILabel *)addressLab
{
    if(!_addressLab)
    {
        _addressLab = [UILabel new];
        _addressLab.font = [UIFont systemFontOfSize:14];
        _addressLab.textColor = RGBA(0x666666, 1);
        _addressLab.numberOfLines = 0;
        [_addressLab sizeToFit];
//        _addressLab.text = @"长远天地大厦A1座一一提提一一一一记忆一一";
    }
    return _addressLab;
}


@end
