//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Princess Sampson on 9/15/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemStore;

@interface ItemsViewController : UITableViewController
@property(nonatomic) ItemStore *itemStore;

@end
