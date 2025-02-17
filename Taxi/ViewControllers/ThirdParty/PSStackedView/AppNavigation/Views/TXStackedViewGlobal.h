//
//  TXStackedViewGlobal.h
//  TXStackedView
//

#import "UIView+PSSizes.h"

#define kPSSVAssociatedStackViewControllerKey @"kPSSVAssociatedStackViewController"

#define kPSSVStackedViewKitDebugEnabled

#define PSAppStatusBarOrientation ([[UIApplication sharedApplication] statusBarOrientation])
#define PSIsLandscape() UIInterfaceOrientationIsLandscape(PSAppStatusBarOrientation)

#ifdef kPSSVStackedViewKitDebugEnabled
#define PSSVLogVerbose(fmt, ...) do { if(kPSSVDebugLogLevel >= PSSVLogLevelVerbose) NSLog((@"%s/%d " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); }while(0)
#define PSSVLog(fmt, ...) do { if(kPSSVDebugLogLevel >= PSSVLogLevelInfo) NSLog((@"%s/%d " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__); }while(0)
#else
#define PSSVLogVerbose(...)
#define PSSVLog(...)
#define PSVSLogError(...)
#endif


#ifndef kCFCoreFoundationVersionNumber_iPhoneOS_4_0
#define kCFCoreFoundationVersionNumber_iPhoneOS_4_0 550.32
#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
#define IF_IOS4_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iPhoneOS_4_0) \
{ \
__VA_ARGS__ \
}
#else
#define IF_IOS4_OR_GREATER(...)
#endif

#ifndef kCFCoreFoundationVersionNumber_iPhoneOS_5_0
#define kCFCoreFoundationVersionNumber_iPhoneOS_5_0 674.0
#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
#define IF_IOS5_OR_GREATER(...) \
if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iPhoneOS_5_0) \
{ \
__VA_ARGS__ \
}
#else
#define IF_IOS5_OR_GREATER(...)
#endif

