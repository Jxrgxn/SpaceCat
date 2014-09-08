//
//  MachineNode.m
//  Space Cat
//
//  Created by Basel Farag on 8/26/14.
//  Copyright (c) 2014 NextTierGames. All rights reserved.
//

#import "MachineNode.h"

@implementation MachineNode

+ (instancetype)machineAtPosition:(CGPoint)position
{
    MachineNode *machine = [self spriteNodeWithImageNamed:@"machine_1"];
    machine.position = position;
    machine.anchorPoint = CGPointMake(0.5, 0);
    machine.name = @"Machine";

    NSArray *textures = @[[SKTexture textureWithImageNamed:@"machine_1"],[SKTexture textureWithImageNamed:@"machine_2"]]; //We have an array of texture and now we can define how we want to animate them. We use SKAction.
    SKAction *machineAnimation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    //Now we need an action to tell how long this will be repeated.
    SKAction *machineRepeat = [SKAction repeatActionForever:machineAnimation];
    //Now we need to run the action
    [machine runAction:machineRepeat];

    return machine;
}

@end
