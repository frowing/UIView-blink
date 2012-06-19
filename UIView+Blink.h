//
//  UIView+Blink.h
//  UIViewBlinking
//
//  Created by frowing on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Blink)

- (void)blinkWithDuration:(NSTimeInterval)duration 
                    speed:(NSTimeInterval)speed 
      completionBlock:(void (^)(void))completionBlock;

@end
