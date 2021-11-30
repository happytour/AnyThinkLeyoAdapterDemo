# TopOn-Leyou广告平台Adapter接入文档

## 将Leyou广告平台集成进TopOn聚合

参考官方文档[第三方广告平台接入指南](https://docs.toponad.com/#/zh-cn/android/NetworkAccess/customnetwork/customnetwork)，其中Step3跟Step4需要注意如下

### [Step3](https://docs.toponad.com/#/zh-cn/android/NetworkAccess/customnetwork/customnetwork?id=_31-%e6%b7%bb%e5%8a%a0%e8%87%aa%e5%ae%9a%e4%b9%89%e5%b9%bf%e5%91%8a%e5%b9%b3%e5%8f%b0)

填写**自定义广告平台**各个广告类型的**Adapter类名**（您需要根据TopOn提供的接入规范自行实现自定义广告平台的Adapter类。Adapter类名由您自行定义）

**激励视频：LeyouRewardedVideoAdapter**

**插屏：LeyouInterstitialAdapter**

**开屏：LeyouSplashAdapter**

### [Step4](https://docs.toponad.com/#/zh-cn/android/NetworkAccess/customnetwork/customnetwork?id=step4-%e6%b7%bb%e5%8a%a0%e8%87%aa%e5%ae%9a%e4%b9%89%e5%b9%bf%e5%91%8a%e5%b9%b3%e5%8f%b0%e7%9a%84%e5%b9%bf%e5%91%8a%e6%ba%90)

广告源的**参数**必须符合**json格式**

```json
{"slot_id":"从Leyou申请的代码位ID","app_id":"从Leyou申请的APPID"}	
```

## AnyThinkLeyoAdapter接入

### pod引入

```ruby
# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'
# 添加LYSpecs私库
source 'https://gitee.com/happytour/LYSpecs.git'

platform :ios, '9.0'

workspace 'AnyThinkLeyoAdapterDemo'
project 'AnyThinkLeyoAdapterDemo'

target 'AnyThinkLeyoAdapterDemo' do
  pod 'AnyThinkiOS', '5.7.81'
  # Adapter配置，需要引入LYSpecs私库
  pod 'AnyThinkLeyoAdapter', '1.0.0'
  # 预算SDK配置
  pod 'Ads-CN', '4.0.0.5'
  pod 'GDTMobSDK', '4.13.22'
  pod 'SigmobAd-iOS', '3.4.3'
  pod 'BaiduMobAdSDK', '4.81'
  pod 'WechatOpenSDK', '1.8.7.1'
  # KSAdSDKFull、QySdk、JADYun、KlevinAdSDK，没有提交到官方库，需要引入LYSpecs私库拉取
  pod 'fork-KSAdSDKFull', '3.3.23'
  pod 'fork-QySdk', '1.3.2'
  pod 'fork-JADYun' , '1.3.4'
  pod 'fork-KlevinAdSDK', '2.3.0.222'
    
  # Leyou广告SDK配置，需要引入LYSpecs私库
  pod 'LYAdSDK', '2.3.4'
  pod 'LYAdSDKAdapterForCSJ', '2.3.4'
  pod 'LYAdSDKAdapterForGDT', '2.3.3'
  pod 'LYAdSDKAdapterForKS', '2.3.0'
  pod 'LYAdSDKAdapterForSIG', '2.3.0'
  pod 'LYAdSDKAdapterForIQY', '2.3.0'
  pod 'LYAdSDKAdapterForBD', '2.3.0'
  pod 'LYAdSDKAdapterForJD', '2.3.0'
  pod 'LYAdSDKAdapterForKLN', '2.3.2'

  project 'AnyThinkLeyoAdapterDemo'
end
```

### 手动引入

[**AnyThinkLeyoAdapter.framework**下载](https://gitee.com/happytour/AnyThinkLeyoAdapter.framework)

需要依赖的frameworks = ["Foundation", "UIKit", "MobileCoreServices", "CoreGraphics", "Security", "SystemConfiguration", "CoreTelephony", "AdSupport", "CoreData", "StoreKit", "WebKit", "Accelerate"]

### iOS集成AnyThinkSDK

参考[AnyThinkSDK文档](https://docs.toponad.com/#/zh-cn/ios/ios_doc/ios_sdk_config_access)


