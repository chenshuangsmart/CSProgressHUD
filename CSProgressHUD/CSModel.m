//
//  CSModel.m
//  CSProgressHUD
//
//  Created by cs on 2018/7/30.
//  Copyright © 2018年 cs. All rights reserved.
//

#import "CSModel.h"

@implementation CSModel

+ (instancetype)modelWithName:(NSString *)name hudType:(CSHUDType)hudType code:(NSString *)code {
    CSModel *model = [[CSModel alloc] init];
    model.name = name;
    model.hudType = hudType;
    model.code = code;
    return model;
}

@end
