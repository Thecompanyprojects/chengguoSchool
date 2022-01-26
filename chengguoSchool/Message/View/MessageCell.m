//
//  MessageCell.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import "MessageCell.h"

@implementation MessageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.contentView.backgroundColor = RGBA(0xF1F6FB, 1);
        [self.contentView addSubview:self.bgView];
        [self.contentView addSubview:self.pointView];
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.timeLab];
        [self.contentView addSubview:self.messageLab];
        [self.contentView addSubview:self.messageLab1];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.allLab];
        [self.contentView addSubview:self.rightImg];
        [self setuplayout];
    }
    return self;
}
-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(141);
        make.centerY.equalTo(weakSelf);
        make.centerX.equalTo(weakSelf);
        make.left.equalTo(weakSelf).offset(20);
    }];
    [weakSelf.pointView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(8);
        make.height.mas_offset(8);
        make.left.equalTo(weakSelf.bgView).offset(16);
        make.top.equalTo(weakSelf.bgView).offset(16);
    }];
    [weakSelf.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.pointView);
        make.left.equalTo(weakSelf.pointView.mas_right).offset(4);
        make.height.mas_offset(18);
    }];
    [weakSelf.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.pointView);
        make.right.equalTo(weakSelf.bgView).offset(-16);
        make.height.mas_offset(18);
    }];
    [weakSelf.messageLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(16);
        make.centerX.equalTo(weakSelf.bgView);
        make.top.equalTo(weakSelf.nameLab.mas_bottom).offset(15);
        
    }];
    [weakSelf.messageLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.bgView).offset(16);
        make.centerX.equalTo(weakSelf.bgView);
        make.top.equalTo(weakSelf.messageLab.mas_bottom).offset(5);
        
    }];

    [weakSelf.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(1);
        make.left.equalTo(weakSelf.bgView);
        make.centerX.equalTo(weakSelf.bgView);
        make.bottom.equalTo(weakSelf.bgView).offset(-30);
    }];
    [weakSelf.allLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.pointView);
        make.height.mas_offset(30);
        make.bottom.equalTo(weakSelf.bgView);
    }];
    [weakSelf.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.allLab);
        make.right.equalTo(weakSelf.bgView).offset(-16);
        make.width.mas_offset(16);
        make.height.mas_offset(16);
    }];
}

#pragma mark - getters

-(UIView *)bgView
{
    if(!_bgView)
    {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.frame = CGRectMake(0, 0, kScreenWidth-40, 56);
        _bgView.layer.masksToBounds = true;
        _bgView.layer.cornerRadius = 4;
    }
    return _bgView;
}


-(UIView *)pointView
{
    if(!_pointView)
    {
        _pointView = [UIView new];
        _pointView.layer.masksToBounds = true;
        _pointView.layer.cornerRadius = 4;
        _pointView.backgroundColor = [UIColor blueColor];
    }
    return _pointView;
}

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:16];
        _nameLab.textColor = RGBA(0x333333, 1);
    }
    return _nameLab;
}

-(UILabel *)timeLab
{
    if(!_timeLab)
    {
        _timeLab = [UILabel new];
        _timeLab.font = [UIFont systemFontOfSize:12];
        _timeLab.textColor = RGBA(0x999999, 1);
        _timeLab.textAlignment = NSTextAlignmentRight;
    }
    return _timeLab;
}

-(UILabel *)messageLab
{
    if(!_messageLab)
    {
        _messageLab = [UILabel new];
        _messageLab.font = [UIFont systemFontOfSize:14];
        _messageLab.textColor = RGBA(0x666666, 1);
        
    }
    return _messageLab;
}

-(UILabel *)messageLab1
{
    if(!_messageLab1)
    {
        _messageLab1 = [UILabel new];
        _messageLab1.font = [UIFont systemFontOfSize:16];
        _messageLab1.textColor = RGBA(0x666666, 1);
        
    }
    return _messageLab1;
}

-(UIView *)lineView
{
    if(!_lineView)
    {
        _lineView = [UIView new];
        _lineView.backgroundColor = RGBA(0xE1E1E1, 1);
    }
    return _lineView;
}

-(UILabel *)allLab
{
    if(!_allLab)
    {
        _allLab = [UILabel new];
        _allLab.textColor = [UIColor blackColor];
        _allLab.font = [UIFont systemFontOfSize:14];
        _allLab.text = @"查看详情";
    }
    return _allLab;
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
