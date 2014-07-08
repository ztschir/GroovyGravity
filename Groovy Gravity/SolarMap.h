//
//  SolarMap.h
//  Groovy Gravity
//
//  Created by Zachary Tschirhart on 7/5/14.
//  Copyright (c) 2014 Zachary Tschirhart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Planet.h"

@interface SolarMap : NSObject{
  
}
@property CGSize mapSize;
@property NSMutableArray* planetArray;

- (id) initWithSize:(CGSize) mapSize;
-(NSArray*)visiblePlanets: (CGRect) location;
@end

