//
//  FirstViewController.m
//  动态改变cell高度
//
//  Created by shuangchun che on 14-3-2.
//  Copyright (c) 2014年 SIC-CA. All rights reserved.
//

#import "FirstViewController.h"
#import "MyCell.h"
#import "BarTableViewCell.h"
#import "JXBarChartView.h"
#import "UIView+GradientView.h"
#import "BarView.h"


@interface FirstViewController ()
@property (strong,nonatomic)NSArray * listArray;

@property (strong,nonatomic)NSArray *cellData;
@property (strong,nonatomic)NSArray *cellXTitle;
@property (strong,nonatomic)NSArray *cellYTitle;
@property (strong,nonatomic)NSArray *cellBarColor;


@end

@implementation FirstViewController
@synthesize myTableview;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   // self.listArray=@[@"发dsa反狂萨芬是反动拉反dsa发动机拉飞但赛a费 翻开放到是尽量空a 负担凯撒发动垃圾分量撒飞单孔啦发动啦发dsa了发冬季拉风dsa了发东辣椒粉东拉风dsa了发动啦发动啦饭带撒放量撒",@"uiojoj就放开胆萨拉金矿三a类",@"发动机拉负担塞卡积分两岁积分到死a级翻开dsa肯将空a级疯狂囧a卡发动反倒赛a就分开dsa及防盗笼a费淡扫a级疯狂赛a级发东甲a廊坊的撒酒疯老dsa发但赛a费东甲a廊坊的三就开动a级及防盗笼a级发两三反elkwqjrlewqje温江三房两撒娇就开动甲a翻开将发动机卡了反动啊",@"发dsa发动afs的erqerq",@"反动及a类反倒森警而完全恩将去嗯就父母代森撒旦法龙大"];
    
    self.cellData = [[NSArray alloc]initWithObjects:@[@(-57.),@88],@[@18.],@[@52.2],@[@88.9],@[@100],@[@(-57.),@88],@[@18.],@[@52.2],@[@88.9],@[@100], nil];
    
    self.cellXTitle =[[NSArray alloc]initWithObjects:@"Test01",@"Test02",@"T03",@"T04",@"T05", @"Test01",@"Test02",@"T03",@"T04",@"T05",nil];
    
    self.cellYTitle = [[NSArray alloc]initWithObjects:@[@"-57",@"88"],@[@"18"],@[@"52"],@[@"88"],@[@"100"],@[@"57",@"88"],@[@"18"],@[@"52"],@[@"88"],@[@"100"], nil];
    
    self.cellBarColor = [[NSArray alloc]initWithObjects:@[(id)[UIColor redColor],(id)[UIColor orangeColor]],@[(id)[UIColor redColor]],@[(id)[UIColor blueColor]],@[(id)[UIColor yellowColor]],@[(id)[UIColor orangeColor]],@[(id)[UIColor redColor],(id)[UIColor orangeColor]],@[(id)[UIColor redColor]],@[(id)[UIColor blueColor]],@[(id)[UIColor yellowColor]],@[(id)[UIColor orangeColor]], nil];
//    CGRect frame = CGRectMake(0, 0, 320, 100);
//    JXBarChartView *view = [[JXBarChartView alloc]initWithFrame:frame
//                                                     startPoint:CGPointMake(10, 10)
//                                                         values:self.cellXTitle maxValue:100
//                                                 textIndicators:self.cellYTitle
//                                                      textColor:[UIColor orangeColor]
//                                                      barHeight:20
//                                                    barMaxWidth:300
//                                                       gradient:nil];
    //[self.view addSubview:view];
//    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(10, 200, 300, 22)];
//    subView.colors = @[(id)[UIColor yellowColor],(id)[UIColor redColor]];
//    [subView.layer addSublayer:[subView shadowAsInverse]];
//    [self.view addSubview:subView];
//    UIView *subView = [[UIView alloc]initWithFrame:CGRectMake(10, 100, 300, 22)];
//    subView.colors = @[(id)[UIColor orangeColor],(id)[UIColor redColor]];
//     [subView.layer addSublayer:[subView shadowAsInverse]];
//    [self.view addSubview:subView];
//    
//    
//    UIView *subView1 = [[UIView alloc]initWithFrame:CGRectMake(10, 130, 200, 22)];
//    subView1.colors = @[(id)[UIColor orangeColor],(id)[UIColor redColor]];
//    [subView1.layer addSublayer:[subView1 shadowAsInverse]];
//    [self.view addSubview:subView1];


    
    myTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, self.view.height) style:UITableViewStylePlain];
    myTableview.delegate = self;
    myTableview.dataSource = self;
    myTableview.showsVerticalScrollIndicator = NO;
    [self.view addSubview:myTableview];
    
//    BarView *barView = [[BarView alloc]initWithFrame:CGRectMake(0, 20,self.view.width, 0) maxValue:100 value:55.0 title:@"测试" barColor:nil];
//    [self.view addSubview:barView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.cellXTitle.count;
}
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return self.cellXTitle[section];
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;// [self.cellData[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *cellIn=@"Test";

    BarTableViewCell *cell = [[BarTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIn];
    
    cell.cellData = self.cellData[indexPath.section];
    cell.cellYTitle = self.cellYTitle[indexPath.section];
    cell.cellBarColor = self.cellBarColor[indexPath.section];
    cell.maxValue = 100.0;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell loadCellView];
    return cell;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UILabel *sectionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,tableView.width, 30)];
    sectionLabel.text = [NSString stringWithFormat:@" %@",self.cellXTitle[section]] ;
    sectionLabel.textAlignment = NSTextAlignmentLeft;
    sectionLabel.backgroundColor = [UIColor whiteColor];
    return sectionLabel;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    CGFloat retHeigth = [self.cellData[indexPath.section] count]*45;
    return retHeigth;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
