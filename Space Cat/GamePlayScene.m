//
//  GamePlayScene.m
//  Space Cat
//
//  Created by Basel Farag on 8/23/14.
//  Copyright (c) 2014 NextTierGames. All rights reserved.
//

#import "GamePlayScene.h"
#import "MachineNode.h"
#import "SpaceCat.h"
#import "ProjectileNode.h"

@implementation GamePlayScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background_1"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));

        [self addChild:background];

        MachineNode *machine = [MachineNode machineAtPosition:CGPointMake(CGRectGetMidX(self.frame), 12)];
        machine.anchorPoint = CGPointMake(0.5, 0);

        [self addChild:machine];

        SpaceCat *spaceCat = [SpaceCat spaceCatAtPosition:CGPointMake(machine.position.x, machine.position.y-2)];
        [self addChild:spaceCat];
    }
    return self;
}

//You don't wanna clutter up the scene with node initialization and we can do this seperately within each subclass so we can go to our project navigator.

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    SpaceCat *spaceCat = (SpaceCat*)[self childNodeWithName:@"spacecat"];
//    [spaceCat performTap];

    for (UITouch *touch in touches) {
        CGPoint position = [touch locationInNode:self];
        [self shootProjectileTowardsPosition:position];
    }
}

-(void)shootProjectileTowardsPosition:(CGPoint)position
{
    SpaceCat *spaceCat = (SpaceCat*)[self childNodeWithName:@"SpaceCat"];
    [spaceCat performTap];

    MachineNode *machine = (MachineNode*)[self childNodeWithName:@"Machine"];
    //Creating a projectile node which is position at the top of screen
    ProjectileNode *projectile = [ProjectileNode projectileAtPosition:CGPointMake(machine.position.x, machine.position.y+machine.frame.size.height-15)];
    //Add projectile as child to the screen
    [self addChild:projectile];
    //This is the position where the user touches the screen
    [projectile moveTowardsPosition:position];

}

@end
