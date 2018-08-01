//
//  CSModel.h
//  CSProgressHUD
//
//  Created by cs on 2018/7/30.
//  Copyright © 2018年 cs. All rights reserved.
//

#import <Foundation/Foundation.h>

// 弹窗类型
typedef enum : NSUInteger {
    CSHUDTypeSuccess = 1,
    CSHUDTypeWarning,
    CSHUDTypeError,
    CSHUDTypeLoading,
    CSHudTypeMessage
} CSHUDType;

/**
 模型数据
 */
@interface CSModel : NSObject

/** name */
@property(nonatomic, strong)NSString *name;
/** hud type */
@property(nonatomic, assign)CSHUDType hudType;
/** code */
@property(nonatomic, strong)NSString *code;

// 类工厂方法
+ (instancetype)modelWithName:(NSString *)name hudType:(CSHUDType)hudType code:(NSString *)code;

@end
