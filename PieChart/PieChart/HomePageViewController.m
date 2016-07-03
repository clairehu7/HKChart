//
//  HomePageViewController.m
//  PieChart
//
//  Created by hukaiyin on 16/6/20.
//  Copyright © 2016年 HKY. All rights reserved.
//

#import "ShowPieChartViewController.h"

#import "HomePageViewController.h"

@interface HomePageViewController ()

@property (weak, nonatomic) IBOutlet UILabel *percentLabel;
@property (weak, nonatomic) IBOutlet UISlider *controlSlider;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.percentLabel.text = [NSString stringWithFormat:@"%.0f%%",self.controlSlider.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jumpTUI:(UIButton *)sender {
    ShowPieChartViewController *vc = [[ShowPieChartViewController alloc]init];
    vc.percent = self.controlSlider.value;
    [self.navigationController pushViewController:vc animated:YES];
}


- (IBAction)percentChanged:(UISlider *)sender {
    self.percentLabel.text = [NSString stringWithFormat:@"%.0f%%",sender.value];
}

@end
