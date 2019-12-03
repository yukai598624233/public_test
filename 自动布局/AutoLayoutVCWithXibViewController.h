//
//  AutoLayoutVCWithXibViewController.h
//  自动布局
//
//  Created by 虞凯 on 2019/8/15.
//  Copyright © 2019 虞凯. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AutoLayoutVCWithXibViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *blueView;

@property (weak, nonatomic) IBOutlet UIView *blackView;

@end

NS_ASSUME_NONNULL_END
