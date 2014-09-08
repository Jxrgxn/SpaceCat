//
//  ProjectileNode.h
//  Space Cat
//
//  Created by Basel Farag on 8/27/14.
//  Copyright (c) 2014 NextTierGames. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ProjectileNode : SKSpriteNode

+ (instancetype)projectileAtPosition:(CGPoint)position;
-(void)moveTowardsPosition:(CGPoint)position;

@end
