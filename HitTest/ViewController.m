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
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //convert point to the white layer's coordinates拿到在self.view上但同时在whiteView上的点，下面的同这里一样，不一一解释了
    point = [whiteView.layer convertPoint:point fromLayer:self.view.layer]; //get layer using containsPoint:
    if ([whiteView.layer containsPoint:point]) {
        //convert point to blueLayer’s coordinates
        point = [blueLayer convertPoint:point fromLayer:whiteView.layer];
        if ([blueLayer containsPoint:point])
        {
            [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil] show];
        }
        else
        {
            [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
                                        message:nil
                                       delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles: nil]show];
        }
        
    }
              
    //－－－－－－－－－－华丽丽的分割线，从这里开始是我写的点击的方法，相对来说比上面使用起来更方便点
//    CGPoint point=[[touches anyObject]locationInView:self.view];
    
    
//    CALayer *layer=[whiteView.layer hitTest:point];
//    if (layer==whiteView.layer) {
//        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message:@"Inside white layer" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alertView show];
//    }
//    else if (layer==blueLayer){
//        UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"" message:@"Inside blue layer" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
//        [alertView show];
//    }
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
