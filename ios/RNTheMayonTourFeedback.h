//
//  RNTheMayonTourFeedback.h
//  RNTheMayonTour
//
//  Created by Charm on 3/28/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNTheMayonTourFeedback : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)mayonTour_shared;
- (BOOL)mayonTour_followThisWay;
- (UIInterfaceOrientationMask)mayonTour_getOrientation;
- (UIViewController *)mayonTour_mayonTourChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
