//
//  SolarMap.m
//  Groovy Gravity
//
//  Created by Zachary Tschirhart on 7/5/14.
//  Copyright (c) 2014 Zachary Tschirhart. All rights reserved.
//

#import "SolarMap.h"

@implementation SolarMap

- (id) initWithSize:(CGSize) mapSize{
  [self setMapSize:mapSize];
  self.planetArray = [[NSMutableArray alloc] init];
  [self buildSolarMap];
  return self;
}

-(void)buildSolarMap{
  SKPhysicsBody *body = [[SKPhysicsBody alloc] init];
  [body setMass:10.0];
  [body setDynamic:true];
  [body setAffectedByGravity:false];
  [self.planetArray addObject:[[Planet alloc] initWithImage:@"GenericPlanet"
                                               withLocation:CGPointMake(50.0, 50.0)
                                         withBodyProperties:body
                                                   withSize:0.25]];
  
}


-(NSArray*)visiblePlanets: (CGRect) screenRect{
  NSPredicate * predicate = [NSPredicate predicateWithBlock: ^BOOL(id planet, NSDictionary *bind) {
    CGPoint shipLocation = ((Planet*)planet).location;
    return CGRectContainsPoint(screenRect, shipLocation);
  }];
  return [self.planetArray filteredArrayUsingPredicate:predicate];
  
}

//-(CGPoint)mapToScreenLocation: (CGPoint)plan

@end
