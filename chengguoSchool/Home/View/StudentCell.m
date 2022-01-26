//
//  StudentCell.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "StudentCell.h"

@implementation StudentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.contentView.backgroundColor = RGBA(0xF1F6FB, 1);
        [self.contentView addSubview:self.bgView];
        [self.contentView addSubview:self.leftImg];
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.rightImg];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(20);
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf);
        make.height.mas_offset(66);
    }];
    [weakSelf.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.bgView);
        make.left.equalTo(weakSelf.bgView).offset(16);
        make.width.mas_offset(24);
        make.height.mas_offset(24);
    }];
    [weakSelf.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.bgView);
        make.right.equalTo(weakSelf.bgView).offset(-16);
        make.width.mas_offset(18);
        make.height.mas_offset(18);
    }];
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.bgView);
        make.left.equalTo(weakSelf.leftImg.mas_right).offset(15);
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

-(UIImageView *)leftImg
{
    if(!_leftImg)
    {
        _leftImg = [UIImageView new];
        _leftImg.image = [UIImage imageNamed:@""];
    }
    return _leftImg;
}


-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.textColor = RGBA(0x333333, 1);
        _nameLab.font = [UIFont systemFontOfSize:16];
    }
    return _nameLab;
}

-(UIImageView *)rightImg
{
    if(!_rightImg)
    {
        _rightImg = [UIImageView new];
        _rightImg.image = [UIImage imageNamed:@"studentright"];
    }
    return _rightImg;
}



@end


