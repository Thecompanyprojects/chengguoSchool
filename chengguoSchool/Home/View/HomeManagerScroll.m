//
//  HomeManagerScroll.m
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import "HomeManagerScroll.h"
#import "FootView.h"
#import "homeCell.h"
#import "HomeReusableView.h"
#import "ColorGradientTool.h"
#import "FootView.h"

@interface HomeManagerScroll()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) FootView *footView;
@end

@implementation HomeManagerScroll

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.collectionView];
        [self addSubview:self.footView];
    }
    return self;
}

-(UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.headerReferenceSize = CGSizeMake(kScreenWidth, 56);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(20, 0, kScreenWidth-40, 90*s_ScaleWidth*9+56*3+80) collectionViewLayout:layout];
        [_collectionView registerClass:[homeCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
        [_collectionView registerClass:[HomeReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerV"];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = RGBA(0xFFFFFF, 1);
        _collectionView.layer.masksToBounds = true;
        _collectionView.layer.cornerRadius = 8;
        _collectionView.scrollEnabled = false;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}

-(FootView *)footView
{
    if(!_footView)
    {
        _footView = [FootView new];
        _footView.frame = CGRectMake(20, 90*s_ScaleWidth*9+56*3+80, kScreenWidth-40, 180);
    }
    return _footView;
}


#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0) {
        return 7;
    }
    if (section==1||section==2) {
        return 8;
    }
    
    return  7;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    homeCell *cell = (homeCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.nameLab.text = @"学院数量";
            cell.numLab.text = @"36";
        }
        if (indexPath.row==1) {
            cell.nameLab.text = @"专业数量";
            cell.numLab.text = @"133";
        }
        if (indexPath.row==2) {
            cell.nameLab.text = @"班级数量";
            cell.numLab.text = @"422";
        }
        if (indexPath.row==3) {
            cell.nameLab.text = @"指导教师";
            cell.numLab.text = @"32";
        }
        if (indexPath.row==4) {
            cell.nameLab.text = @"教师绑定率";
            cell.numLab.text = @"98%";
        }
        if (indexPath.row==5) {
            cell.nameLab.text = @"实习人数";
            cell.numLab.text = @"3264";
        }
        if (indexPath.row==6) {
            cell.nameLab.text = @"学生绑定率";
            cell.numLab.text = @"99";
        }
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            cell.nameLab.text = @"上岗人数";
            cell.numLab.text = @"36";
        }
        if (indexPath.row==1) {
            cell.nameLab.text = @"上岗率";
            cell.numLab.text = @"132";
        }
        if (indexPath.row==2) {
            cell.nameLab.text = @"企业数量";
            cell.numLab.text = @"42";
        }
        if (indexPath.row==3) {
            cell.nameLab.text = @"实习计划数";
            cell.numLab.text = @"4";
        }
        if (indexPath.row==4) {
            cell.nameLab.text = @"稳定率";
            cell.numLab.text = @"98%";
        }
        if (indexPath.row==5) {
            cell.nameLab.text = @"专业对口率";
            cell.numLab.text = @"80%";
        }
        if (indexPath.row==6) {
            cell.nameLab.text = @"去大城市人数";
            cell.numLab.text = @"999";
        }
        if (indexPath.row==7) {
            cell.nameLab.text = @"实习企业类型";
            cell.numLab.text = @"39";
        }
    }
    if (indexPath.section==2) {
        if (indexPath.row==0) {
            cell.nameLab.text = @"院系签到情况";
            cell.numLab.text = @"99%";
        }
        if (indexPath.row==1) {
            cell.nameLab.text = @"院周报提交率";
            cell.numLab.text = @"99%";
        }
        if (indexPath.row==2) {
            cell.nameLab.text = @"院周报批阅率";
            cell.numLab.text = @"97%";
        }
        if (indexPath.row==3) {
            cell.nameLab.text = @"平均转企业率";
            cell.numLab.text = @"95%";
        }
        if (indexPath.row==4) {
            cell.nameLab.text = @"平均转岗率";
            cell.numLab.text = @"95%";
        }
        if (indexPath.row==5) {
            cell.nameLab.text = @"平均对口率";
            cell.numLab.text = @"88%";
        }
        if (indexPath.row==6) {
            cell.nameLab.text = @"院实习工资情况";
            cell.numLab.text = @"94%";
        }
        if (indexPath.row==7) {
            cell.nameLab.text = @"学院考核优秀率";
            cell.numLab.text = @"94%";
        }
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    HomeReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerV" forIndexPath:indexPath];
    if (indexPath.section==0) {
        headView.iconImg.image = [UIImage imageNamed:@"home_rev0"];
        headView.nameLab.text = @"学校概况";
        [ColorGradientTool gradientStartColor:RGBA(0xE5EEFF, 1) endColor:RGBA(0xFEFFFF, 1) statusView:headView.bgView colorGradientDirection:ColorGradientDirectionForLeftToRight];
    }
    if (indexPath.section==1) {
        headView.iconImg.image = [UIImage imageNamed:@"home_rev1"];
        headView.nameLab.text = @"实习概况";
        [ColorGradientTool gradientStartColor:RGBA(0xFFF5E6, 1) endColor:RGBA(0xFEFFFF, 1) statusView:headView.bgView colorGradientDirection:ColorGradientDirectionForLeftToRight];
    }
    if (indexPath.section==2) {
        headView.iconImg.image = [UIImage imageNamed:@"home_rev2"];
        headView.nameLab.text = @"实习质量";
        [ColorGradientTool gradientStartColor:RGBA(0xE6FAFF, 1) endColor:RGBA(0xFEFFFF, 1) statusView:headView.bgView colorGradientDirection:ColorGradientDirectionForLeftToRight];
    }
    return headView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(103*s_ScaleWidth, 90*s_ScaleWidth);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"123");
}

@end
