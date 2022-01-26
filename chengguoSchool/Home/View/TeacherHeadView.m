//
//  TeacherHeadView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "TeacherHeadView.h"

@implementation TeacherHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headBtn0];
        [self addSubview:self.headBtn1];
        [self addSubview:self.headBtn2];
        [self addSubview:self.headBtn3];
        [self setuplayout];
    }
    return self;
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    NSArray *imgViews = @[weakSelf.headBtn0, weakSelf.headBtn1, weakSelf.headBtn2,weakSelf.headBtn3];
    [imgViews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:20 tailSpacing:20];
    [imgViews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(20);
        make.width.mas_offset(80);
        make.top.equalTo(weakSelf).offset(6);
    }];
}

#pragma mark - getters

-(UIButton *)headBtn0
{
    if(!_headBtn0)
    {
        _headBtn0 = [UIButton new];
        _headBtn0.titleLabel.font = [UIFont systemFontOfSize:16];
        [_headBtn0 setTitle:@"教师签到" forState:normal];
        [_headBtn0 setTitleColor:RGBA(0xFF7A33, 1) forState:normal];
    }
    return _headBtn0;
}

-(UIButton *)headBtn1
{
    if(!_headBtn1)
    {
        _headBtn1 = [UIButton new];
        _headBtn1.titleLabel.font = [UIFont systemFontOfSize:16];
        [_headBtn1 setTitle:@"总结报告" forState:normal];
        [_headBtn1 setTitleColor:RGBA(0x666666, 1) forState:normal];
    }
    return _headBtn1;
}

-(UIButton *)headBtn2
{
    if(!_headBtn2)
    {
        _headBtn2 = [UIButton new];
        _headBtn2.titleLabel.font = [UIFont systemFontOfSize:16];
        [_headBtn2 setTitle:@"实习指导" forState:normal];
        [_headBtn2 setTitleColor:RGBA(0x666666, 1) forState:normal];
    }
    return _headBtn2;
}

-(UIButton *)headBtn3
{
    if(!_headBtn3)
    {
        _headBtn3 = [UIButton new];
        _headBtn3.titleLabel.font = [UIFont systemFontOfSize:16];
        [_headBtn3 setTitle:@"寻访记录" forState:normal];
        [_headBtn3 setTitleColor:RGBA(0x666666, 1) forState:normal];
    }
    return _headBtn3;
}

@end
