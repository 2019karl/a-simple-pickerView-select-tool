//
//  GPickView.h
//  Gengmiao_IOS
//
//  Created by MJN on 16/3/24.
//  Copyright © 2016年 chenzb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPickView : UIView

@property (nonatomic,strong) void(^mSelecStrBlock)(NSString *type);

/**
 *  初始化方法
 *
 *  @param arr_ 数据源
 *
 *  @return
 */
+ (instancetype)initPickViewWithDataSource:(NSArray *)arr_ WithSelecBlock:(void (^)(NSString *type))mSelecBlock;

- (void)show;

@end
