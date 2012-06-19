//
//  UIView+Blink.m
//  UIViewBlinking
//
//  Created by frowing on 13/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIView+Blink.h"

@implementation UIView (Blink)

- (void)privateBlinkWithDuration:(NSTimeInterval)duration 
                           speed:(NSTimeInterval)speed 
                 accumulatedTime:(NSTimeInterval)accumulatedTime 
                      hideOrShow:(BOOL)hide
                 completionBlock:(void (^)(void))completionBlock {
  
  [UIView animateWithDuration:speed animations:^{
    if (hide) {
      self.alpha = 0.0f;
    }
    else{
      self.alpha = 1.0f;
    }
  } 
   completion:^(BOOL finished) {
     if (accumulatedTime >= duration) {
       self.alpha = 1.0f;
       completionBlock();
     }
     else {
       [self privateBlinkWithDuration:duration 
                                speed:speed 
                      accumulatedTime:(accumulatedTime + speed) 
                           hideOrShow:!hide 
                  completionBlock:completionBlock]; 
     }                               
   }];  
}

- (void)blinkWithDuration:(NSTimeInterval)duration 
                    speed:(NSTimeInterval)speed 
      completionBlock:(void (^)(void))completionBlock {
  
  [UIView animateWithDuration:speed animations:^{
    self.alpha = 0.0f;
  } 
 completion:^(BOOL finished) {
   [self privateBlinkWithDuration:duration 
                            speed:speed 
                  accumulatedTime:0.0f 
                       hideOrShow:YES 
              completionBlock:completionBlock];                             
 }];
}

@end
