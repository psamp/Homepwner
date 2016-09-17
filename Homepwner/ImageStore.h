//
//  ImageStore.h
//  Homepwner
//
//  Created by Princess Sampson on 9/17/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageStore : NSObject

- (void)setImage:(UIImage*)image
          forKey:(NSString*)key;
- (UIImage*)imageForKey:(NSString*)key;
- (void)deleteImageForKey:(NSString*)key;


@end
