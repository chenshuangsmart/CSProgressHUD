# CSProgressHUD
The easy progress hud to project

该工具类主要是基于MBProgressHUD 的基础上进行二次封装，对外提供了很多方法，外界直接根据需要，调用对应的方法即可，方便实用。

对外提供了很多方法，外界根据需要直接调用即可，方便快捷。

/**
 备注:
 1. 调用 ok,error,warning 方法时,进行信息提示,有对应图片,当时间到后,会自动消失,并且不管是否有传 toView 参数,在显示的同时还是可以进行交互的.即可以重复点击
 2. 调用 message 方法,只进行信息展示,没有对应图片.当时间到后,会自动消失,并且不管是否有传 toView 参数,在显示的同时还是可以进行交互的.即可以重复点击
 3. 调用 info 方法,显示一个 loading 视图,不会自动消失,需要外界调用对应方法让其消失,并且在展示的时候禁止用户进行其他交互.所以这里添加的图层需要注意,根据需求添加图层
 */
@interface AlertUtils : NSObject
// 成功提示 - 会自动消失
+ (void)success:(NSString *)msg;

+ (void)success:(NSString *)msg duration:(int)duration;

+ (void)success:(NSString *)msg duration:(int)duration toView:(UIView *)toView;

// 错误提示 - 会自动消失
+ (void)error:(NSString *)msg;

+ (void)error:(NSString *)msg duration:(int)duration;

+ (void)error:(NSString *)msg duration:(int)duration toView:(UIView *)toView;

// 警告提示 - 会自动消失
+ (void)warning:(NSString *)msg;

+ (void)warning:(NSString *)msg duration:(int)duration;

+ (void)warning:(NSString *)msg duration:(int)duration toView:(UIView *)toView;

// 信息提示,没有图片
+ (void)message:(NSString *)msg;

+ (void)message:(NSString *)msg duration:(int)duration;

+ (void)message:(NSString *)msg duration:(int)duration toView:(UIView *)toView;

// 转菊花的提示 - 不会自动消失
+ (MBProgressHUD *)info:(NSString *)msg;

+ (MBProgressHUD *)info:(NSString *)msg toView:(UIView *)toView;

+ (MBProgressHUD *)showTopWinMessage:(NSString *)msg duration:(int)duration;

项目的演示效果
<div align=center><img src="https://github.com/chenshuangsmart/CSProgressHUD/blob/master/showMessage.gif"/></div>

