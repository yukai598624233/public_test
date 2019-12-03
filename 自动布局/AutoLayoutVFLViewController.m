//
//  AutoLayoutVFLViewController.m
//  自动布局
//
//  Created by 虞凯 on 2019/8/15.
//  Copyright © 2019 虞凯. All rights reserved.
//

#import "AutoLayoutVFLViewController.h"

@interface AutoLayoutVFLViewController ()

@end

@implementation AutoLayoutVFLViewController

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
    
    //3.创建约束
    //间距
    NSNumber *margin = @(30);
    NSNumber *spacing = @(30);
    NSDictionary *views = NSDictionaryOfVariableBindings(redView,blueView,blackView);
    NSDictionary *mertrics = NSDictionaryOfVariableBindings(margin,spacing);
    
    //添加水平方向的约束1
    NSString *vfl = @"H:|-margin-[redView]-spacing-[blueView(==redView)]-margin-|";
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:vfl options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:mertrics views:views];
    [self.view addConstraints:constraints];
    
    //添加blackView的水平方向的约束2
    
    NSString *vfl1 = @"H:|-margin-[blackView]-margin-|";
    NSArray *constraints1 = [NSLayoutConstraint constraintsWithVisualFormat:vfl1 options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:mertrics views:views];
    [self.view addConstraints:constraints1];
    
    //添加垂直方向的约束3
    
    NSString *vfl2 = @"V:|-margin-[redView]-spacing-[blackView(==redView)]-margin-|";
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:vfl2 options:kNilOptions metrics:mertrics views:views];
    [self.view addConstraints:constraints2];
    
    
    // Do any additional setup after loading the view from its nib.
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
