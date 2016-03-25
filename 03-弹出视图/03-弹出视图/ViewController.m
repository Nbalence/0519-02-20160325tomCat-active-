//
//  ViewController.m
//  03-弹出视图
//
//  Created by qingyun on 16/3/25.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate,UIActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",[[UIDevice currentDevice] systemVersion]);
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -UIAlertView
- (IBAction)showAlertView:(UIButton *)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"不要瞌睡！不要瞌睡！不要瞌睡！不要瞌睡！不要瞌睡！不要瞌睡！不要瞌睡！不要瞌睡！" delegate:self cancelButtonTitle:@"不瞌睡" otherButtonTitles:@"睡一会再说",@"你给我站起来", nil];
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alertView show];
}
//根据点击的btn的索引来做不同的操作
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    //cancelButton 0 otherButton 1--n
    NSLog(@"%ld",buttonIndex);
    
//    UITextField *userName = [alertView textFieldAtIndex:0];
//    UITextField *passWord = [alertView textFieldAtIndex:1];
    
    switch (buttonIndex) {
        case 0:
            break;
            
        default:
            break;
    }
}

#pragma mark -UIActionSheet
- (IBAction)showActionSheet:(UIButton *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"微信" otherButtonTitles:@"QQ",@"空间",@"微博", nil];
    [actionSheet showInView:self.view];
}
//根据点击的btn的索引来分享不同的平台
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    //destructive:0  otherButton 1--n cancelButton n + 1
    NSLog(@"%ld",buttonIndex);
}

#pragma mark -UIAlertController
- (IBAction)showAlertController:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:@"余额不足，请充值！！！" preferredStyle:UIAlertControllerStyleActionSheet];
    
//    //添加textField
//    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"请输入用户名";
//    }];
//    
//    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"请输入密码";
//        textField.secureTextEntry = YES;
//    }];
    
    //添加action
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        UITextField *userName = alertController.textFields.firstObject;
        UITextField *passWord = alertController.textFields.lastObject;
        
        NSLog(@"userName:%@ --- passWord:%@---确定",userName.text,passWord.text);
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [alertController addAction:action1];
    [alertController addAction:action2];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
