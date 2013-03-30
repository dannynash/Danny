//
//  LouLaiZueP4Layer.m
//  JnD_24books
//
//  Created by Jerry on 13/3/25.
//
//

#import "LouLaiZueP4Layer.h"

@implementation LouLaiZueP4Layer

- (id)init {
    
    if ((self = [super init])) {
        
        _bg = [CCSprite spriteWithFile:@"bg_card.png"];
        _bg.position = ccp(580.0, 380.0);
        [self addChild:_bg];
        
        _smallcloud = [CCSprite spriteWithFile:@"cloud.png"];
        _smallcloud.position = ccp(16.2, 691.8);
        _smallcloud.scale = 0.6;
        [_bg addChild:_smallcloud];
        
        _wall = [CCSprite spriteWithFile:@"wall.png"];
        _wall.position = ccp(587.2, 365.8);
        [_bg addChild:_wall];
        
        _well = [CCSprite spriteWithFile:@"well.png"];
        _well.position = ccp(18.7, 350.9);
        [_bg addChild:_well];
        
        _stone = [CCSprite spriteWithFile:@"stone.png"];
        _stone.position = ccp(286.2, 74.6);
        [_bg addChild:_stone];
        
        _bucket = [CCSprite spriteWithFile:@"bucket.png"];
        _bucket.position = ccp(756.4, 104.5);
        _bucket.rotation = 80.0;
        [_bg addChild:_bucket];
        
    }
    return self;
}

@end
