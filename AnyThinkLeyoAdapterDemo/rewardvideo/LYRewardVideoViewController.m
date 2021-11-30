//
//  LYRewardVideoViewController.m
//  AnyThinkLeyoAdapterDemo
//
//  Created by laole918 on 2021/5/10.
//

#import "LYRewardVideoViewController.h"
#import <AnyThinkRewardedVideo/AnyThinkRewardedVideo.h>
#import "LYTopOnSlotID.h"

@interface LYRewardVideoViewController ()<UITextFieldDelegate, ATRewardedVideoDelegate>

@property (nonatomic, strong) UITextField *userIdTextField;
@property (nonatomic, strong) UITextField *extraTextField;
@end

@implementation LYRewardVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:NSLocalizedString(@"RewardVideo", nil)];
    
    self.textField.text = ly_topon_reward_id;
    [self appendLogText:self.title];
    
    {
        self.userIdTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, self.y += 10, CGRectGetWidth(self.view.frame) - 20, 50)];
        self.userIdTextField.placeholder = @"userId";
        self.userIdTextField.returnKeyType = UIReturnKeyDone;
        self.userIdTextField.borderStyle = UITextBorderStyleLine;
    //    self.textField.keyboardType = UIKeyboardTypeNumberPad;
        self.userIdTextField.delegate = self;
        [self.view addSubview:self.userIdTextField];
    }
    
    self.extraTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, self.y += 60, CGRectGetWidth(self.view.frame) - 20, 50)];
    self.extraTextField.placeholder = @"extra";
    self.extraTextField.returnKeyType = UIReturnKeyDone;
    self.extraTextField.borderStyle = UITextBorderStyleLine;
//    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    self.extraTextField.delegate = self;
    [self.view addSubview:self.extraTextField];

}

- (void)clickBtnLoadAd {
    [self appendLogText:@"load RewardVideoAd"];
    self.textField.enabled = NO;
    NSMutableDictionary * extra = [NSMutableDictionary new];
    if (self.userIdTextField.text && self.userIdTextField.text.length > 0) {
        [extra setValue:self.userIdTextField.text forKey:kATAdLoadingExtraUserIDKey];
    }
    if (self.extraTextField.text && self.extraTextField.text.length > 0) {
        [extra setValue:self.extraTextField.text forKey:kATAdLoadingExtraMediaExtraKey];
    }
    [[ATAdManager sharedManager] loadADWithPlacementID:self.textField.text extra:extra delegate:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.userIdTextField resignFirstResponder];
    [self.extraTextField resignFirstResponder];
    return YES;
}

#pragma mark --ATAdLoadingDelegate

-(void) didFinishLoadingADWithPlacementID:(NSString *)placementID {
    [self appendLogText:[NSString stringWithFormat:@"didFinishLoadingADWithPlacementID: %@", placementID]];
    [[ATAdManager sharedManager] showRewardedVideoWithPlacementID:placementID inViewController:self delegate:self];
}

-(void) didFailToLoadADWithPlacementID:(NSString*)placementID error:(NSError*)error {
    [self appendLogText:[NSString stringWithFormat:@"didFailToLoadADWithPlacementID: %@ error: %@,%@", placementID, error.domain, error.localizedDescription]];
}

-(void) didFinishLoadingSplashADWithPlacementID:(NSString *)placementID isTimeout:(BOOL)isTimeout {}
-(void) didTimeoutLoadingSplashADWithPlacementID:(NSString *)placementID {}

#pragma mark --ATRewardedVideoDelegate

-(void) rewardedVideoDidStartPlayingForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"rewardedVideoDidStartPlayingForPlacementID: %@", placementID]];
}

-(void) rewardedVideoDidEndPlayingForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"rewardedVideoDidEndPlayingForPlacementID: %@", placementID]];
}

-(void) rewardedVideoDidFailToPlayForPlacementID:(NSString*)placementID error:(NSError*)error extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"rewardedVideoDidFailToPlayForPlacementID: %@", placementID]];
}

-(void) rewardedVideoDidCloseForPlacementID:(NSString*)placementID rewarded:(BOOL)rewarded extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"rewardedVideoDidCloseForPlacementID: %@", placementID]];
}

-(void) rewardedVideoDidClickForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"rewardedVideoDidClickForPlacementID: %@", placementID]];
}

-(void) rewardedVideoDidRewardSuccessForPlacemenID:(NSString*)placementID extra:(NSDictionary*)extra {
    [self appendLogText:[NSString stringWithFormat:@"rewardedVideoDidRewardSuccessForPlacemenID: %@", placementID]];
}

-(void) rewardedVideoDidDeepLinkOrJumpForPlacementID:(NSString*)placementID extra:(NSDictionary*)extra result:(BOOL)success {
    [self appendLogText:[NSString stringWithFormat:@"rewardedVideoDidDeepLinkOrJumpForPlacementID: %@", placementID]];
}

@end
