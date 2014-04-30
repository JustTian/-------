//
//  BarView.h
//  动态改变cell高度
//
//  Created by tian on 14-4-24.
//  Copyright (c) 2014年 SIC-CA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+GradientView.h"
@interface BarView : UIView



- (id)initWithFrame:(CGRect)frame maxValue:(CGFloat)maxValue value:(CGFloat)value title:(NSString *)title barColor:(UIColor *)barColor;

@end
