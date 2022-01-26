//
//  homeTeacherCell.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "homeTeacherCell.h"

@interface homeTeacherCell()
@property (nonatomic,strong) UIView *bgView;

@end

@implementation homeTeacherCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.leftView];
        [self.bgView addSubview:self.nameLab];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf);
        make.height.mas_offset(46);
        make.left.equalTo(weakSelf).offset(20);
    }];
    [weakSelf.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.bgView);
        make.left.equalTo(weakSelf.bgView).offset(16);
        make.width.mas_offset(8);
        make.height.mas_offset(8);
    }];
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.bgView);
        make.left.equalTo(weakSelf.leftView.mas_right).offset(3);
        make.height.mas_offset(20);
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
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

-(UIView *)leftView
{
    if(!_leftView)
    {
        _leftView = [UIView new];
        _leftView.layer.masksToBounds = true;
        _leftView.layer.cornerRadius = 4;
    }
    return _leftView;
}

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:14];
        _nameLab.textColor = RGBA(0x333333, 1);
        
    }
    return _nameLab;
}


@end
