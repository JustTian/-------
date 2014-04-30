//
//  BarTableViewCell.h
//  动态改变cell高度
//
//  Created by tian on 14-4-22.
//  Copyright (c) 2014年 SIC-CA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarTableViewCell : UITableViewCell



@property (nonatomic,assign) CGFloat maxValue;          //Y轴最大值
@property (nonatomic,assign) CGFloat cellBarWidth;      //柱状图的宽度


@property (nonatomic,retain) NSArray *cellData;         //填充cell的  数组包含数组
@property (nonatomic,retain) NSArray *cellXTitle;       //cell的x填充属性名称 应该是数组包含数组
@property (nonatomic,retain) NSArray *cellYTitle;       //cell的y填充属性名称 同上
@property (nonatomic,retain) NSArray *cellBarColor;     //柱状图的颜色
- (void)loadCellView;
@end
