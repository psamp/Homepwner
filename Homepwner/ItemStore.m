//
//  NItemStore.m
//  Homepwner
//
//  Created by Princess Sampson on 9/15/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "ItemStore.h"
#import "Item.h"

@interface ItemStore ()
@property(nonatomic) NSMutableArray *items;
@end

@implementation ItemStore

- (NSArray *)allItems {
    return [self.items copy];
}

- (Item *)createItem {
    Item *newItem = [[Item alloc] initWithRandomValues];
    [self.items addObject:newItem];
    return newItem;
}

- (void)moveItemAtIndex:(NSUInteger)oldIndex toIndex:(NSUInteger)newIndex {
    if(oldIndex == newIndex) {
        return;
    }
    
    Item *item = self.items[oldIndex];
    [self.items removeObjectAtIndex:oldIndex];
    [self.items insertObject:item atIndex:newIndex];
}

- (void)removeItem:(Item *)item {
    [self.items removeObject:item];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _items = [NSMutableArray array];
    }
    return self;
}

@end
