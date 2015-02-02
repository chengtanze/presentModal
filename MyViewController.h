//
//  MyViewController.h
//  presentModal
//
//  Created by wangsl-iMac on 14-10-30.
//  Copyright (c) 2014年 chengtz-iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextFiledProtocol <NSObject>

@optional
-(void)TextValueChange:(NSString *)text;

@end

@interface MyViewController : UIViewController

{

}
@property(nonatomic, assign) id<TextFiledProtocol> deletgat;
@end
