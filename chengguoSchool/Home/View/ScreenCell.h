//
//  ScreenCell.h
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScreenCell : UITableViewCell
@property (nonatomic,strong) UILabel *nameLab;
@property (nonatomic,strong) UIButton *messageLab0;
@property (nonatomic,strong) UIButton *messageLab1;
@property (nonatomic,assign) bool messageChoose0;
@property (nonatomic,assign) bool messageChoose1;
@end

NS_ASSUME_NONNULL_END
