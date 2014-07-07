//
//  Planet.h
//  Groovy Gravity
//
//  Created by Zachary Tschirhart on 7/5/14.
//  Copyright (c) 2014 Zachary Tschirhart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Planet : NSObject{
}

@property CGPoint location;
@property CGFloat mass;
@property CGFloat size; //Possibly redundant, but could provide dense stars or something.
@property NSString* planetImage;

- (id) initWithImage: (NSString*) imageName withLocation:(CGPoint) location
          withMass:(CGFloat) mass withSize:(CGFloat) size;

@end
