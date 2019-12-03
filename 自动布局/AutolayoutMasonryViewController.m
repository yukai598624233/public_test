//
//  AutolayoutMasonryViewController.m
//  自动布局
//
//  Created by 虞凯 on 2019/8/14.
//  Copyright © 2019 虞凯. All rights reserved.
//

#import "AutolayoutMasonryViewController.h"
#import "Masonry.h"
@interface AutolayoutMasonryViewController ()

@end

@implementation AutolayoutMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
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
    redView.tag = 10000;
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.tag = 10001;
    [self.view addSubview:blueView];
    
    UIView *blackView = [[UIView alloc]init];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.tag = 10002;
    [self.view addSubview:blackView];
    
    //2.然后，记得要把AutoresizingMask布局关掉
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    blackView.translatesAutoresizingMaskIntoConstraints = NO;
    // Do any additional setup after loading the view.
    
    //3.接着，添加约束
    
    __weak typeof(self) weakSelf = self;
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view.mas_top).with.offset(30);//redView的上，距离self.view是30px
        make.left.equalTo(weakSelf.view.mas_left).with.offset(30);//redView的左，距离self.view是30px
//        make.right.equalTo(weakSelf.view.mas_right).with.offset(-30);
        make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(-30);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(redView.mas_centerY);//blueView Y方向上的中心线和redView相等
        make.left.equalTo(redView.mas_right).with.offset(30);//blueView的左，距离redView的右是30px
        make.right.equalTo(weakSelf.view.mas_right).with.offset(-30);//blueView的右，距离self.view的右是-30px
        make.width.equalTo(redView.mas_width);//blueView的宽度与redVIiew的宽度一致
        make.height.equalTo(redView.mas_height);//blueView的高度与redView的宽高度一致
    }];
    
//    [blackView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(redView.mas_bottom).with.offset(30);
//        make.left.equalTo(weakSelf.view.mas_left).with.offset(30);
//        make.right.equalTo(weakSelf.view.mas_right).with.offset(-30);
//        make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(-30);
//        make.height.equalTo(redView.mas_height);
//    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    __weak typeof(self) weakSelf = self;
    UIView *redView = (UIView *)[self.view viewWithTag:10000];
    UIView *blueView = (UIView *)[self.view viewWithTag:10001];
    UIView *blackView = (UIView *)[self.view viewWithTag:10002];
    NSLog(@"blueView1   %@",blackView);
    NSLog(@"redView1    %@",redView);
//        [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(weakSelf.redView.mas_left);
//            make.right.equalTo(weakSelf.redView.mas_right);
//            make.centerY.equalTo(weakSelf.redView.mas_centerY);//blueView Y方向上的中心线和redView相等
//            make.width.equalTo(weakSelf.redView.mas_width);//blueView的宽度与redVIiew的宽度一致
//            make.height.equalTo(weakSelf.redView.mas_height);//blueView的高度与redView的宽高度一致
//        }];
//        [self.blackView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(weakSelf.redView.mas_bottom).with.offset(30);
//            make.left.equalTo(weakSelf.view.mas_left).with.offset(30);
//            make.right.equalTo(weakSelf.view.mas_right).with.offset(-30);
//            make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(-30);
//            make.height.equalTo(weakSelf.redView.mas_height);
//        }];
    [self.view setNeedsUpdateConstraints];
    [UIView animateWithDuration:3 animations:^{
        [blueView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.view.mas_top).with.offset(30);//redView的上，距离self.view是30px
            make.left.equalTo(weakSelf.view.mas_left).with.offset(30);//redView的左，距离self.view是30px
            make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(-30);
            NSLog(@"redView2    %@",redView);
        }];
        [blueView.superview layoutIfNeeded];
        [redView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(blueView.mas_centerY);//blueView Y方向上的中心线和redView相等
            make.left.equalTo(blueView.mas_right).with.offset(30);//blueView的左，距离redView的右是30px
            make.right.equalTo(weakSelf.view.mas_right).with.offset(-30);//blueView的右，距离self.view的右是-30px
            make.width.equalTo(blueView.mas_width);//blueView的宽度与redVIiew的宽度一致
            make.height.equalTo(blueView.mas_height);//blueView的高度与redView的宽高度一致
            NSLog(@"blueView2   %@",blackView);
        }];
        [redView.superview layoutIfNeeded];
        
        
//        [blackView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(blueView.mas_bottom).with.offset(30);
//            make.left.equalTo(weakSelf.view.mas_left).with.offset(30);
//            make.right.equalTo(weakSelf.view.mas_right).with.offset(-30);
//            make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(-30);
//            make.height.equalTo(blueView.mas_height);
//        }];
        
        
    }];
    
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
