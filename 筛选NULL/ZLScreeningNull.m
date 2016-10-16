//
//  ZLScreeningNull.m
//  TaoQiXiu20131014
//
//  Created by wangyongfeng2 on 16/10/16.
//  Copyright © 2016年 赵磊. All rights reserved.
//

#import "ZLScreeningNull.h"

@implementation ZLScreeningNull

#pragma mark 筛选字典
+ (NSMutableDictionary *)screeningNullWithDictionary:(NSDictionary *)dict{
    NSArray *dictArray = dict.allKeys;
    NSInteger count = dictArray.count;
    NSMutableDictionary *dictM = [[NSMutableDictionary alloc] initWithCapacity:count];
    for (int a = 0; a < count; a++) {
        NSString *string = dictArray[a];
        NSObject *obj = dict[string];
        if ([obj isKindOfClass:[NSNull class]]) {
            [dictM setObject:@"" forKey:string];
            continue;
        }
        if ([obj isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *dictM2 = [self screeningNullWithDictionary:(NSDictionary *)obj];
            [dictM setObject:dictM2 forKey:string];
            continue;
        }
        if ([obj isKindOfClass:[NSArray class]]) {
            NSMutableArray *objArrayM = [self screeningNullWithArray:(NSArray *)obj];
            [dictM setObject:objArrayM forKey:string];
            continue;
        }
        [dictM setObject:obj forKey:string];
    }
    return dictM;
}

#pragma mark 筛选数组
+ (NSMutableArray *)screeningNullWithArray:(NSArray *)array{
    NSArray *objArray = (NSArray *)array;
    NSInteger count = objArray.count;
    NSMutableArray *objArrayM = [[NSMutableArray alloc]initWithCapacity:count];
    for (int b = 0; b < count; b++) {
        NSObject *obj2 = objArray[b];
        if ([obj2 isKindOfClass:[NSNull class]]) {
            [objArrayM addObject:@""];
            continue;
        }
        if ([obj2 isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *dictM3 = [self screeningNullWithDictionary:(NSDictionary *)obj2];
            [objArrayM addObject:dictM3];
            continue;
        }
        if ([obj2 isKindOfClass:[NSArray class]]) {
            NSMutableArray *objArrayM2 = [self screeningNullWithArray:(NSArray *)obj2];
            [objArrayM addObject:objArrayM2];
            continue;
        }
        [objArrayM addObject:obj2];
    }
    return objArrayM;
}

@end
