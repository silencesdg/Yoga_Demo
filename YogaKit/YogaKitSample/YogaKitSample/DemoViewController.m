//
//  DemoViewController.m
//  YogaKitSample
//
//  Created by skladmin on 2017/1/3.
//  Copyright © 2017年 facebook. All rights reserved.
//

#import "DemoViewController.h"
#import "UIView+Yoga.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.identifier;
    self.view.backgroundColor = [UIColor lightGrayColor];
   
    
    SEL method = NSSelectorFromString([NSString stringWithFormat:@"%@Demo",self.identifier]);
    if ([self respondsToSelector:method]) {
        [self performSelector:method];
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - demos

- (void)FlexDirectionDemo
{
    /*
    YGFlexDirectionColumn
    YGFlexDirectionColumnReverse,
    YGFlexDirectionRow,
    YGFlexDirectionRowReverse
     */

    UIView *root = self.view;
    [root yg_setUsesYoga:YES];
    //书写方向
    [root yg_setDirection:YGDirectionRTL];
    //伸缩方向
    [root yg_setFlexDirection:YGFlexDirectionColumn];
    [root yg_setPadding:80 forEdge:YGEdgeTop];
    
    UIView *child1 = [UIView new];
    child1.backgroundColor = [UIColor blueColor];
    [child1 yg_setUsesYoga:YES];
    [child1 yg_setWidth:100];
    [child1 yg_setHeight:100];
    
    UIView *child2 = [UIView new];
    child2.backgroundColor = [UIColor greenColor];
    child2.frame = (CGRect) {
        .size = {
            .width = 200,
            .height = 100,
        }
    };
    
    UIView *child3 = [UIView new];
    child3.backgroundColor = [UIColor yellowColor];
    child3.frame = (CGRect) {
        .size = {
            .width = 100,
            .height = 100,
        }
    };
    

    [child2 addSubview:child3];
    [root addSubview:child2];
    [root addSubview:child1];
    
    [root yg_applyLayout];
    
}

- (void)JustifyContentDemo
{
    UIView *root = self.view;
    [root yg_setUsesYoga:YES];
    [root yg_setFlexDirection:YGFlexDirectionRow];
    [root yg_setPadding:80 forEdge:YGEdgeTop];
    /*
     YGJustifyFlexStart,
     YGJustifyCenter,
     YGJustifyFlexEnd,
     YGJustifySpaceBetween,
     YGJustifySpaceAround,
     */
    [root yg_setJustifyContent:YGJustifyCenter];
    root.tag = 100;
    
    UIView *child1 = [UIView new];
    child1.backgroundColor = [UIColor blueColor];
    [child1 yg_setUsesYoga:YES];
    [child1 yg_setWidth:200];
    [child1 yg_setHeight:80];
    child1.tag = 1000;
    
    UIView *child2 = [UIView new];
    child2.backgroundColor = [UIColor greenColor];
    [child2 yg_setUsesYoga:YES];
    [child2 yg_setWidth:50];
    [child2 yg_setHeight:50];
    
    child2.tag = 2000;
    
    UIView *child3 = [UIView new];
    child3.backgroundColor = [UIColor yellowColor];
    [child3 yg_setUsesYoga:YES];
    [child3 yg_setWidth:50];
    [child3 yg_setHeight:50];
    child3.tag = 3000;
    
    
    [root addSubview:child3];
    [root addSubview:child2];
    [root addSubview:child1];
    
    [root yg_applyLayout];
}

- (void)FlexWrapDemo
{
    UIView *root = self.view;
    [root yg_setUsesYoga:YES];
    [root yg_setFlexDirection:YGFlexDirectionRow];
    [root yg_setPadding:80 forEdge:YGEdgeTop];
    [root yg_setJustifyContent:YGJustifyFlexStart];
    /*
     YGWrapNoWrap,
     YGWrapWrap,
     */
    [root yg_setFlexWrap:YGWrapWrap];
    root.tag = 100;
    
    for (int i = 0; i < 20; i++) {
        UIView *child1 = [UIView new];
        child1.backgroundColor = [UIColor blueColor];
        [child1 yg_setUsesYoga:YES];
        [child1 yg_setMargin:10 forEdge:YGEdgeAll];
        [child1 yg_setWidth:50];
        [child1 yg_setHeight:50];
        [root addSubview:child1];
    }
    
    [root yg_applyLayout];
}

- (void)AlignmentDemo
{
    UIView *root = self.view;
    [root yg_setUsesYoga:YES];
    [root yg_setDirection:YGDirectionLTR];
    [root yg_setFlexDirection:YGFlexDirectionRow];
    [root yg_setPadding:80 forEdge:YGEdgeTop];
    [root yg_setJustifyContent:YGJustifyFlexStart];
    /*
     YGAlignAuto,
     YGAlignFlexStart,
     YGAlignCenter,
     YGAlignFlexEnd,
     YGAlignStretch,
     */
    [root yg_setAlignItems:YGAlignStretch];
    root.tag = 100;
    
    UIView *child1 = [UIView new];
    child1.backgroundColor = [UIColor blueColor];
    [child1 yg_setUsesYoga:YES];
    [child1 yg_setWidth:50];
    [child1 yg_setHeight:50];
    child1.tag = 1000;
    
    UIView *child2 = [UIView new];
    child2.backgroundColor = [UIColor greenColor];
    child2.frame = (CGRect) {
        .size = {
            .width = 50,
            .height = 50,
        }
    };
    
    child2.tag = 2000;
    
    UIView *child3 = [UIView new];
    child3.backgroundColor = [UIColor yellowColor];
    child3.frame = (CGRect) {
        .size = {
            .width = 50,
            .height = 50,
        }
    };
    child3.tag = 3000;
    
    
    [root addSubview:child1];
    [root addSubview:child2];
    [root addSubview:child3];
    
    [root yg_applyLayout];
}

- (void)FlexGrowDemo
{
    UIView *root = self.view;
    [root yg_setUsesYoga:YES];
    [root yg_setFlexDirection:YGFlexDirectionRow];
    [root yg_setPadding:80 forEdge:YGEdgeTop];
    [root yg_setJustifyContent:YGJustifyCenter];
//    [root yg_setFlexWrap:YGWrapWrap];
    root.tag = 100;
    
    UIView *child1 = [UIView new];
    child1.backgroundColor = [UIColor blueColor];
    [child1 yg_setUsesYoga:YES];
    [child1 yg_setWidth:50];
    [child1 yg_setHeight:50];
    [child1 yg_setFlexGrow:1];
    child1.tag = 1000;
    
    UIView *child2 = [UIView new];
    child2.backgroundColor = [UIColor greenColor];
    [child2 yg_setUsesYoga:YES];
    [child2 yg_setWidth:50];
    [child2 yg_setHeight:50];
    [child2 yg_setFlexGrow:2];
    child2.tag = 2000;
    
    UIView *child3 = [UIView new];
    child3.backgroundColor = [UIColor yellowColor];
    [child3 yg_setUsesYoga:YES];
    [child3 yg_setWidth:50];
    [child3 yg_setHeight:50];
    [child3 yg_setFlexGrow:3];
    child3.tag = 3000;
    // 1:2:3 是剩余空间的比例 不是整体比例
    
    [root addSubview:child1];
    [root addSubview:child2];
    [root addSubview:child3];
    
    [root yg_applyLayout];
}

- (void)FlexShrinkDemo
{
    UIView *root = self.view;
    [root yg_setUsesYoga:YES];
    [root yg_setFlexDirection:YGFlexDirectionRow];
    [root yg_setPadding:80 forEdge:YGEdgeTop];
    [root yg_setJustifyContent:YGJustifyCenter];
    //    [root yg_setFlexWrap:YGWrapWrap];
    root.tag = 100;
    
    UIView *child1 = [UIView new];
    child1.backgroundColor = [UIColor blueColor];
    [child1 yg_setUsesYoga:YES];
    [child1 yg_setWidth:300];
    [child1 yg_setHeight:100];
    [child1 yg_setFlexShrink:1];
    child1.tag = 1000;
    
    UIView *child2 = [UIView new];
    child2.backgroundColor = [UIColor greenColor];
    [child2 yg_setUsesYoga:YES];
    [child2 yg_setWidth:300];
    [child2 yg_setHeight:200];
    [child2 yg_setFlexShrink:2];
    child2.tag = 2000;
    
    UIView *child3 = [UIView new];
    child3.backgroundColor = [UIColor yellowColor];
    [child3 yg_setUsesYoga:YES];
    [child3 yg_setWidth:300];
    [child3 yg_setHeight:300];
    [child3 yg_setFlexShrink:3];
    child3.tag = 3000;
    // 1:2:3 是缩小长度的比例 不是整体比例
    
    [root addSubview:child1];
    [root addSubview:child2];
    [root addSubview:child3];
    
    [root yg_applyLayout];

}

- (void)FlexBasisDemo
{
    UIView *root = self.view;
    [root yg_setUsesYoga:YES];
    [root yg_setFlexDirection:YGFlexDirectionRow];
    [root yg_setPadding:80 forEdge:YGEdgeTop];
    [root yg_setJustifyContent:YGJustifyCenter];
    root.tag = 100;
    
    UIView *child1 = [UIView new];
    child1.backgroundColor = [UIColor blueColor];
    [child1 yg_setUsesYoga:YES];
    [child1 yg_setHeight:100];
    //主轴长度 main-size
    [child1 yg_setFlexBasis:50];
    child1.tag = 1000;
    
    UIView *child2 = [UIView new];
    child2.backgroundColor = [UIColor greenColor];
    [child2 yg_setUsesYoga:YES];
    [child2 yg_setHeight:200];
    [child2 yg_setFlexBasis:100];
    child2.tag = 2000;
    
    UIView *child3 = [UIView new];
    child3.backgroundColor = [UIColor yellowColor];
    [child3 yg_setUsesYoga:YES];
    [child3 yg_setHeight:300];
    [child3 yg_setFlexBasis:200];
    child3.tag = 3000;
    // 1:2:3 是缩小长度的比例 不是整体比例
    
    [root addSubview:child1];
    [root addSubview:child2];
    [root addSubview:child3];
    
    [root yg_applyLayout];
}

- (void)AbsolutePositioningDemo
{
    UIView *root = self.view;
    [root yg_setUsesYoga:YES];
    //修改书写方向
    [root yg_setDirection:YGDirectionRTL];
    
    [root yg_setFlexDirection:YGFlexDirectionRow];
    [root yg_setPadding:80 forEdge:YGEdgeTop];
    [root yg_setJustifyContent:YGJustifyCenter];
    [root yg_setPositionType:YGPositionTypeAbsolute];
    root.tag = 100;
    
    UIView *child1 = [UIView new];
    child1.backgroundColor = [UIColor blueColor];
    [child1 yg_setUsesYoga:YES];
    [child1 yg_setWidth:50];
    [child1 yg_setHeight:300];
    
    child1.tag = 1000;
    
    UIView *child2 = [UIView new];
    child2.backgroundColor = [UIColor greenColor];
    [child2 yg_setUsesYoga:YES];
    [child2 yg_setWidth:50];
    [child2 yg_setHeight:50];
    
    //相对于原位置的偏移
    [child2 yg_setPosition:-50 forEdge:YGEdgeLeft];//绝对布局和书写方向无关
    [child2 yg_setPosition:300 forEdge:YGEdgeVertical];
    child2.tag = 2000;
    
    UIView *child3 = [UIView new];
    child3.backgroundColor = [UIColor yellowColor];
    [child3 yg_setUsesYoga:YES];
    [child3 yg_setWidth:50];
    [child3 yg_setHeight:50];
    child3.tag = 3000;
    
    [root addSubview:child1];
    [root addSubview:child2];
    [root addSubview:child3];
    
    [root yg_applyLayout];
}

- (void)MarginPaddingDemo
{
    UIView *root = self.view;
    [root yg_setUsesYoga:YES];
    [root yg_setFlexDirection:YGFlexDirectionRow];
    
    //设置padding
    [root yg_setPadding:80 forEdge:YGEdgeTop];
    
    [root yg_setJustifyContent:YGJustifyCenter];
    [root yg_setPositionType:YGPositionTypeAbsolute];
    root.tag = 100;
    
    UIView *child1 = [UIView new];
    child1.backgroundColor = [UIColor blueColor];
    [child1 yg_setUsesYoga:YES];
    [child1 yg_setWidth:50];
    [child1 yg_setHeight:50];
    [child1 yg_setMargin:100 forEdge:YGEdgeTop];
    child1.tag = 1000;
    
    UIView *child2 = [UIView new];
    child2.backgroundColor = [UIColor greenColor];
    [child2 yg_setUsesYoga:YES];
    [child2 yg_setWidth:100];
    [child2 yg_setHeight:100];
    [child2 yg_setMargin:50 forEdge:YGEdgeTop];
    [child2 yg_setPadding:20 forEdge:YGEdgeAll];
    child2.tag = 2000;
    
    UIView *child3 = [UIView new];
    child3.backgroundColor = [UIColor yellowColor];
    [child3 yg_setUsesYoga:YES];
    [child3 yg_setWidth:50];
    [child3 yg_setHeight:50];
    //padding margin 会叠加
    [child3 yg_setMargin:50 forEdge:YGEdgeTop];
    child3.tag = 3000;
    
    [root addSubview:child1];
    [root addSubview:child2];
    [child2 addSubview:child3];
    
    [root yg_applyLayout];
}

- (void)AspectRatioDemo
{
    UIView *root = self.view;
    [root yg_setUsesYoga:YES];
    [root yg_setFlexDirection:YGFlexDirectionRow];
    
    //设置padding
    [root yg_setPadding:80 forEdge:YGEdgeTop];
    
    [root yg_setJustifyContent:YGJustifyCenter];
    [root yg_setPositionType:YGPositionTypeAbsolute];
    root.tag = 100;
    
    UIView *child1 = [UIView new];
    child1.backgroundColor = [UIColor blueColor];
    [child1 yg_setUsesYoga:YES];
    [child1 yg_setWidth:100];
    //宽\高
    [child1 yg_setAspectRatio:2];
    child1.tag = 1000;
    
    UIView *child2 = [UIView new];
    child2.backgroundColor = [UIColor greenColor];
    [child2 yg_setUsesYoga:YES];
    [child2 yg_setHeight:100];
    [child2 yg_setAspectRatio:0.5];
    child2.tag = 2000;
    
    UIView *child3 = [UIView new];
    child3.backgroundColor = [UIColor yellowColor];
    [child3 yg_setUsesYoga:YES];
    child3.frame = (CGRect) {
        .size = {
            .width = 100,
            .height = 100,
        }
    };
    [child3 yg_setAspectRatio:0.5];
    child3.tag = 3000;
    
    [root addSubview:child1];
    [root addSubview:child2];
    [root addSubview:child3];
    
    [root yg_applyLayout];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
