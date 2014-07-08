//
//  Planet.h
//  Groovy Gravity
//
//  Created by Zachary Tschirhart on 7/5/14.
//  Copyright (c) 2014 Zachary Tschirhart. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <Foundation/Foundation.h>

@interface Planet : NSObject{
}

@property CGPoint location;
@property CGFloat size; //Possibly redundant, but could provide dense stars or something.
@property NSString* planetImage;
@property SKPhysicsBody* bodyProperties;

- (id) initWithImage: (NSString*) imageName withLocation:(CGPoint) location
          withBodyProperties:(SKPhysicsBody*) properties withSize:(CGFloat) size;

@end
