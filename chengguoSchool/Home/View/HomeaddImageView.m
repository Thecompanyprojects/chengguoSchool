//
//  HomeaddImageView.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "HomeaddImageView.h"
#import "worktagsaddImageCell.h"

@interface HomeaddImageView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,deleteImageDelegate>
@property (nonatomic,strong) UILabel *nameLab;
@end

@implementation HomeaddImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.nameLab];
        [self configureCollectionView];
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
}

#pragma mark - getters

-(UILabel *)nameLab
{
    if(!_nameLab)
    {
        _nameLab = [UILabel new];
        _nameLab.font = [UIFont systemFontOfSize:16];
        _nameLab.textColor = RGBA(0x333333, 1);
        _nameLab.text = @"照片";
    }
    return _nameLab;
}

- (void)configureCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(72, 72);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(20, 30, kScreenWidth-40, 180) collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false;
    self.collectionView.showsVerticalScrollIndicator = false;
    self.collectionView.showsHorizontalScrollIndicator = false;
    self.collectionView.scrollEnabled = false;
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.collectionView];
    [self.collectionView registerClass:[worktagsaddImageCell class] forCellWithReuseIdentifier:@"cell0"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.chooseImgArray.count?:0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    worktagsaddImageCell *cell = (worktagsaddImageCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell0" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.delegate = self;
    if (self.chooseImgArray.count!=0) {
        cell.model = self.chooseImgArray[indexPath.item];
        if (indexPath.item==4) {
            [cell.addImg setHidden:true];
            
        }
        else{
            [cell.addImg setHidden:false];
        }
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    tasksChooseImgModel *model = self.chooseImgArray[indexPath.item];
    if ([model.typeStr intValue]==0) {
        if (self.delegate) {
            [self.delegate addImagefileWith:self];
        }
    }
}

-(void)deletefileWith:(UICollectionViewCell *)cell{
    NSIndexPath *index = [self.collectionView indexPathForCell:cell];
    if (self.delegate) {
        [self.delegate deleteImgwithFileCell:index];
    }
//    [self.chooseImgArray removeObjectAtIndex:index.item];
//    [self.collectionView reloadData];
}


@end
