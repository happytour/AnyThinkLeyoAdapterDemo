//
//  LYInterstitialViewController.m
//  AnyThinkLeyoAdapterDemo
//
//  Created by laole918 on 2021/5/10.
//

#import "LYInterstitialViewController.h"
#import <AnyThinkSDK/AnyThinkSDK.h>
#import <AnyThinkInterstitial/AnyThinkInterstitial.h>
#import "LYTopOnSlotID.h"

@interface LYInterstitialViewController ()<ATInterstitialDelegate>


@end

@implementation LYInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:NSLocalizedString(@"Interstitial", nil)];
    
    self.textField.text = ly_topon_interstitial_id;
    [self appendLogText:self.title];
}

- (void)clickBtnLoadAd {
    [self appendLogText:@"load InterstitialAd"];
    self.textField.enabled = NO;

    [[ATAdManager sharedManager] loadADWithPlacementID:self.textField.text extra:nil delegate:self];
}

#pragma mark -- ATAdLoadingDelegate

-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID {
    [self appendLogText:[NSString stringWithFormat:@"didFinishLoadingADWithPlacementID: %@", placementID]];
    [[ATAdManager sharedManager] showInterstitialWithPlacementID:placementID inViewController:self delegate:self];
}

-(void) didFailToLoadADWithPlacementID:(NSString*)placementID error:(NSError*)error {
    [self appendLogText:[NSString stringWithFormat:@"didFailToLoadADWithPlacementID: %@ error:%@,%@", placementID, error.domain, error.localizedDescription]];
}

-(void) didFinishLoadingSplashADWithPlacementID:(NSString *)placementID isTimeout:(BOOL)isTimeout {}
-(void) didTimeoutLoadingSplashADWithPlacementID:(NSString *)placementID {}

#pragma mark -- ATInterstitialDelegate

-(void) interstitialDidShowForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"interstitialDidShowForPlacementID: %@", placementID]];
}

-(void) interstitialFailedToShowForPlacementID:(NSString*)placementID error:(NSError*)error extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"interstitialFailedToShowForPlacementID: %@", placementID]];
}

-(void) interstitialDidStartPlayingVideoForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"interstitialDidStartPlayingVideoForPlacementID: %@", placementID]];
}

-(void) interstitialDidEndPlayingVideoForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"interstitialDidEndPlayingVideoForPlacementID: %@", placementID]];
}

-(void) interstitialDidFailToPlayVideoForPlacementID:(NSString*)placementID error:(NSError*)error extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"interstitialDidFailToPlayVideoForPlacementID: %@", placementID]];
}

-(void) interstitialDidCloseForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"interstitialDidCloseForPlacementID: %@", placementID]];
}

-(void) interstitialDidClickForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"interstitialDidClickForPlacementID: %@", placementID]];
}

-(void) interstitialDeepLinkOrJumpForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra result:(BOOL)success {
    [self appendLogText:[NSString stringWithFormat:@"interstitialDeepLinkOrJumpForPlacementID: %@", placementID]];
}

@end
