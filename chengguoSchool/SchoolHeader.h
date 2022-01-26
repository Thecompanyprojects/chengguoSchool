//
//  SchoolHeader.h
//  chengguoSchool
//
//  Created by 王俊钢 on 2021/11/22.
//

#ifndef SchoolHeader_h
#define SchoolHeader_h

#define RGBA(X,A) [UIColor colorWithRed:((float)((X & 0xFF0000) >> 16))/255.0 green:((float)((X & 0xFF00) >> 8))/255.0 blue:((float)(X & 0xFF))/255.0 alpha:A*1.0]

#define kScreenBounds [[UIScreen mainScreen] bounds]

#define kScreenWidth kScreenBounds.size.width

#define kScreenHeight kScreenBounds.size.height

#define KNavHeight self.navigationController.navigationBar.frame.size.height + [[UIApplication sharedApplication] statusBarFrame].size.height

#define s_ScaleWidth  kScreenBounds.size.width/375

#define s_ScaleHeight kScreenBounds.size.height/667

#endif /* SchoolHeader_h */
