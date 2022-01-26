//
//  MessageCell.h
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageCell : UITableViewCell
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UIView *pointView;
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) UILabel *timeLab;
@property (nonatomic,strong) UILabel *messageLab;
@property (nonatomic,strong) UILabel *messageLab1;
@property (nonatomic,strong) UIView *lineView;
@property (nonatomic,strong) UILabel *allLab;
@property (nonatomic,strong) UIImageView *rightImg;
@end

NS_ASSUME_NONNULL_END
