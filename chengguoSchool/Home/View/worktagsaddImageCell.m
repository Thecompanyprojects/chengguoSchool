//
//  worktagsaddImageCell.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "worktagsaddImageCell.h"

@interface worktagsaddImageCell()

@end

@implementation worktagsaddImageCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.addImg];
        [self.contentView addSubview:self.deleteBtn];
        [self setuplayout];
    }
    return self;
}

- (void)setModel:(tasksChooseImgModel *)model
{
    if ([model.typeStr intValue]==1) {
        self.addImg.image = model.fileImage;
        self.deleteBtn.hidden = false;
    }
    else
    {
        self.deleteBtn.hidden = true;
        self.addImg.image = [UIImage imageNamed:@"update_image"];
    }
}

-(void)setuplayout
{
    __weak typeof (self) weakSelf = self;
    [weakSelf.addImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf);
        make.top.equalTo(weakSelf).with.offset(10);
        make.right.equalTo(weakSelf).with.offset(-10);
        make.bottom.equalTo(weakSelf);
    }];
    [weakSelf.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_offset(20);
        make.height.mas_offset(20);
        make.top.equalTo(weakSelf);
        make.right.equalTo(weakSelf);
    }];
}

#pragma mark - getters

-(UIImageView *)addImg
{
    if(!_addImg)
    {
        _addImg = [UIImageView new];
        _addImg.layer.masksToBounds = true;
        _addImg.layer.cornerRadius = 6;
        _addImg.image = [UIImage imageNamed:@"update_image"];
    }
    return _addImg;
}

-(UIImageView *)deleteBtn
{
    if(!_deleteBtn)
    {
        _deleteBtn = [UIImageView new];
        _deleteBtn.image = [UIImage imageNamed:@"picDelete"];
        _deleteBtn.hidden = true;
        _deleteBtn.userInteractionEnabled = true;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(deletebtnClick)];
        [_deleteBtn addGestureRecognizer:singleTap];
    }
    return _deleteBtn;
}

-(void)deletebtnClick
{
    if (self.delegate) {
        [self.delegate deletefileWith:self];
    }
}


@end
