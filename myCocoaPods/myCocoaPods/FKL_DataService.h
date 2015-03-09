//
//  FKL_DataService.h
//  myCocoaPods
//
//  Created by abel on 15/3/10.
//  Copyright (c) 2015年 abel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "AFHTTPRequestOperation.h"
#import "XMLReader.h"

typedef void(^CompleteBlock)(id result);

@interface FKL_DataService : NSObject

/**
 *  AFNetWorking 网络请求
 *
 *  @param url      请求地址
 *  @param pareames 参数
 *  @param type     请求方式（POST / GET）
 *  @param format  请求的数据是xml 还是 JSON
 *  @param complete    请求完成后回调的block
 *
 *  @return AFHTTPRequestOperation
 */
+(AFHTTPRequestOperation *)requestURL:(NSString *)url
                           parameters:(NSDictionary *)pareames
                             withType:(NSString *)type
                               format:(NSString *)xmlOrJson
                             complete:(CompleteBlock)block ;

@end

