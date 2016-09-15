//
//  Item.m
//  RandomItems
//
//  Created by Princess Sampson on 9/11/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "Item.h"

@implementation Item

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%@): Worth $%@, recorded on %@", self.name, self.serialNumber, @(self.valueInDollars), self.dateCreated];
}

- (instancetype)init {
    return [self initWithRandomValues];
}

- (instancetype)initWithRandomValues {
    NSArray *randomNoun = @[@"Gemstone", @"Macarons", @"Snapback", @"Water bottle", @"Hairtie"];
    NSArray *randomAdj = @[@"Opaque", @"Pealescent", @"Blue", @"Sleek", @"Convenient"];
    NSInteger nounIndex = arc4random_uniform((int) randomNoun.count);
    NSInteger adjIndex = arc4random_uniform((int) randomAdj.count);
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdj[adjIndex], randomNoun[nounIndex]];
    NSInteger randomValue = (int) arc4random_uniform(100);
    NSString *randomSerial = [[[NSUUID UUID] UUIDString] substringToIndex:5];
    
    return [self initWithName:randomName
                 serialNumber:randomSerial
               valueInDollars:randomValue];
}

- (instancetype)initWithName:(NSString*)name
                serialNumber:(NSString*)serialNumber
              valueInDollars:(NSInteger)valueInDollars {
    self = [super init];
    
    if (self) {
        _name = name;
        _valueInDollars = valueInDollars;
        _serialNumber = [serialNumber copy];
        _dateCreated = [NSDate date];
        
    }
    
    return self;
}

@end
