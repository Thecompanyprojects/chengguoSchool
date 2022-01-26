//
//  StatisticsCell.h
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StatisticsCell : UITableViewCell
@property (nonatomic,strong) UIView *bgView;
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) UILabel *messageLab;
@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) UIButton *rightBtn;

@end

NS_ASSUME_NONNULL_END
