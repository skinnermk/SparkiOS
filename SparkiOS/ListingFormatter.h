//
//  ListingFormatter.h
//  SparkiOS
//
//  Created by David Ragones on 12/18/12.
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

@interface ListingFormatter : NSObject

+ (NSDate*)parseISO8601Date:(NSString*)string;

+ (NSString*)formatDateTime:(NSDate*)date;

+ (NSString*)formatPrice:(NSNumber*)price;

+ (NSString*)formatPriceShort:(NSNumber*)price;

+ (NSString*)getListingTitle:(NSDictionary*)standardFieldsJSON;

+ (NSString*)getListingSubtitle:(NSDictionary*)standardFieldsJSON;

@end
