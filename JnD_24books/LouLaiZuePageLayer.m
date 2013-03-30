//
//  LouLaiZuePageLayer.m
//  JnD_24books
//
//  Created by Jerry on 13/3/26.
//
//

#import "LouLaiZuePageLayer.h"

@implementation LouLaiZuePageLayer

- (id)init {
    
    if ((self = [super init])) {
        
    }
    return self;
}

- (void) hideCurScene:(CCAction *)callback goLeft:(Boolean) goLeft {
    CCTargetedAction *t1 = nil;
    
    if (goLeft)
    {
        t1 =[[CCTargetedAction actionWithTarget:self action:[CCMoveBy actionWithDuration:0.5 position:ccp(-1500.0, 0)]] retain];
    }
    else
    {
        t1 =[[CCTargetedAction actionWithTarget:self action:[CCMoveBy actionWithDuration:0.5 position:ccp(1500.0, 0)]] retain];
    }
    
    CCSequence *s1 = [CCSequence actions:t1, callback, nil];
    [self runAction:s1];
}

- (void) showCurScene:(CCAction *)callback goLeft:(Boolean) goLeft{
    CCTargetedAction *t1 = nil;
    
    if (goLeft)
    {
        t1 =[[CCTargetedAction actionWithTarget:self action:[CCMoveBy actionWithDuration:0.5 position:ccp(-1500.0, 0)]] retain];
    }
    else
    {
        t1 =[[CCTargetedAction actionWithTarget:self action:[CCMoveBy actionWithDuration:0.5 position:ccp(1500.0, 0)]] retain];
    }
    
    CCSequence *s1 = [CCSequence actions:t1, callback, nil];
    [self runAction:s1];
}

@end