//
//  UIHelper.h
//  SparkiOS
//
//  Created by David Ragones on 12/17/12.
//
//  Copyright (c) 2013 Financial Business Systems, Inc. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <Foundation/Foundation.h>

#import "AppDelegate.h"
#import "SparkAPI.h"

@interface UIHelper : NSObject

+ (BOOL) iPhone;
+ (BOOL) iPhone5;
+ (BOOL) iPad;
+ (BOOL) isOAuth;

+ (AppDelegate*)getAppDelegate;
+ (SparkAPI*)getSparkAPI;

+ (UIViewController*)getHomeViewController;
+ (UINavigationController*)getNavigationController:(UIViewController*)rootViewController;
+ (UISplitViewController*)getSplitViewController;

+ (void)iPhone5Shift:(UIView*)v;

+ (void)handleFailure:(NSString*)message
                error:(NSError*)error;
+ (void)handleFailure:(UIViewController*)viewController
                 code:(NSInteger)sparkErrorCode
              message:(NSString*)sparkErrorMessage
                error:(NSError*)error;

+ (void)logout:(UIViewController*)viewController;

@end
