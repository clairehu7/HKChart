//
//  ShowPieChartViewController.m
//  PieChart
//
//  Created by hukaiyin on 16/6/20.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "HKPieChartView.h"

#import "ShowPieChartViewController.h"

@interface ShowPieChartViewController ()

@property (nonatomic, strong) HKPieChartView *pieChartView;

@end

@implementation ShowPieChartViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self pieChartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Getters & Setters

- (HKPieChartView *)pieChartView {
    if (!_pieChartView) {
        CGFloat width = 200;
        _pieChartView = [[HKPieChartView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - width)/2, 100, width, width)];
        _pieChartView.percent = 90;
        [self.view addSubview:_pieChartView];
    }
    return _pieChartView;
}
@end
