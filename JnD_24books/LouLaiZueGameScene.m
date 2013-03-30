//
//  LouLaiZueGameScene.m
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "LouLaiZueGameScene.h"
#import "LouLaiZueP1Layer.h"
#import "LouLaiZueP2Layer.h"
#import "LouLaiZueP3Layer.h"
#import "LouLaiZueP4Layer.h"
#import "LouLaiZueP5Layer.h"
#import "LouLaiZueP6Layer.h"

@implementation LouLaiZueGameScene

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    LouLaiZueGameScene *layer = [LouLaiZueGameScene node];
    [scene addChild: layer];
    
    return scene;
}

- (id)init {
    
    if ((self = [super init])) {
        
        curPageIndex = 0;
        pageArray = [[NSArray alloc] initWithObjects:
        [[LouLaiZueP1Layer alloc] init],
        [[LouLaiZueP2Layer alloc] init],
        [[LouLaiZueP3Layer alloc] init],
        [[LouLaiZueP4Layer alloc] init],
        [[LouLaiZueP5Layer alloc] init],
        [[LouLaiZueP6Layer alloc] init],
        nil];

        for (CCLayer *page in pageArray)
        {
            page.position = ccp(page.position.x + 1500, page.position.y);
            [self addChild:page];
        }
        
        previousPage = [[CCMenuItemImage
                            itemFromNormalImage:@"previousPage.png"
                             selectedImage:@"previousPage.png"
                             target:self
                             selector:@selector(previousPage:)] retain];
        previousPage.position = ccp(-356.0, -217.7);
        previousPage.visible = NO;

        nextPage = [[CCMenuItemImage
                             itemFromNormalImage:@"nextPage.png"
                             selectedImage:@"nextPage.png"
                             target:self
                             selector:@selector(nextPage:)] retain];
        nextPage.position = ccp(366.3, -209.1);

        CCMenu *next_previousPageMenu = [CCMenu menuWithItems:previousPage, nextPage, nil];
        [self addChild:next_previousPageMenu];
        
        LouLaiZuePageLayer *_firstPage = [pageArray objectAtIndex:0];
        [_firstPage showCurScene:nil goLeft:YES];
        
    }
    return self;
}

- (void) nextPage:(id)sender{
    
    previousPage.visible = NO;
    nextPage.visible = NO;

    if (curPageIndex >= [pageArray count] -1)
        return;
    
    LouLaiZuePageLayer *_curPage = [pageArray objectAtIndex:curPageIndex];
    LouLaiZuePageLayer *_nextPage = [pageArray objectAtIndex:++curPageIndex];
    
    CCAction *fadein = [CCCallBlock actionWithBlock:^{
        [_nextPage showCurScene:[CCCallBlock actionWithBlock:^{
            if (curPageIndex < pageArray.count -1)
                nextPage.visible = YES;
            previousPage.visible = YES;
        }] goLeft:YES];
    }];
    [_curPage hideCurScene:fadein goLeft:YES];
     
}

- (void) previousPage:(id)sender {
    previousPage.visible = NO;
    nextPage.visible = NO;
    
    if (curPageIndex <= 0)
        return;
    
    LouLaiZuePageLayer *_curPage = [pageArray objectAtIndex:curPageIndex];
    LouLaiZuePageLayer *_nextPage = [pageArray objectAtIndex:--curPageIndex];
    
    CCAction *fadein = [CCCallBlock actionWithBlock:^{
        [_nextPage showCurScene:[CCCallBlock actionWithBlock:^{
            if (curPageIndex > 0)
                previousPage.visible = YES;
            nextPage.visible = YES;
        }] goLeft:NO];
    }];
    [_curPage hideCurScene:fadein goLeft:NO];
     
}

- (void) hideCurScene:(CCAction *)callback{
    
    LouLaiZuePageLayer *_curPage = [pageArray objectAtIndex:curPageIndex];
    
    CCSequence *s1 = [CCSequence actions:
                      [CCCallBlock actionWithBlock:^(void)
                       {
                           [_curPage hideCurScene:callback goLeft:NO];
                       }],
                      nil];
    
    [self runAction:s1];
}

@end
