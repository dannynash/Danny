//
//  LouLaiZueP3Layer.m
//  JnD_24books
//
//  Created by Jerry on 13/3/25.
//
//

#import "LouLaiZueP3Layer.h"
#define MAXBAR 1080

@implementation LouLaiZueP3Layer

- (id)init {
    
    if ((self = [super init])) {
        
        _bg = [CCSprite spriteWithFile:@"bg_card.png"];
        _bg.position = ccp(580.0, 380.0);
        [self addChild:_bg];
        
        _cloud = [CCSprite spriteWithFile:@"cloud.png"];
        _cloud.position = ccp(340.9, 627.1);
        [_bg addChild:_cloud];
        
        _smallcloud = [CCSprite spriteWithFile:@"cloud.png"];
        _smallcloud.position = ccp(816.2, 691.8);
        _smallcloud.scale = 0.6;
        [_bg addChild:_smallcloud];
        
        _wall = [CCSprite spriteWithFile:@"wall.png"];
        _wall.position = ccp(587.2, 365.8);
        [_bg addChild:_wall];
        
        _well = [CCSprite spriteWithFile:@"well.png"];
        _well.position = ccp(818.7, 350.9);
        [_bg addChild:_well];
        
        _bucket = [CCSprite spriteWithFile:@"bucket.png"];
        _bucket.position = ccp(579.8, 131.9);
        [_bg addChild:_bucket];
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
    }
        NSLog(@"init");
    [self animation3];
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    return self;
}

-(void) animation3{
//    TODO animation;
    
    [self chageToRotateState];
}


-(void) chageToRotateState {
    
    CGSize winSize = [CCDirector sharedDirector].winSize;

    grayBackGround = [CCLayerColor layerWithColor:ccc4(166, 166, 166, 166)];
    [self addChild:grayBackGround];

    wellcircle = [CCSprite spriteWithFile:@"wellcircle.png"];
    wellcircle.position = ccp(winSize.width/2, winSize.height/2);
    [self addChild:wellcircle];
    
    wellstick = [CCSprite spriteWithFile:@"wellstick.png"];
    wellstick.anchorPoint = ccp(0.08f, 0.5f);
    wellstick.position = ccp(winSize.width/2, winSize.height/2);
    wellstick.rotation = -10;
    [self addChild:wellstick];
    
    wellbar = [CCSprite spriteWithFile:@"wellbar.png"];
    wellbar.position = ccp(winSize.width/10*9, winSize.height/2);
    [self addChild:wellbar];
    
    wellbucket = [CCSprite spriteWithFile:@"wellbucket.png"];
    wellbucket.position = ccp(wellbar.position.x, wellbar.position.y - wellbar.contentSize.height/2);
    [self addChild:wellbucket];

    NSLog(@"chageTo");
    point = 0;
    rationNum = 0;
    oldQuadrant = 1;
    
}

-(void) backToNormalState {
    
}

- (void)selectSpriteForTouch:(CGPoint)touchLocation {
    CCSprite * newSprite = nil;
    
    if (CGRectContainsPoint(wellstick.boundingBox, touchLocation)){
        newSprite = wellstick;
    }
    else{
        newSprite = nil;
    }
    
    if (newSprite != selSprite) {
        selSprite = newSprite;
    }
}

-(void)newMovePosition:(CGPoint)touchLocation oldPosition:(CGPoint)oldTouchLocation{
    if(selSprite){
        CGPoint vectorTouch = ccpSub(touchLocation, wellstick.position);
        float angle = ccpAngle(vectorTouch, CGPointMake(1, 0)) / M_PI * 180;
        
        int nowQuadrant = 1;
        
        if(touchLocation.x > wellstick.position.x && touchLocation.y >= wellstick.position.y){
            nowQuadrant = 1;
        }
        else if (touchLocation.x <= wellstick.position.x && touchLocation.y > wellstick.position.y){
            nowQuadrant = 2;
        }
        else if (touchLocation.x < wellstick.position.x && touchLocation.y <= wellstick.position.y){
            nowQuadrant = 3;
        }
        else if (touchLocation.x >= wellstick.position.x && touchLocation.y < wellstick.position.y){
            nowQuadrant = 4;
        }
        
        if ((nowQuadrant == 1) || (nowQuadrant == 2)){
            angle = -angle;
        }
        else{
            angle = angle;
        }
        
        [self rotateWellStick:angle];
        [self moveBucket:angle quadrant:nowQuadrant ];
    }
}

-(void) rotateWellStick:(CGFloat)angle {
    wellstick.rotation = angle;
}

-(void) rotateWellCircle:(CGFloat)angle {
    wellcircle.rotation = - angle / 2;
}

-(void) moveBucket:(CGFloat)angle quadrant:(int) qd{
    // turn it to 0 ~ 360
    if (qd == 1 || qd == 2) angle = -angle;
    else angle = 360 - angle;
    
    if (oldQuadrant == 4 && qd == 1){
        rationNum = rationNum + 1 ;
    }
    else if(oldQuadrant ==1 && qd == 4){
        rationNum = rationNum - 1 ;
    }
    point = angle + 360 * rationNum;
    
    NSLog(@"point = %f, rationNum = %d, nq= %d, oq = %d", point, rationNum, qd, oldQuadrant);
    
    oldQuadrant = qd;
    float offsetPoint = point / MAXBAR * wellbar.contentSize.height;
    if (point < 0) offsetPoint = 0;
    else if (point > MAXBAR) offsetPoint = wellbar.contentSize.height;
    
    NSLog(@"ratio = %f, wellbar = %f", point / MAXBAR, wellbar.contentSize.height);
    wellbucket.position = ccp(wellbucket.position.x, wellbar.position.y - wellbar.contentSize.height/2 + offsetPoint);
    
    [self rotateWellCircle:point];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    [self selectSpriteForTouch:touchLocation];
    return TRUE;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    
    [self newMovePosition:touchLocation oldPosition:oldTouchLocation];
}

@end
