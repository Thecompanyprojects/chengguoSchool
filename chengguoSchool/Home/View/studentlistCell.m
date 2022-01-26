//
//  studentlistCell.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "studentlistCell.h"

@implementation studentlistCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.projectLab];
        [self.contentView addSubview:self.typeLab];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.projectLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).offset(15);
        make.width.mas_offset((kScreenWidth-40)/3);
        make.height.mas_offset(20);
        make.centerX.equalTo(weakSelf);
    }];
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).offset(15);
        make.width.mas_offset((kScreenWidth-40)/3);
        make.height.mas_offset(20);
        make.right.equalTo(weakSelf.projectLab.mas_left);
    }];

    [weakSelf.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf).offset(15);
        make.width.mas_offset((kScreenWidth-40)/3);
        make.height.mas_offset(20);
        make.left.equalTo(weakSelf.projectLab.mas_right);
    }];
}

#pragma mark - getters

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:14];
        _nameLab.textColor = RGBA(0x333333, 1);
        _nameLab.text = @"张三";
        _nameLab.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLab;
}

-(UILabel *)projectLab
{
    if(!_projectLab)
    {
        _projectLab = [UILabel new];
        _projectLab.font = [UIFont systemFontOfSize:14];
        _projectLab.textColor = RGBA(0x333333, 1);
        _projectLab.text = @"2022届地理科学";
        _projectLab.textAlignment = NSTextAlignmentCenter;
    }
    return _projectLab;
}

-(UILabel *)typeLab
{
    if(!_typeLab)
    {
        _typeLab = [UILabel new];
        _typeLab.font = [UIFont systemFontOfSize:14];
        _typeLab.textColor = RGBA(0x333333, 1);
        _typeLab.text = @"地理科学";
        _typeLab.textAlignment = NSTextAlignmentCenter;
    }
    return _typeLab;
}



@end
