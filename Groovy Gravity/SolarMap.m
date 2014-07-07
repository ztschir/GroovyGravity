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
  [self.planetArray addObject:[[Planet alloc] initWithImage:@"GenericPlanet"
                                               withLocation:CGPointMake(50.0, 50.0)
                                                   withMass:10.0
                                                   withSize:0.25]];
  NSLog(@"planetArray:%@",self.planetArray);
  
}


-(NSArray*)visiblePlanets: (CGRect) screenRect{
  NSLog(@"screenX:%f  screenY:%f  screenW:%f  screenH:%f",screenRect.origin.x, screenRect.origin.y, screenRect.size.width, screenRect.size.height);
  NSPredicate * predicate = [NSPredicate predicateWithBlock: ^BOOL(id planet, NSDictionary *bind) {
    CGPoint shipLocation = ((Planet*)planet).location;
    return CGRectContainsPoint(screenRect, shipLocation);
  }];
  return [self.planetArray filteredArrayUsingPredicate:predicate];
  
}

//-(CGPoint)mapToScreenLocation: (CGPoint)plan

@end
