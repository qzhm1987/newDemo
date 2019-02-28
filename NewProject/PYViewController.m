//
//  PYViewController.m
//  NewProject
//
//  Created by youdian on 2019/2/28.
//  Copyright © 2019 BeiJingXiaoMenTong. All rights reserved.
//

#import "PYViewController.h"
#import "ARTabBar.h"

@interface PYViewController ()<ARTabBarDelegate>
@property (strong, nonatomic)NSMutableArray *items;
@property (strong, nonatomic)ARTabBar *arTabBar;


@end

@implementation PYViewController

-(NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildVC];
    [self setupTabBar];
}

- (void)setupChildVC{
    UIViewController *oneVC = [[UIViewController alloc] init];
    UIViewController *twoVC = [[UIViewController alloc] init];
    UIViewController *threeVC = [[UIViewController alloc] init];
    oneVC.view.backgroundColor = [UIColor whiteColor];
    twoVC.view.backgroundColor = [UIColor yellowColor];
    threeVC.view.backgroundColor = [UIColor redColor];
    
    
    [self setupChildVC:oneVC image:@"矩形 1 拷贝 2" selectedImage:@"矩形 1" title:@"home"];
    [self setupChildVC:twoVC image:@"图层 51 拷贝 3" selectedImage:@"图层 51 拷贝 4" title:@"AR"];
    [self setupChildVC:threeVC image:@"矩形 1 拷贝 3" selectedImage:@"矩形 1 拷贝" title:@"eBook"];
    
}

- (void)setupChildVC:(UIViewController *)childVC image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title{
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVC];
    childVC.tabBarItem.image = [UIImage imageNamed:image];
    childVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    childVC.tabBarItem.title = title;
    [self.items addObject:childVC.tabBarItem];
    [self addChildViewController:nav];
}

- (void)setupTabBar
{
    ARTabBar *tabBar = [[ARTabBar alloc] init];
    tabBar.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49);
    // iphone 4、5、6 tabBar高度为49
    
    // iPhone 4、5、6 UINavigationBar高度为44
    // iphone 4、5、6 UINavigationBarBackGround高度为64 所以会有状态栏被导航栏同化的现象
    
    tabBar.items = self.items; // 不能 tabBar.items = self.tabBar.items;
    
    [self.view addSubview:tabBar];
    
    tabBar.delegate = self;
    
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView *subView in self.arTabBar.subviews) {
        if (![subView isKindOfClass:[ARTabBar class]]) {
            // 移除原生tabBar上的item
            [subView removeFromSuperview];
        }
    }
}

#pragma mark ARTabBarDelegate

-(void)ARtabBar:(ARTabBar *)tabBar withSelectedIndex:(NSInteger)selectedIndex{
    
    self.selectedIndex = selectedIndex;
}

@end
