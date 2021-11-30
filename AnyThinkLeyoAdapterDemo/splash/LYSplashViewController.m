//
//  LYSplashViewController.m
//  AnyThinkLeyoAdapterDemo
//
//  Created by laole918 on 2021/5/10.
//

#import "LYSplashViewController.h"
#import <AnyThinkSplash/AnyThinkSplash.h>
#import "LYTopOnSlotID.h"

@interface LYSplashViewController ()<ATSplashDelegate>

@end

@implementation LYSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:NSLocalizedString(@"Splash", nil)];
    
    self.textField.text = ly_topon_splash_id;
    [self appendLogText:self.title];
}

- (void)clickBtnLoadAd {
    [self appendLogText:@"load SplashAd"];
    self.textField.enabled = NO;
    CGRect frame = [UIScreen mainScreen].bounds;
    CGRect splashFrame = CGRectMake(0, 0, frame.size.width, frame.size.height - 100);
    CGRect bottomFrame = CGRectMake(0, frame.size.height - 100, frame.size.width, 100);
    UILabel *bottomView = [[UILabel alloc] initWithFrame:bottomFrame];
    [bottomView setText:@"这是一个测试LOGO"];
    bottomView.backgroundColor = [UIColor redColor];
    [[ATAdManager sharedManager] loadADWithPlacementID:@"b61a584f70f84c" extra:@{kATSplashExtraRootViewControllerKey:self, kATAdLoadingExtraSplashAdSizeKey:@(CGSizeMake(CGRectGetWidth(splashFrame), CGRectGetHeight(splashFrame)))} delegate:self containerView:bottomView];
}

#pragma mark -- ATAdLoadingDelegate

-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID {
    [self appendLogText:[NSString stringWithFormat:@"didFinishLoadingADWithPlacementID: %@", placementID]];
    UIWindow *mainWindow = nil;
    if (@available(iOS 13.0, *)) {
        mainWindow = [UIApplication sharedApplication].windows.firstObject;
    } else {
        mainWindow = [UIApplication sharedApplication].keyWindow;
    }
    [[ATAdManager sharedManager] showSplashWithPlacementID:placementID window:mainWindow delegate:self];
}

-(void) didFailToLoadADWithPlacementID:(NSString*)placementID error:(NSError*)error {
    [self appendLogText:[NSString stringWithFormat:@"didFailToLoadADWithPlacementID: %@ error: %@, %@", placementID, error.domain, error.localizedDescription]];
}


//v 5.7.77
-(void) didFinishLoadingSplashADWithPlacementID:(NSString *)placementID isTimeout:(BOOL)isTimeout {
    [self appendLogText:[NSString stringWithFormat:@"didFinishLoadingSplashADWithPlacementID: %@", placementID]];
}

-(void) didTimeoutLoadingSplashADWithPlacementID:(NSString *)placementID {
    [self appendLogText:[NSString stringWithFormat:@"didTimeoutLoadingSplashADWithPlacementID: %@", placementID]];
}

#pragma mark -- ATSplashDelegate

-(void)splashDidShowForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    [self appendLogText:[NSString stringWithFormat:@"splashDidShowForPlacementID: %@", placementID]];
}

-(void)splashDidClickForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    [self appendLogText:[NSString stringWithFormat:@"splashDidClickForPlacementID: %@", placementID]];
}

-(void)splashDidCloseForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    [self appendLogText:[NSString stringWithFormat:@"splashDidCloseForPlacementID: %@", placementID]];
}

-(void)splashDeepLinkOrJumpForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra result:(BOOL)success {
    [self appendLogText:[NSString stringWithFormat:@"splashDeepLinkOrJumpForPlacementID: %@", placementID]];
}

-(void)splashZoomOutViewDidClickForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    [self appendLogText:[NSString stringWithFormat:@"splashZoomOutViewDidClickForPlacementID: %@", placementID]];
}

-(void)splashZoomOutViewDidCloseForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    [self appendLogText:[NSString stringWithFormat:@"splashZoomOutViewDidCloseForPlacementID: %@", placementID]];
}

// 5.7.53+
- (void)splashDetailDidClosedForPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    [self appendLogText:[NSString stringWithFormat:@"splashDetailDidClosedForPlacementID: %@", placementID]];
}

- (void)splashDidShowFailedForPlacementID:(NSString*)placementID error:(NSError *)error extra:(NSDictionary *)extra {
    [self appendLogText:[NSString stringWithFormat:@"splashDidShowFailedForPlacementID: %@", placementID]];
}

// 5.7.61+ This callback is triggered when the skip button is customized.
- (void)splashCountdownTime:(NSInteger)countdown forPlacementID:(NSString*)placementID extra:(NSDictionary *) extra {
    [self appendLogText:[NSString stringWithFormat:@"splashCountdownTime: %ld forPlacementID: %@", countdown, placementID]];
}

@end
