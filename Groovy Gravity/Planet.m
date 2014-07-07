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
             withMass:(CGFloat) mass withSize:(CGFloat) size{
  [self setPlanetImage:imageName];
  [self setLocation:location];
  [self setMass:mass];
  [self setSize:size];
  return self;
}

@end
