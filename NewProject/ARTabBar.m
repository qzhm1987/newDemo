//
//  ARTabBar.m
//  NewProject
//
//  Created by youdian on 2019/2/28.
//  Copyright © 2019 BeiJingXiaoMenTong. All rights reserved.
//

#import "ARTabBar.h"

@interface ARTabBar ()


@property (strong, nonatomic)UIButton *selectedBtn;
@end




@implementation ARTabBar

-(void)setItems:(NSArray *)items{
    _items = items;
    NSInteger index = 0;
    for (UITabBarItem *item  in items) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:item.image forState:UIControlStateNormal];
        [button setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        button.tag = index;
        index++;
        [button addTarget:self action:@selector(btnDidOnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    for (int i = 0; i<self.items.count; i++) {
        UIButton *btn = self.subviews[i];
        CGFloat width = self.frame.size.width / self.items.count;
        CGFloat height = self.frame.size.height;
        btn.frame = CGRectMake(i * width, 0, width-1, height);
    }
    
}

- (void)btnDidOnClick:(UIButton *)btn{
    // 三部曲
    self.selectedBtn.selected = NO; // 上一个按钮取消选中
    btn.selected = YES; // 当前按钮设置选中
    self.selectedBtn = btn; // 当前按钮赋值给selectedBtn
    if ([self.delegate respondsToSelector:@selector(ARtabBar:withSelectedIndex:)]) {
        [self.delegate ARtabBar:self withSelectedIndex:btn.tag];
    }
    
    
}

-(void)dealloc{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
