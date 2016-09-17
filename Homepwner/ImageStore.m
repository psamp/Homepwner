//
//  ImageStore.m
//  Homepwner
//
//  Created by Princess Sampson on 9/17/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "ImageStore.h"

@interface ImageStore ()
@property(nonatomic) NSCache *cache;
@end

@implementation ImageStore

- (instancetype)init {
    self = [super init];
    if (self) {
        _cache = [NSCache new];
    }
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key {
    [self.cache setObject:image forKey:key];
}

- (UIImage *)imageForKey:(NSString *)key {
    return [self.cache objectForKey:key];
}

- (void)deleteImageForKey:(NSString *)key {
    [self.cache removeObjectForKey:key];
}

@end
