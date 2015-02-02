//
//  ViewController.m
//  presentModal
//
//  Created by wangsl-iMac on 14-10-30.
//  Copyright (c) 2014年 chengtz-iMac. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"
@interface ViewController ()<TextFiledProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(valueChange:) name:@"TextFiledVauleChange" object:nil];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50, 100, 100, 40)];
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"Modal" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(50, 150, 150, 50)];
    label.tag = 101;
    label.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label];
    
    UILabel * label2 = [[UILabel alloc]initWithFrame:CGRectMake(50, 250, 150, 50)];
    label2.tag = 102;
    label2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:label2];
    
    [self.view addSubview:btn];
    
    
    
}

-(void)valueChange: (NSNotification *)text
{
    UILabel * label = (UILabel *) [self.view viewWithTag:102];
    
    NSString * Str = (NSString *)text.object;
    label.text = Str;
}

-(void)click
{
    MyViewController * view = [[MyViewController alloc]init];
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    view.deletgat = self;
    [self presentViewController:view animated:YES completion:^{
        NSLog(@"DoModal complet");
    }];
}

-(void)TextValueChange:(NSString *)text
{
    UILabel * label = (UILabel *) [self.view viewWithTag:101];
    label.text = text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
