//
//  HomeTextView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "HomeTextView.h"

@implementation HomeTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.nameLab];
        [self addSubview:self.messageText];
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
    [weakSelf.messageText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(38);
        make.right.equalTo(weakSelf).offset(-20);
        make.centerY.equalTo(weakSelf);
        make.left.equalTo(weakSelf.nameLab.mas_right).offset(16);
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
        _nameLab.text = @"学生姓名";
    }
    return _nameLab;
}


-(UITextField *)messageText
{
    if(!_messageText)
    {
        _messageText = [UITextField new];
        _messageText.layer.masksToBounds = true;
        _messageText.layer.cornerRadius = 8;
        _messageText.layer.borderWidth = 1;
        _messageText.layer.borderColor = RGBA(0xE9E9E9, 1).CGColor;
        
    }
    return _messageText;
}


@end
