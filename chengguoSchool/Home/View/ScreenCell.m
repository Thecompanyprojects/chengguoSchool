//
//  ScreenCell.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "ScreenCell.h"

@implementation ScreenCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.messageLab0];
        [self.contentView addSubview:self.messageLab1];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(20);
        make.centerY.equalTo(weakSelf);
        make.height.mas_offset(20);
        make.width.mas_offset(100);
    }];
    [weakSelf.messageLab0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nameLab.mas_right).offset(20);
        make.width.mas_offset(102);
        make.centerY.equalTo(weakSelf);
        make.height.mas_offset(38);
    }];
    [weakSelf.messageLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf).offset(-20);
        make.width.mas_offset(102);
        make.centerY.equalTo(weakSelf);
        make.height.mas_offset(38);
    }];
}

#pragma mark - getters

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

-(UIButton *)messageLab0
{
    if(!_messageLab0)
    {
        _messageLab0 = [UIButton new];
        _messageLab0.layer.masksToBounds = true;
        _messageLab0.layer.cornerRadius = 4;
        _messageLab0.layer.borderWidth = 1;
        _messageLab0.layer.borderColor =  RGBA(0xF9F9F9, 1).CGColor;
        _messageLab0.titleLabel.font = [UIFont systemFontOfSize:14];
        [_messageLab0 setTitleColor:RGBA(0x333333, 1) forState:normal];
        _messageLab0.backgroundColor = RGBA(0xF9F9F9, 1);
        [_messageLab0 setTitle:@"未审核" forState:normal];
        [_messageLab0 addTarget:self action:@selector(message0Click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageLab0;
}

-(UIButton *)messageLab1
{
    if(!_messageLab1)
    {
        _messageLab1 = [UIButton new];
        _messageLab1.layer.masksToBounds = true;
        _messageLab1.layer.cornerRadius = 4;
        _messageLab1.layer.borderWidth = 1;
        _messageLab1.titleLabel.font = [UIFont systemFontOfSize:14];
        [_messageLab1 setTitleColor:RGBA(0x333333, 1) forState:normal];
        _messageLab1.backgroundColor = RGBA(0xF9F9F9, 1);
        _messageLab1.layer.borderColor =  RGBA(0xF9F9F9, 1).CGColor;
        [_messageLab1 setTitle:@"已审核" forState:normal];
        [_messageLab1 addTarget:self action:@selector(message1Click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _messageLab1;
}

-(void)message0Click
{
    self.messageChoose0 = !self.messageChoose0;
    if (self.messageChoose0) {
        self.messageLab0.layer.borderColor =  RGBA(0xFF7A33, 1).CGColor;
    }
    else
    {
        self.messageLab0.layer.borderColor =  RGBA(0xF9F9F9, 1).CGColor;
    }
}

-(void)message1Click
{
    self.messageChoose1 = !self.messageChoose1;
    if (self.messageChoose1) {
        self.messageLab1.layer.borderColor =  RGBA(0xFF7A33, 1).CGColor;
    }
    else
    {
        self.messageLab1.layer.borderColor =  RGBA(0xF9F9F9, 1).CGColor;
    }
}

@end
