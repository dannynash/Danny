//
//  LouLaiZuePageLayer.h
//  JnD_24books
//
//  Created by Jerry on 13/3/26.
//
//

#import "cocos2d.h"

@interface LouLaiZuePageLayer : CCLayer

- (void) hideCurScene:(CCAction *)callback goLeft:(Boolean) goLeft;
- (void) showCurScene:(CCAction *)callback goLeft:(Boolean) goLeft;

@end
