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
@property CGVector shipVelocity;
@property CGVector shipAcceleration;
@property CGFloat deltaV;
@property SolarMap* map;
@property CGPoint firstTouchLocation;

@end
