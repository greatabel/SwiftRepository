//
//  FKL_DataService.m
//  myCocoaPods
//
//  Created by abel on 15/3/10.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import "FKL_DataService.h"

#define BaseURL @"http://www.raywenderlich.com"

@implementation FKL_DataService

+(AFHTTPRequestOperation *)requestURL:(NSString *)url parameters:(NSDictionary *)pareames withType:(NSString *)type format:(NSString *)xmlOrJson complete:(CompleteBlock)block ;{
    
    AFHTTPRequestOperation *operation = nil; // 这个没有实际作用，返回类型可写成void
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 这一句看情况添加
    //    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/xml"];
    
    // 拼接完整的URL
    NSString *intactURL = [BaseURL stringByAppendingString:url];
    
    
    // 数据类型转为大写,防止大小写混乱的参数
    NSString *str = [xmlOrJson uppercaseString];
    if ([str isEqualToString:@"JSON"]) {
        // 设置解析方式
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
    } else if ([str isEqualToString:@"XML"]){
        
        // AFHTTPResponseSerializer不使用解析，即返回的为NSData类型数据，如果使用AFXMLParserResponseSerializer 解析会比较麻烦，所以会在后面使用第三方的XML解析(XMLReader)
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    
    // 请求方式
    NSString *typeStr = [type uppercaseString];
    if ([typeStr isEqualToString:@"GET"]) {
        
        [manager GET:intactURL parameters:pareames success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            if ([str isEqualToString:@"XML"]) {
                
                NSString *xmlString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                // 使用XMLReader，将xml数据解析为字典格式（请看XMLReader类中的方法）
                NSError *error = nil;
                NSDictionary *xmlDic = [XMLReader dictionaryForXMLString:xmlString error:&error];
                
                // 请求数据成功后回调
                block(xmlDic);
                
            } else {
                
                //默认是JSON解析，responseObject 就是解析后的字典不需要自己再做解析
                block(responseObject);
                
            }
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"请求数据失败:%@！",error);
        }];
        
    } else if([typeStr isEqualToString:@"POST"]){
        
        [manager POST:intactURL parameters:pareames success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            if ([str isEqualToString:@"XML"]) {
                
                NSString *xmlString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                // 将xml数据转换为字典
                NSError *error = nil;
                NSDictionary *xmlDic = [XMLReader dictionaryForXMLString:xmlString error:&error];
                
                block(xmlDic);
                //                NSLog(@"XML数据请求成功：%@",xmlString);
                
            } else {
                
                block(responseObject);
                //                NSLog(@"JSON数据请求成功：%@",responseObject);
            }
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"%@",error);
        }];
    }
    
    return operation;
}

@end
