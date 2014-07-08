//
//  MyScene.m
//  Groovy Gravity
//
//  Created by Zachary Tschirhart on 7/5/14.
//  Copyright (c) 2014 Zachary Tschirhart. All rights reserved.
//

#import "MainScene.h"

@implementation MainScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
      self.backgroundColor = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
      SKLabelNode *startLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
      
      startLabel.text = @"Groovy Gravity";
      startLabel.fontSize = 30;
      startLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                     CGRectGetMidY(self.frame));
        
      [self addChild:startLabel];
      [self addChild:[self startGameNode]];
    }
    return self;
}

- (SKSpriteNode *)startGameNode
{
  float buttonWidth = 160.0;
  float buttonHeight = 40.0;
  float offset = 50.0;
  
  SKSpriteNode *startNode = [SKSpriteNode spriteNodeWithColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0]
                                                         size:CGSizeMake(buttonWidth,buttonHeight)];
  SKLabelNode *startText = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
  startText.text = @"Start Game";
  startText.fontSize = 15;
  startText.name = @"startButtonNode";
  [startNode addChild:startText];
  
  startNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - offset);
  startNode.name = @"startButtonNode";
  startNode.zPosition = 1.0;
  return startNode;
}

-(void)setupScene{
  [self drawShip];
  [self drawMap];
  
  //SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
  //[sprite runAction:[SKAction repeatActionForever:action]];
}

-(void)drawShip{
  // TODO: Need a better way to set ship location on screen
  CGPoint location = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 100.0);
  SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
  [sprite setScale:0.25];
  sprite.position = location;
  [self addChild:sprite];
}

-(void)drawMap{
  // TODO: set location stuff
  self.screenLocation = CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height);
  self.shipVelocity = CGVectorMake(0.0, 0.0);
  self.shipAcceleration = CGVectorMake(0.0, 0.0);
  self.map = [[SolarMap alloc] initWithSize:CGSizeMake(5000.0, 5000.0)];
  
  // TODO: move function to SolarMap
  NSArray* visiblePlanets = [self.map visiblePlanets:self.screenLocation];
  for (Planet* planet in visiblePlanets){
    SKSpriteNode *node = [SKSpriteNode spriteNodeWithImageNamed:planet.planetImage];
    [node setPosition:CGPointMake(planet.location.x - self.screenLocation.origin.x,
                                  planet.location.y - self.screenLocation.origin.y)];
    [node setScale:planet.size];
    [node setPhysicsBody:planet.bodyProperties];
    [self addChild:node];
  }
}

-(void)updateVelocity{
  CGVector temp = self.shipVelocity;
  self.shipVelocity = CGVectorMake(temp.dx, temp.dy + self.deltaV);
  [self setVelocity:self.shipVelocity];
  //  NSLog(@"shipVelDX %f", self.shipVelocity)
}

-(void)setVelocity:(CGVector) vector{
  NSArray* visiblePlanets = [self.map visiblePlanets:self.screenLocation];
  for (Planet* planet in visiblePlanets){
    vector.dx = -vector.dx;
    vector.dy = -vector.dy;
    [planet.bodyProperties setVelocity:vector];
  }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  self.firstTouchLocation = [touch locationInNode:self];
  SKNode *node = [self nodeAtPoint:self.firstTouchLocation];
  
  if ([node.name isEqualToString:@"startButtonNode"]) {
    [self removeAllChildren];
    [self setupScene];
  }
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  UITouch *touch = [touches anyObject];
  CGPoint location = [touch locationInNode:self];
  SKNode *node = [self nodeAtPoint:location];
  if (![node.name isEqualToString:@"startButtonNode"]) {
    self.deltaV += self.firstTouchLocation.y - location.y;
    self.firstTouchLocation = location;
    [self updateVelocity];
  }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
