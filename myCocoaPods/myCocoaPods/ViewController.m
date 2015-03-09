//
//  ViewController.m
//  myCocoaPods
//
//  Created by abel on 15/3/10.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import "ViewController.h"
#import "FKL_DataService.h"


/**
 *  http://www.raywenderlich.com/demos/weather_sample/weather.php?format=json // 请求JSON数据
 http://www.raywenderlich.com/demos/weather_sample/weather.php?format=xml // 请求XML数据
 http://www.raywenderlich.com/demos/weather_sample/weather.php?format=plist// 请求plist文件（这个链接通过浏览器可能看不到）
 
 */


#define subURL @"/demos/weather_sample/weather.php?"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
}


- (void)_loadData
{
    NSMutableDictionary *perame = [NSMutableDictionary dictionary];
    [perame setObject:@"xml" forKey:@"format"];
    
    [FKL_DataService requestURL:subURL parameters:perame withType:@"POST" format:@"XML" complete:^(id result) {
        
        [self showReponsData:result];
    }];
    
}


- (void)showReponsData:(NSDictionary *)result
{
    NSLog(@"返回数据:%@",result);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

