//
//  BarTableViewCell.m
//  动态改变cell高度
//
//  Created by tian on 14-4-22.
//  Copyright (c) 2014年 SIC-CA. All rights reserved.
//

#import "BarTableViewCell.h"
#import "BarView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface BarTableViewCell (){
    NSArray *colorsArray;
}

@property (nonatomic,retain) UILabel *yTitleLabel;
@property (nonatomic,retain) UILabel *yValueTitleLabel;
@property (nonatomic,retain) UILabel *yValueLabel;

@end

@implementation BarTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self initWithViews];
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}
- (void)initWithViews{
   
    self.cellData = [[NSArray alloc]init];
    self.cellYTitle = [[NSArray alloc]init];
    self.cellBarColor = [[NSArray alloc]init];
    self.maxValue = _maxValue;
   //TODO:修改柱状图颜色显示，默认(10种颜色)
    colorsArray = [[NSArray alloc]initWithObjects:
                   (id)UIColorFromRGB(0x0069A6),(id)UIColorFromRGB(0xA81639),
                   (id)UIColorFromRGB(0x6CCA16),(id)UIColorFromRGB(0x4F1457),
                   (id)UIColorFromRGB(0x264401),(id)UIColorFromRGB(0x3A37C6),
                   (id)UIColorFromRGB(0xDF0B08),(id)UIColorFromRGB(0x1D387F),
                   (id)UIColorFromRGB(0xD40573),nil];
}

- (void)loadCellView{
    for (NSInteger i=0; i<self.cellData.count; i++) {
        BarView *barView = [[BarView alloc]initWithFrame:CGRectMake(0, i*45, self.width,45) maxValue:_maxValue value:[self.cellData[i] floatValue] title:self.cellYTitle[i] barColor:colorsArray[i]];
        [self.contentView addSubview:barView];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
