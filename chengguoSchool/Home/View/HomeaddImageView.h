//
//  HomeaddImageView.h
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol worktagsAddImageDelegate
-(void)addImagefileWith:(UIView *)cell;
-(void)deleteImgwithFileCell:(NSIndexPath *)index;
@end
@interface HomeaddImageView : UIView
@property (nonatomic,strong) NSMutableArray *chooseImgArray;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (weak, nonatomic)id<worktagsAddImageDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
