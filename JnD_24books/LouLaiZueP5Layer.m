//
//  LouLaiZueP5Layer.m
//  JnD_24books
//
//  Created by Jerry on 13/3/25.
//
//

#import "LouLaiZueP5Layer.h"

@implementation LouLaiZueP5Layer

- (id)init {
    
    if ((self = [super init])) {
        
        _bg = [CCSprite spriteWithFile:@"bg_card.png"];
        _bg.position = ccp(580.0, 380.0);
        [self addChild:_bg];
        
        _longchair = [CCSprite spriteWithFile:@"longchair.png"];
        _longchair.position = ccp(729.1, 410.6);
        [_bg addChild:_longchair];
        
        _smalltree = [CCSprite spriteWithFile:@"smalltree.png"];
        _smalltree.position = ccp(149.3, 472.8);
        _smalltree.scale = 0.8;
        [_bg addChild:_smalltree];
        
    }
    return self;
}

@end
