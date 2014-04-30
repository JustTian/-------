//
//  BarView.m
//  动态改变cell高度
//
//  Created by tian on 14-4-24.
//  Copyright (c) 2014年 SIC-CA. All rights reserved.
//

#import "BarView.h"
#define Space_Size 5
#define Label_Height 20
#define Bar_Height 22
@implementation BarView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame maxValue:(CGFloat)maxValue value:(CGFloat)value title:(NSString *)title barColor:(UIColor *)barColor{
    self = [super initWithFrame:frame];
    if (self) {
        //TODO:
        //百分比
        CGFloat subSorce = 0.0f;
        if (maxValue == 0.0) {
            subSorce = 0.0;
        }else{
            subSorce = value / maxValue;
        }
        //左边的label(显示名称以及百分比)
        UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        leftLabel.backgroundColor = [UIColor clearColor];
        leftLabel.textAlignment  = NSTextAlignmentLeft;
        leftLabel.font = [UIFont systemFontOfSize:12.0f];
        leftLabel.frame = CGRectMake(self.origin.x+Space_Size, 0, self.width/2-Space_Size, Label_Height);
        if (value<0) {
            leftLabel.textColor = [UIColor redColor];
        }
        else{
            leftLabel.textColor = [UIColor colorWithRed:43.0/255 green:51.0/255 blue:61.0/255 alpha:1.0];
        }
        leftLabel.text = [NSString stringWithFormat:@"%@(%0.2lf%%)",title,subSorce*100];
        [self addSubview:leftLabel];
        //右边的label(显示对应的实际数值)
        UILabel *rightLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        rightLabel.backgroundColor = [UIColor clearColor];
        rightLabel.textAlignment  = NSTextAlignmentRight;
        rightLabel.font = [UIFont systemFontOfSize:12.0f];
        rightLabel.frame = CGRectMake(leftLabel.right, 0, self.width/2-Space_Size, Label_Height);
        if (value<0) {
            rightLabel.textColor = [UIColor redColor];
        }
        else{
            rightLabel.textColor = [UIColor colorWithRed:43.0/255 green:51.0/255 blue:61.0/255 alpha:1.0];
        }
        rightLabel.text = [NSString stringWithFormat:@"%0.2lf",value];
        [self addSubview:rightLabel];
        
        //barView
        
        CGFloat barWidth = (value>0)?(self.width-2*Space_Size)*subSorce:(0-(self.width-2*Space_Size)*subSorce);
        UIView *barView = [[UIView alloc]initWithFrame:CGRectZero];
        barView.frame = CGRectMake(leftLabel.left, rightLabel.bottom, barWidth, Bar_Height);
        if (barColor == nil) {
            if (value<0) {
                barView.colors = @[(id)[UIColor redColor],(id)[UIColor whiteColor]];
            }
            else{
                barView.colors = @[(id)[UIColor whiteColor],(id)[UIColor redColor]];
            }
        }
        else{
            if (value<0) {
                barView.colors = @[(id)barColor,(id)[UIColor whiteColor]];
            }
            else{
                barView.colors = @[(id)[UIColor whiteColor],(id)barColor];
            }
            
        }
        [self.layer addSublayer:[barView shadowAsInverse]];
        CGFloat superHeight = barView.bottom+1;
        CGRect superFrame = self.frame;
        superFrame = CGRectMake(superFrame.origin.x, superFrame.origin.y, superFrame.size.width,superHeight);
        self.frame = superFrame;
        [self addSubview:barView];
       // self.backgroundColor = [UIColor grayColor];
    }
    return  self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
