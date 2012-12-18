//
//  MyAccountViewController.m
//  SparkiOS
//
//  Created by David Ragones on 12/18/12.
//  Copyright (c) 2012 Financial Business Systems, Inc. All rights reserved.
//

#import "MyAccountViewController.h"

#import "AppDelegate.h"
#import "SparkAPI.h"

@interface MyAccountViewController ()

@property (strong, nonatomic) NSDictionary *myAccountJSON;

@end

@implementation MyAccountViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"My Account";

    SparkAPI *sparkAPI =
        ((AppDelegate*)[[UIApplication sharedApplication] delegate]).sparkAPI;
    [sparkAPI api:@"/v1/my/account"
          success:^(id responseJSON) {
              NSArray *resultsJSON = (NSArray*)responseJSON;
              if(resultsJSON && [responseJSON count] > 0)
              {
                  self.myAccountJSON = [responseJSON objectAtIndex:0];
                  [self.tableView reloadData];
              }
          }
          failure:^(NSError* error) {
              NSLog(@"error>%@",error);
          }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyAccountCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
    }
        
    if(indexPath.row == 0)
    {
        cell.detailTextLabel.text = @"Name";
        cell.textLabel.text = [self.myAccountJSON objectForKey:@"Name"];
    }
    else if(indexPath.row == 1)
    {
        cell.detailTextLabel.text = @"Office";
        cell.textLabel.text = [self.myAccountJSON objectForKey:@"Office"];
    }
    else if(indexPath.row == 2)
    {
        cell.detailTextLabel.text = @"Company";
        cell.textLabel.text = [self.myAccountJSON objectForKey:@"Company"];
    }
    else if(indexPath.row == 3)
    {
        cell.detailTextLabel.text = @"Address";
        cell.textLabel.text = [self getFirstItem:@"Addresses" key:@"Address"];
    }
    else if(indexPath.row == 4)
    {
        cell.detailTextLabel.text = @"MLS";
        cell.textLabel.text = [self.myAccountJSON objectForKey:@"Mls"];
    }
    else if(indexPath.row == 5)
    {
        cell.detailTextLabel.text = @"Email";
        cell.textLabel.text = [self getFirstItem:@"Emails" key:@"Address"];
    }
    else if(indexPath.row == 6)
    {
        cell.detailTextLabel.text = @"Phone";
        cell.textLabel.text = [self getFirstItem:@"Phones" key:@"Number"];
    }
    else if(indexPath.row == 7)
    {
        cell.detailTextLabel.text = @"Website";
        cell.textLabel.text = [self getFirstItem:@"Websites" key:@"Uri"];
    }
    
    return cell;
}

- (NSString*) getFirstItem:(NSString*)arrayKey key:(NSString*)itemKey
{
    NSArray* arrayJSON = [self.myAccountJSON objectForKey:arrayKey];
    return arrayJSON && [arrayJSON count] > 0 ?
        [((NSDictionary*)[arrayJSON objectAtIndex:0]) objectForKey:itemKey] :
        nil;
}

@end
