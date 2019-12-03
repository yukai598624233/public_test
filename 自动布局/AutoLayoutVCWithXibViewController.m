//
//  AutoLayoutVCWithXibViewController.m
//  自动布局
//
//  Created by 虞凯 on 2019/8/15.
//  Copyright © 2019 虞凯. All rights reserved.
//

#import "AutoLayoutVCWithXibViewController.h"
#import "Masonry.h"
@interface AutoLayoutVCWithXibViewController ()

@end

@implementation AutoLayoutVCWithXibViewController

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
//
//    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
//        //在这里可以将一些数字创建、标题命名等初始化操作写在这里
//        NSLog(@"initWithNibName%@",self.blueView);
//    }
//    return self;
//}
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        NSLog(@"init%@",self.blueView);
//    }
//    return self;
//}
//- (void)loadView{
//    [super loadView];
//    NSLog(@"loadView%@",self.blueView);
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad%@",self.blueView);
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    self.blueView.translatesAutoresizingMaskIntoConstraints = NO;
    self.blackView.translatesAutoresizingMaskIntoConstraints = NO;
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    __weak typeof(self)weakSelf = self;
    
    
//    [self.blueView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(weakSelf.redView.mas_left);
//        make.right.equalTo(weakSelf.redView.mas_right);
//        make.centerY.equalTo(weakSelf.redView.mas_centerY);//blueView Y方向上的中心线和redView相等
//        make.width.equalTo(weakSelf.redView.mas_width);//blueView的宽度与redVIiew的宽度一致
//        make.height.equalTo(weakSelf.redView.mas_height);//blueView的高度与redView的宽高度一致
//    }];
//    [self.blackView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakSelf.redView.mas_bottom).with.offset(30);
//        make.left.equalTo(weakSelf.view.mas_left).with.offset(30);
//        make.right.equalTo(weakSelf.view.mas_right).with.offset(-30);
//        make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(-30);
//        make.height.equalTo(weakSelf.redView.mas_height);
//    }];
    
    [UIView animateWithDuration:3 animations:^{
        [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(weakSelf.blueView.mas_left);
            make.right.equalTo(weakSelf.blueView.mas_right);
        }];
    }];
    [weakSelf.view layoutIfNeeded];
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
