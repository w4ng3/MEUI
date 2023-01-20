// Autogenerated from Pigeon (v7.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

#import <Foundation/Foundation.h>

@protocol FlutterBinaryMessenger;
@protocol FlutterMessageCodec;
@class FlutterError;
@class FlutterStandardTypedData;

NS_ASSUME_NONNULL_BEGIN

@class AlertDialogConfig;

@interface AlertDialogConfig : NSObject
+ (instancetype)makeWithTitle:(nullable NSString *)title
    content:(nullable NSString *)content
    confirmText:(nullable NSString *)confirmText
    cancelText:(nullable NSString *)cancelText;
/// 对话框标题
@property(nonatomic, copy, nullable) NSString * title;
/// 对话框内容
@property(nonatomic, copy, nullable) NSString * content;
/// 确认按钮文案
@property(nonatomic, copy, nullable) NSString * confirmText;
/// 取消按钮文案
@property(nonatomic, copy, nullable) NSString * cancelText;
@end

/// The codec used by AlertDialogHostAPI.
NSObject<FlutterMessageCodec> *AlertDialogHostAPIGetCodec(void);

@protocol AlertDialogHostAPI
/// 点击确定
- (void)onClickConfirmWithError:(FlutterError *_Nullable *_Nonnull)error;
/// 点击取消
- (void)onClickCancelWithError:(FlutterError *_Nullable *_Nonnull)error;
@end

extern void AlertDialogHostAPISetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<AlertDialogHostAPI> *_Nullable api);

/// The codec used by AlertDialogFlutterAPI.
NSObject<FlutterMessageCodec> *AlertDialogFlutterAPIGetCodec(void);

@interface AlertDialogFlutterAPI : NSObject
- (instancetype)initWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;
/// 初始化配置
- (void)configConfig:(AlertDialogConfig *)config completion:(void(^)(NSError *_Nullable))completion;
@end

NS_ASSUME_NONNULL_END