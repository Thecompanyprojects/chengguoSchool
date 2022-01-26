//
//  worktagsaddImageCell.h
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/23.
//

#import <UIKit/UIKit.h>
#import "tasksChooseImgModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol deleteImageDelegate
-(void)deletefileWith:(UICollectionViewCell *)cell;
@end
@interface worktagsaddImageCell : UICollectionViewCell
@property (nonatomic,strong) tasksChooseImgModel *model;
@property (weak, nonatomic)id<deleteImageDelegate> delegate;
@property (nonatomic,strong) UIImageView *addImg;
@property (nonatomic,strong) UIImageView *deleteBtn;
@end

NS_ASSUME_NONNULL_END
