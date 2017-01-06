//
//  ViewController.m
//  SeekDemo
//
//  Created by Handlecar1 on 17/1/7.
//  Copyright © 2017年 Handlecar1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDefaultView];
    // Do any additional setup after loading the view.
}

- (void)setupDefaultView {
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"网易新闻";
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

@end
