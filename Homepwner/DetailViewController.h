//
//  DetailViewController.h
//  Homepwner
//
//  Created by Princess Sampson on 9/17/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Item;
@class ImageStore;

@interface DetailViewController : UIViewController
@property (nonatomic) Item *item;
@property (nonatomic) ImageStore *imageStore;

@end
