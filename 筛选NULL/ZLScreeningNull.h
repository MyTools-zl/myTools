//
//  ZLScreeningNull.h
//  TaoQiXiu20131014
//
//  Created by wangyongfeng2 on 16/10/16.
//  Copyright © 2016年 赵磊. All rights reserved.
//

/** --------*  README  *--------
 
 *此工具能帮你做什么？
 *可以字典或数组中的NULL
 
 *///README

#import <Foundation/Foundation.h>

@interface ZLScreeningNull : NSObject

/** 筛选Null*/
+ (NSMutableDictionary *)screeningNullWithDictionary:(NSDictionary *)dict;
+ (NSMutableArray *)screeningNullWithArray:(NSArray *)array;

@end
