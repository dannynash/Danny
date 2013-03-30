//
//  LouLaiZueStoryBookScene.h
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "cocos2d.h"
#import "LayerWithPauseMenu.h"

@interface LouLaiZueStoryBookScene : LayerWithPauseMenu

+(CCScene *) scene: (int) pageIndex;
-(id) initWithPageIndex: (int) pageIndex;
- (void) prePage:(id)sender;
- (void) nextPage:(id)sender;

@end