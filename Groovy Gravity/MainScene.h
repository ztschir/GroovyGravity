//
//  MyScene.h
//  Groovy Gravity
//

//  Copyright (c) 2014 Zachary Tschirhart. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SolarMap.h"
#import "Planet.h"

@interface MainScene : SKScene

@property CGRect screenLocation;
@property SolarMap* map;

@end
