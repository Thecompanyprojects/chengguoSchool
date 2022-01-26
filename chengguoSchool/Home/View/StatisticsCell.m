//
//  StatisticsCell.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "StatisticsCell.h"

@interface StatisticsCell()
@property (nonatomic,strong) UIView *lineView0;
@property (nonatomic,strong) UIView *lineView1;
@end

@implementation StatisticsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.contentView.backgroundColor = RGBA(0xF1F6FB, 1);
        [self.contentView addSubview:self.bgView];
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.messageLab];
        [self.contentView addSubview:self.leftBtn];
        [self.contentView addSubview:self.rightBtn];
        [self.contentView addSubview:self.lineView0];
        [self.contentView addSubview:self.lineView1];
        [self setuplayout];
    }
    return self;
}
-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(20);
        make.top.equalTo(weakSelf).offset(8);
        make.height.mas_offset(118);
        make.centerX.equalTo(weakSelf);
    }];
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(16);
        make.top.equalTo(weakSelf.bgView).offset(16);
        make.centerX.equalTo(weakSelf.bgView);
    }];
    [weakSelf.messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nameLab);
        make.centerX.equalTo(weakSelf.nameLab);
        make.top.equalTo(weakSelf.nameLab.mas_bottom).offset(12);
    }];
    [weakSelf.lineView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.bgView).offset(-44);
        make.left.equalTo(weakSelf.bgView);
        make.height.mas_offset(1);
        make.centerX.equalTo(weakSelf.bgView);
    }];
    [weakSelf.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(1);
        make.centerX.equalTo(weakSelf.bgView);
        make.top.equalTo(weakSelf.lineView0);
        make.bottom.equalTo(weakSelf.bgView);
    }];
    [weakSelf.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineView0);
        make.right.equalTo(weakSelf.lineView1.mas_left);
        make.left.equalTo(weakSelf.bgView);
        make.bottom.equalTo(weakSelf.bgView);
    }];
    [weakSelf.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.lineView0);
        make.left.equalTo(weakSelf.lineView1.mas_right);
        make.right.equalTo(weakSelf.bgView);
        make.bottom.equalTo(weakSelf.bgView);
    }];
}

#pragma mark - getters

-(UIView *)bgView
{
    if(!_bgView)
    {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.masksToBounds = true;
        _bgView.layer.cornerRadius = 8;
    }
    return _bgView;
}

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.textColor = [UIColor blackColor];
        _nameLab.font = [UIFont systemFontOfSize:16];
    }
    return _nameLab;
}


-(UILabel *)messageLab
{
    if(!_messageLab)
    {
        _messageLab = [UILabel new];
        _messageLab.textColor = [UIColor blackColor];
        _messageLab.font = [UIFont systemFontOfSize:14];
    }
    return _messageLab;
}

-(UIView *)lineView0
{
    if(!_lineView0)
    {
        _lineView0 = [UIView new];
        _lineView0.backgroundColor = RGBA(0xE1E1E1, 1);
    }
    return _lineView0;
}


-(UIView *)lineView1
{
    if(!_lineView1)
    {
        _lineView1 = [UIView new];
        _lineView1.backgroundColor = RGBA(0xE1E1E1, 1);
    }
    return _lineView1;
}

-(UIButton *)leftBtn
{
    if(!_leftBtn)
    {
        _leftBtn = [UIButton new];
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_leftBtn setTitleColor:[UIColor blackColor] forState:normal];
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_leftBtn setTitle:@"驳回" forState:normal];
    }
    return _leftBtn;
}

-(UIButton *)rightBtn
{
    if(!_rightBtn)
    {
        _rightBtn = [UIButton new];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_rightBtn setTitleColor:[UIColor blackColor] forState:normal];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_rightBtn setTitle:@"同意" forState:normal];
    }
    return _rightBtn;
}



@end
