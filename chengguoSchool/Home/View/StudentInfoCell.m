//
//  StudentInfoCell.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/25.
//

#import "StudentInfoCell.h"

@implementation StudentInfoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.bgImg];
        [self.bgImg addSubview:self.nameLab];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.contentView);
        make.centerX.equalTo(weakSelf.contentView);
        make.left.equalTo(weakSelf).offset(20);
        make.top.equalTo(weakSelf).offset(8);
    }];
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgImg).offset(24);
        make.top.equalTo(weakSelf.bgImg).offset(20);
        make.height.mas_offset(45);
        make.width.mas_offset(90);
    }];
}

#pragma mark - getters

-(UIImageView *)bgImg
{
    if(!_bgImg)
    {
        _bgImg = [UIImageView new];

    }
    return _bgImg;
}

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:27];
        _nameLab.textColor = [UIColor blackColor];
        _nameLab.backgroundColor = [UIColor whiteColor];
    }
    return _nameLab;
}



@end
