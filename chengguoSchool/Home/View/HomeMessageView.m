//
//  HomeMessageView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "HomeMessageView.h"

@interface HomeMessageView()


@end

@implementation HomeMessageView

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
        make.left.equalTo(weakSelf).offset(20);
        make.top.equalTo(weakSelf).offset(10);
        make.height.mas_offset(18);
        make.centerX.equalTo(weakSelf);
    }];
    [weakSelf.messageText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(20);
        make.top.equalTo(weakSelf.nameLab.mas_bottom).offset(16);
        make.centerX.equalTo(weakSelf);
        make.bottom.equalTo(weakSelf).offset(-10);
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
        _nameLab.text = @"备注";
    }
    return _nameLab;
}

-(UITextView *)messageText
{
    if(!_messageText)
    {
        _messageText = [UITextView new];
        _messageText.layer.masksToBounds = true;
        _messageText.layer.cornerRadius = 8;
        _messageText.backgroundColor = RGBA(0xF1F6FB, 1);
        _messageText.layer.borderWidth = 1;
        _messageText.layer.borderColor = RGBA(0xE9E9E9, 1).CGColor;
    }
    return _messageText;
}


@end
