//
//  ARTabBar.h
//  NewProject
//
//  Created by youdian on 2019/2/28.
//  Copyright © 2019 BeiJingXiaoMenTong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ARTabBar;
@protocol ARTabBarDelegate <NSObject>

-(void)ARtabBar:(ARTabBar *)tabBar withSelectedIndex:(NSInteger )selectedIndex;


@end

NS_ASSUME_NONNULL_BEGIN

@interface ARTabBar : UIView
@property (strong, nonatomic)NSArray *items;
@property (strong, nonatomic)UITabBarController *tabBarController;
@property (nonatomic,weak) id<ARTabBarDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
