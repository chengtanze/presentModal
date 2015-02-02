//
//  MyViewController.m
//  presentModal
//
//  Created by wangsl-iMac on 14-10-30.
//  Copyright (c) 2014年 chengtz-iMac. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController () <UITextFieldDelegate>

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(150, 150, 100, 40)];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"Modal" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    
    UITextField * text = [[UITextField alloc]initWithFrame:CGRectMake(150, 200, 150, 40)];
    text.tag = 100;
    text.delegate = self;
    text.backgroundColor = [UIColor grayColor];
    [self.view addSubview:text];
    
    [self.view addSubview:btn];
}

-(void)click
{
    
    UITextField * text = (UITextField * )[self.view viewWithTag:100];
    
    [[self deletgat] TextValueChange:text.text];
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TextFiledVauleChange" object:text.text];
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Dismiss complet");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)dealloc
{
    NSLog(@"dealloc");
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
