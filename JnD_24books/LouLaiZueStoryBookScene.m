//
//  LouLaiZueStoryBookScene.m
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "LouLaiZueStoryBookScene.h"
#define MAX_PAGE 6

@implementation LouLaiZueStoryBookScene

+(CCScene *) scene: (int) pageIndex
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	LouLaiZueStoryBookScene *layer = [[LouLaiZueStoryBookScene alloc] initWithPageIndex:pageIndex];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) initWithPageIndex: (int) pageIndex {
    
    if((self = [super init])) {
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        self.tag = pageIndex;
        CCSprite * sprite = nil;
        if (pageIndex == 1)
            sprite = [CCSprite spriteWithFile:@"page1.png"];
        else if (pageIndex == 2)
            sprite = [CCSprite spriteWithFile:@"page2.png"];
        else if (pageIndex == 3)
            sprite = [CCSprite spriteWithFile:@"page3.png"];
        else if (pageIndex == 4)
            sprite = [CCSprite spriteWithFile:@"page4.png"];
        else if (pageIndex == 5)
            sprite = [CCSprite spriteWithFile:@"page5.png"];
        else if (pageIndex == 6)
            sprite = [CCSprite spriteWithFile:@"page6.png"];
        sprite.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:sprite];
        
        CCMenuItemImage * prePageButton = [CCMenuItemImage itemWithNormalImage:@"previousPage.png" selectedImage:@"previousPage.png" disabledImage:@"previousPage.png" target:self selector:@selector(prePage:)];
        //prePageButton.position = ccp(50 - winSize.width/2, 50 - winSize.height/2);
        prePageButton.position = ccp(-356.0, -217.7);
        
        CCMenuItemImage * nextPageButton = [CCMenuItemImage itemWithNormalImage:@"nextPage.png" selectedImage:@"nextPage.png" disabledImage:@"nextPage.png" target:self selector:@selector(nextPage:)];
        //nextPageButton.position = ccp(winSize.width/2 - 50, 50 - winSize.height/2);
        nextPageButton.position = ccp(366.3, -209.1);
        
        if (pageIndex <= 1)
            prePageButton.visible = NO;
        if (pageIndex >= MAX_PAGE)
            nextPageButton.visible = NO;
        
        CCMenu * nextPageMenu = [CCMenu menuWithItems:nextPageButton, prePageButton, nil];
        [self addChild:nextPageMenu];
        
    }
    
    return self;
}

- (void) nextPage:(id)sender
{
    if (self.tag < MAX_PAGE)
    {
        CCScene * sc = [LouLaiZueStoryBookScene scene:(++self.tag)];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:sc backwards:false]];
    }
    
}

- (void) prePage:(id)sender
{
    if (self.tag > 1)
    {
        CCScene * sc = [LouLaiZueStoryBookScene scene:(--self.tag)];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:sc backwards:true]];
    }
}

@end

