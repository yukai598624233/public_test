//
//  AutoLayoutViewController.m
//  自动布局
//
//  Created by 虞凯 on 2019/8/14.
//  Copyright © 2019 虞凯. All rights reserved.
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    /*
     * 需求
     *
     * 我们需要布局红(redView)、蓝(blueView)、黑(blackView)三个view位置如图所示，
     * 他们距离父视图边距以及相互之间的距离都为30px，红色view和绿色view宽度相等，
     * 并且三个view的高度相等。并且在横屏时，他们的位置还是一样保持不变。
     *
     */
    
    //1.首先，创建视图控件，添加到self.view上
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView * blackView = [[UIView alloc]init];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
    
    //2.然后，记得要把AutoresizingMask布局关掉
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    blackView.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    //3.接着，添加约束，先添加边距约束，再添加宽高约束（个人习惯）
    /*
     * 添加约束 公式：item1.attribute = multiplier ⨉ item2.attribute + constant
     */
    //redView top与self.view 的top距离为30
    NSLayoutConstraint *redViewTopToSuperViewTop = [NSLayoutConstraint constraintWithItem:redView
                                                                                attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:30];
    
    //redView left与self.vie的left的距离为30
    NSLayoutConstraint *redViewLeftToSuperViewLeft = [NSLayoutConstraint constraintWithItem:redView
                                                                                  attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:30];
    //redView right与blueView的left的距离为30
    
    NSLayoutConstraint *redViewRightToBlueViewRight = [NSLayoutConstraint constraintWithItem:redView
                                                                                   attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeLeft multiplier:1 constant:-30];
    //redView bottom与blackView的top的距离为30
    
    NSLayoutConstraint *redViewBottomToBlackViewTop = [NSLayoutConstraint constraintWithItem:redView
                                                                                   attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blackView attribute:NSLayoutAttributeTop multiplier:1 constant:-30];
    
    //blueView的right与self.view的right的距离为30
    
    NSLayoutConstraint *blueViewRightToSuperViewRight = [NSLayoutConstraint constraintWithItem:blueView
                                                                                     attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-30];
    
    //    //blueView的bottom与blackView的top的距离为30
    //
    //    NSLayoutConstraint *blueViewBottomToBlackViewTop = [NSLayoutConstraint constraintWithItem:blueView
    //                                                                                    attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:blackView attribute:NSLayoutAttributeTop multiplier:1 constant:-30];
    
    //redView centerY与blueView centerY一致
    NSLayoutConstraint *redViewCenterYToBlueViewCenterY = [NSLayoutConstraint constraintWithItem:redView
                                                                                       attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    //blackView left与self.view的left的距离是30
    
    NSLayoutConstraint *blackViewLeftToSuperViewLeft = [NSLayoutConstraint constraintWithItem:blackView
                                                                                    attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1 constant:30];
    
    //balckView right与self.view的right的距离是30
    NSLayoutConstraint *balckViewRightToSuperViewRight = [NSLayoutConstraint constraintWithItem:blackView
                                                                                      attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1 constant:-30];
    
    //balckViewBottom 距离 self.view bottom
    NSLayoutConstraint *balckViewBottomToSuperViewBottom = [NSLayoutConstraint constraintWithItem:blackView
                                                                                        attribute:NSLayoutAttributeBottom
                                                                                        relatedBy:NSLayoutRelationEqual
                                                                                           toItem:self.view
                                                                                        attribute:NSLayoutAttributeBottom
                                                                                       multiplier:1
                                                                                         constant:- 30];
    
    //redView width与blueView的width一致
    NSLayoutConstraint *redViewWidthToBlueViewWidth = [NSLayoutConstraint constraintWithItem:redView
                                                                                   attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    
    //redView height与blueView的height一致
    NSLayoutConstraint *redViewHeightToBlueViewHeight = [NSLayoutConstraint constraintWithItem:redView
                                                                                     attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    
    
    //redView height与blackView的height一致
    NSLayoutConstraint *redViewHeightToBlackViewHeight = [NSLayoutConstraint constraintWithItem:redView
                                                                                      attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blackView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    //添加约束，因为redView、blueView、blackView是同层次关系，且他们公有的父视图都是self.view，所以这里把约束都添加到self.view上即可
    
    [self.view addConstraints:@[redViewTopToSuperViewTop,redViewLeftToSuperViewLeft,redViewRightToBlueViewRight,redViewBottomToBlackViewTop,blueViewRightToSuperViewRight,balckViewBottomToSuperViewBottom,redViewCenterYToBlueViewCenterY,blackViewLeftToSuperViewLeft,balckViewRightToSuperViewRight,redViewWidthToBlueViewWidth,redViewHeightToBlueViewHeight,redViewHeightToBlackViewHeight]];
    
    [self.view layoutIfNeeded];
    
    // Do any additional setup after loading the view.
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
