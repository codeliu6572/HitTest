//
//  ViewController.m
//  HitTest
//
//  Created by 刘浩浩 on 16/1/25.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *whiteView;
    CALayer *blueLayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor grayColor];
    whiteView=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    whiteView.center=self.view.center;
    whiteView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:whiteView];
    
    blueLayer=[CALayer layer];
    blueLayer.frame=CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor=[UIColor blueColor].CGColor;
    [whiteView.layer addSublayer:blueLayer];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint point=[[touches anyObject]locationInView:self.view];
    
    
    CALayer *layer=[whiteView.layer hitTest:point];
    if (layer==whiteView.layer) {
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message:@"Inside white layer" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
    else if (layer==blueLayer){
        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message:@"Inside blue layer" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }
    
//    point=[whiteView.layer convertPoint:point fromLayer:self.view.layer];
//    if ([blueLayer containsPoint:point]) {
//        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message:@"Inside blue layer" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alertView show];
//    }
//    else
//    {
//        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message:@"Inside white layer" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alertView show];
//
//    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
