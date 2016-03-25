//
//  ViewController.m
//  02-UIActivityIndicatorViewDemo
//
//  Created by qingyun on 16/3/25.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.view addSubview:activityView];
    //frame
    activityView.frame = CGRectMake(100, 100, 80, 80);
    //color
    activityView.color = [UIColor blueColor];
    [activityView startAnimating];
    
    [activityView performSelector:@selector(stopAnimating) withObject:nil afterDelay:5];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
