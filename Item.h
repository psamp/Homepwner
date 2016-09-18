//
//  Item.h
//  RandomItems
//
//  Created by Princess Sampson on 9/11/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (nonatomic, copy) NSString *itemKey;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *serialNumber;
@property(nonatomic) int valueInDollars;
@property(nonatomic, readonly, strong) NSDate *dateCreated;

- (instancetype)initWithRandomValues;
- (instancetype)initWithName:(NSString*)name
                serialNumber:(NSString*)serialNumber
                       valueInDollars:(int)valueInDollars NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)coder NS_DESIGNATED_INITIALIZER;

@end
