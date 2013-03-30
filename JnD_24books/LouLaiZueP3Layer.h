//
//  LouLaiZueP3Layer.h
//  JnD_24books
//
//  Created by Jerry on 13/3/25.
//
//

#import "cocos2d.h"
#import "LouLaiZuePageLayer.h"

@interface LouLaiZueP3Layer : LouLaiZuePageLayer{
    CCSprite *_cloud;
    CCSprite *_smallcloud;
    CCSprite *_wall;
    CCSprite *_well;
    CCSprite *_bucket;
    CCSprite *_bg;
    
    CCLayerColor * grayBackGround;
    CCSprite     * wellcircle;
    CCSprite     * wellstick;
    CCSprite     * wellbucket;
    CCSprite     * wellbar;
    
    CCSprite     * selSprite;
    int            oldQuadrant;
    float          point;
    int            rationNum;
}

@end
