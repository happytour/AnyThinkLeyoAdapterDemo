//
//  MainViewController.m
//  AnyThinkLeyoAdapterDemo
//
//  Created by laole918 on 2021/4/27.
//

#import "MainViewController.h"
#import "LYSplashViewController.h"
#import "LYInterstitialViewController.h"
#import "LYRewardVideoViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:@"AnyThinkLeyoAdapterDemo"];
    
    UIScrollView *layout = [[UIScrollView alloc] init];
    layout.frame = self.view.bounds;
    [self.view addSubview:layout];
    CGFloat y = -50;
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button.layer setCornerRadius:10.0];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(10, y += 60, self.view.bounds.size.width - 20, 50);
        [button setTitle:NSLocalizedString(@"Splash", nil) forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateFocused];
        [button addTarget:self action:@selector(clickBtnSplash) forControlEvents:UIControlEventTouchUpInside];
        [layout addSubview:button];
    }
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button.layer setCornerRadius:10.0];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(10, y += 60, self.view.bounds.size.width - 20, 50);
        [button setTitle:NSLocalizedString(@"Interstitial", nil) forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateFocused];
        [button addTarget:self action:@selector(clickBtnInterstitial) forControlEvents:UIControlEventTouchUpInside];
        [layout addSubview:button];
    }
    {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button.layer setCornerRadius:10.0];
        button.backgroundColor = [UIColor whiteColor];
        button.frame = CGRectMake(10, y += 60, self.view.bounds.size.width - 20, 50);
        [button setTitle:NSLocalizedString(@"RewardVideo", nil) forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateFocused];
        [button addTarget:self action:@selector(clickBtnRewardVideo) forControlEvents:UIControlEventTouchUpInside];
        [layout addSubview:button];
    }
    layout.contentSize = CGSizeMake(0, y + 60);
}

- (void)clickBtnSplash {
    LYSplashViewController *vc = [[LYSplashViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickBtnInterstitial {
    LYInterstitialViewController *vc = [[LYInterstitialViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickBtnRewardVideo {
    LYRewardVideoViewController *vc = [[LYRewardVideoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
