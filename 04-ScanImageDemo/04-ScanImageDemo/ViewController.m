//
//  ViewController.m
//  04-ScanImageDemo
//
//  Created by qingyun on 16/3/25.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (nonatomic, strong) NSArray *images;

@property (nonatomic) NSInteger currentIndex;
@end

@implementation ViewController
//懒加载images
-(NSArray *)images{
    if (_images == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"];
        _images = [NSArray arrayWithContentsOfFile:path];
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置界面初始值
    [self changeContentForSubViews];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)changeContentForSubViews{
    //更改indexLabel的文本
    _indexLabel.text = [NSString stringWithFormat:@"%ld/%ld",_currentIndex + 1,self.images.count];
    //更改imageView的image
    NSDictionary *dict = self.images[_currentIndex];
    NSString *imageName = dict[@"name"];
    _imageView.image = [UIImage imageNamed:imageName];
    //更改descLabel的文本
    _descLabel.text = dict[@"desc"];
    //更改左右按钮的enable
    _leftBtn.enabled = _currentIndex == 0 ? NO : YES;
    _rightBtn.enabled = _currentIndex == self.images.count - 1 ? NO : YES;
}

- (IBAction)btnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 101:
            _currentIndex--;
            break;
        case 102:
            _currentIndex++;
            break;
            
        default:
            break;
    }
    
    [self changeContentForSubViews];
}

- (IBAction)gotoWebView:(UIButton *)sender {
    NSDictionary *dict = self.images[_currentIndex];
    NSString *urlString = dict[@"url"];
    NSURL *url = [NSURL URLWithString:urlString];
    //利用单例模式获取当前应用程序，并且打开url
    [[UIApplication sharedApplication] openURL:url];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
