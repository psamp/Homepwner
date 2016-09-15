//
//  ItemStore.h
//  Homepwner
//
//  Created by Princess Sampson on 9/15/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;
@interface ItemStore : NSObject
- (NSArray*)allItems;
- (Item*)createItem;

@end
