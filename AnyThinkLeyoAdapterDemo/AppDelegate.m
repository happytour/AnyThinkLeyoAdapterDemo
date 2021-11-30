//
//  AppDelegate.m
//  AnyThinkLeyoAdapterDemo
//
//  Created by laole918 on 2021/11/29.
//

#import "AppDelegate.h"
#import "LogoViewController.h"
#import "MainViewController.h"
#import <AnyThinkSDK/AnyThinkSDK.h>
#import <AnyThinkSplash/AnyThinkSplash.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import "LYTopOnSlotID.h"

@interface AppDelegate ()<ATSplashDelegate>

@property (nonatomic, strong) LogoViewController *logoController;
@property (nonatomic, strong) UINavigationController *rootController;

@property (nonatomic, assign) NSTimeInterval lastActiveTime;
@property (nonatomic, assign) BOOL didEnterBackground;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor grayColor];
    MainViewController *main = [[MainViewController alloc] init];
    self.rootController = [[UINavigationController alloc] initWithRootViewController:main];
    self.logoController = [[LogoViewController alloc] init];
    
    self.window.rootViewController = self.logoController;
    [self.window makeKeyAndVisible];
    
    [[ATAPI sharedInstance] startWithAppID:ly_topon_app_id appKey:ly_topon_app_key error:nil];
    return YES;
}

- (void)loadAd {
    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];
    if (self.lastActiveTime == 0) {
        self.lastActiveTime = time;
        [self loadAd2];
    } else {
        //指定一个最小展示间隔
        if (time - self.lastActiveTime >= 60 && self.didEnterBackground) {
            self.lastActiveTime = time;
            [self loadAd2];
        }
        self.didEnterBackground = NO;
    }
}

- (void)loadAd2 {
    [[ATAdManager sharedManager] loadADWithPlacementID:ly_topon_splash_id extra:@{kATSplashExtraRootViewControllerKey:self.rootController} delegate:self containerView:nil];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
            [self loadAd];
        }];
    } else {
        [self loadAd];
    }
}

#pragma mark -- ATAdLoadingDelegate

-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID {
    self.window.rootViewController = self.rootController;
    UIWindow *mainWindow = nil;
    if (@available(iOS 13.0, *)) {
        mainWindow = [UIApplication sharedApplication].windows.firstObject;
    } else {
        mainWindow = [UIApplication sharedApplication].keyWindow;
    }
    [[ATAdManager sharedManager] showSplashWithPlacementID:placementID window:mainWindow delegate:self];
}

-(void) didFailToLoadADWithPlacementID:(NSString*)placementID error:(NSError*)error {
    self.window.rootViewController = self.rootController;
}


//v 5.7.77
-(void) didFinishLoadingSplashADWithPlacementID:(NSString *)placementID isTimeout:(BOOL)isTimeout {
    
}

-(void) didTimeoutLoadingSplashADWithPlacementID:(NSString *)placementID {
    
}

#pragma mark -- ATSplashDelegate

-(void)splashDidShowForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    
}

-(void)splashDidClickForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    
}

-(void)splashDidCloseForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    
}

-(void)splashDeepLinkOrJumpForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra result:(BOOL)success {
    
}

-(void)splashZoomOutViewDidClickForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    
}

-(void)splashZoomOutViewDidCloseForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    
}

// 5.7.53+
- (void)splashDetailDidClosedForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    
}

- (void)splashDidShowFailedForPlacementID:(NSString*)placementID error:(NSError *)error extra:(NSDictionary *)extra {
    
}

// 5.7.61+ This callback is triggered when the skip button is customized.
- (void)splashCountdownTime:(NSInteger)countdown forPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    
}


@end
