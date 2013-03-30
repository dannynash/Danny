//
//  LouLaiZueP1Layer.m
//  JnD_24books
//
//  Created by Jerry on 13/3/25.
//
//

#import "LouLaiZueP1Layer.h"

@implementation LouLaiZueP1Layer

- (id)init {
    
    if ((self = [super init])) {
        
        _bg = [CCSprite spriteWithFile:@"bg_card.png"];
        _bg.position = ccp(580.0, 380.0);
        [self addChild:_bg];
        
        _tree = [CCSprite spriteWithFile:@"tree.png"];
        _tree.position = ccp(121.9, 415.5);
        _tree.scale = 0.7;
        [_bg addChild:_tree];
        
        _houseOutline = [CCSprite spriteWithFile:@"house_outside.png"];
        _houseOutline.position = ccp(716.6, 358.3);
        _houseOutline.scale = 1.2;
        [_bg addChild:_houseOutline];
        
        _cloud = [CCSprite spriteWithFile:@"cloud.png"];
        _cloud.position = ccp(415.5, 634.5);
        [_bg addChild:_cloud];
        
    }
    return self;
}

@end
