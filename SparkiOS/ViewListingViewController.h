//
//  ViewListingViewController.h
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

#import <UIKit/UIKit.h>

@protocol ViewListingViewControllerDelegate;

@interface ViewListingViewController : UITableViewController
    <UIScrollViewDelegate>

@property (strong, nonatomic) NSString *ListingId;

@property (assign) id <ViewListingViewControllerDelegate> delegate;

@end

@protocol ViewListingViewControllerDelegate
- (void)loadListing:(NSDictionary*)listingJSON;
@end