//
//  ViewController.m
//  01-TomCatDemo
//
//  Created by qingyun on 16/3/25.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "Common.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)startAnimationWithImageName:(NSString *)imageName imageCount:(NSInteger)imgCount{
    if (_imageView.isAnimating) {
        return ;
    }
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i < imgCount; i++) {
#if 0
        NSString *imageN = [NSString stringWithFormat:@"%@_%02d.jpg",imageName,i];
        UIImage *image = [UIImage imageNamed:imageN];
#else
        NSString *imageN = [NSString stringWithFormat:@"%@_%02d",imageName,i];
        //NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageN ofType:@"jpg"];
        
        //UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        UIImage *image = ImageWithPath(ResourcePath(imageN, @"jpg"));
#endif
        [images addObject:image];
    }
    //设置帧动画
    _imageView.animationImages = images;
    _imageView.animationDuration = 0.08 * imgCount;
    _imageView.animationRepeatCount = 1;
    [_imageView startAnimating];
    
    //延时调用clearMemory
    //[NSTimer scheduledTimerWithTimeInterval:_imageView.animationDuration target:self selector:@selector(clearMemory) userInfo:nil repeats:NO];
    //控制器延迟调用clearMemory
    [self performSelector:@selector(clearMemory) withObject:nil afterDelay:_imageView.animationDuration];
    
    
    //通过设置imageview 属性 设置为空
    [_imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_imageView.animationDuration];
}

-(void)clearMemory{
    _imageView.animationImages = nil;
}


- (IBAction)btnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 101://cymbal
            [self startAnimationWithImageName:@"cymbal" imageCount:13];
            break;
        case 102://drink
            [self startAnimationWithImageName:@"drink" imageCount:81];
            break;
        case 103://eat
            [self startAnimationWithImageName:@"eat" imageCount:40];
            break;
        case 104://fart
            [self startAnimationWithImageName:@"fart" imageCount:28];
            break;
        case 105://pie
            [self startAnimationWithImageName:@"pie" imageCount:24];
            break;
        case 106://scratch
            [self startAnimationWithImageName:@"scratch" imageCount:56];
            break;
        case 107://Knockout
            [self startAnimationWithImageName:@"knockout" imageCount:81];
            break;
        case 108://stomach
            [self startAnimationWithImageName:@"stomach" imageCount:34];
            break;
        case 109://Footright
            [self startAnimationWithImageName:@"footRight" imageCount:30];
            break;
        case 110://Footleft
            [self startAnimationWithImageName:@"footLeft" imageCount:30];
            break;
        case 111://angry
            [self startAnimationWithImageName:@"angry" imageCount:26];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
