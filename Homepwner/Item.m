//
//  Item.m
//  RandomItems
//
//  Created by Princess Sampson on 9/11/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "Item.h"

@interface Item () <NSCoding>

@end

@implementation Item

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%@): Worth $%@, recorded on %@", self.name, self.serialNumber, @(self.valueInDollars), self.dateCreated];
}

- (instancetype)init {
    return [self initWithRandomValues];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        _itemKey = [coder decodeObjectForKey:@"itemKey"];
        _name = [coder decodeObjectForKey:@"name"];
        _dateCreated = [coder decodeObjectForKey:@"dateCreated"];
        _valueInDollars = [coder decodeIntForKey:@"valueInDollars"];
    }
    return self;
}

- (instancetype)initWithRandomValues {
    NSArray *randomNoun = @[@"Gemstone", @"Macarons", @"Snapback", @"Water bottle", @"Hairtie"];
    NSArray *randomAdj = @[@"Opaque", @"Pearlescent", @"Blue", @"Sleek", @"Convenient"];
    NSInteger nounIndex = arc4random_uniform((int) randomNoun.count);
    NSInteger adjIndex = arc4random_uniform((int) randomAdj.count);
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdj[adjIndex], randomNoun[nounIndex]];
    int randomValue = (int) arc4random_uniform(100);
    NSString *randomSerial = [[[NSUUID UUID] UUIDString] substringToIndex:5];
    
    return [self initWithName:randomName
                 serialNumber:randomSerial
               valueInDollars:randomValue];
}

- (instancetype)initWithName:(NSString*)name
                serialNumber:(NSString*)serialNumber
              valueInDollars:(int)valueInDollars {
    self = [super init];
    
    if (self) {
        _itemKey = [NSUUID UUID].UUIDString;
        _name = name;
        _valueInDollars = valueInDollars;
        _serialNumber = [serialNumber copy];
        _dateCreated = [NSDate date];
        
    }
    
    return self;
}


-(void)encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeObject:self.itemKey forKey:@"itemKey"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.dateCreated forKey:@"dateCreated"];
    [aCoder encodeObject:self.serialNumber forKey:@"serialNumber"];
    
    [aCoder encodeInteger:self.valueInDollars forKey:@"valueInDollars"];
}

@end
