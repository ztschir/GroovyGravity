//
//  Planet.m
//  Groovy Gravity
//
//  Created by Zachary Tschirhart on 7/5/14.
//  Copyright (c) 2014 Zachary Tschirhart. All rights reserved.
//

#import "Planet.h"

@implementation Planet


- (id) initWithImage: (NSString*) imageName withLocation:(CGPoint) location
             withBodyProperties:(SKPhysicsBody*) properties withSize:(CGFloat) size{
  [self setPlanetImage:imageName];
  [self setLocation:location];
  [self setBodyProperties:properties];
  [self setSize:size];
  return self;
}

@end
