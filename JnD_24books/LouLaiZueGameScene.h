//
//  LouLaiZueGameScene.h
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "cocos2d.h"
#import "LayerWithPauseMenu.h"

@interface LouLaiZueGameScene : LayerWithPauseMenu {
    NSArray *pageArray;
    CCMenuItem *previousPage;
    CCMenuItem *nextPage;
    int curPageIndex;
}

+ (CCScene *) scene;
- (void) nextPage:(id)sender;
- (void) previousPage:(id)sender;
- (void) hideCurScene:(CCAction *)callback;

@end
