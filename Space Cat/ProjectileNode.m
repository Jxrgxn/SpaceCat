//
//  ProjectileNode.m
//  Space Cat
//
//  Created by Basel Farag on 8/27/14.
//  Copyright (c) 2014 NextTierGames. All rights reserved.
//

#import "ProjectileNode.h"
#import "Util.h"

@implementation ProjectileNode
+ (instancetype)projectileAtPosition:(CGPoint)position
{
    ProjectileNode *projectile = [self spriteNodeWithImageNamed:@"projectile_1"];
    projectile.position = position;
    projectile.name = @"projectile";

    [projectile setUpAnimation];

    return projectile;
}

-(void)setUpAnimation {
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"projectile_1"],[SKTexture textureWithImageNamed:@"projectile_2"], [SKTexture textureWithImageNamed:@"projectile_3"]];
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.10];

    SKAction *repeatAction = [SKAction repeatActionForever:animation];
    [self runAction:repeatAction];
}

-(void)moveTowardsPosition:(CGPoint)position
{
    //slope = y3 - y1 / x3 - x1  //self.position is the position of our projectile
    float slope = (position.y - self.position.y)/(position.x - self.position.x);
    //slope = y2 - y1 / slope (x2 - x1)
    // y2 = slope * x2 - slope * x1 + y1

    float offscreenX;

    if (offscreenX <= self.position.x){
        offscreenX = -10;
    }else{
        offscreenX = self.parent.frame.size.width + 10;
    }

    float offscreenY = slope * offscreenX - slope * self.position.x + self.position.y;
    CGPoint pointOffScreen = CGPointMake(offscreenX, offscreenY);

    float distanceA = pointOffScreen.y - self.position.y;
    float distanceB = pointOffScreen.x - self.position.x;

    float distanceC = sqrt(powf(distanceA, 2) + powf(distanceB, 2));

    float time = distanceC / ProjectileSpeed ;
    SKAction *moveProjectile = [SKAction moveTo:pointOffScreen duration:time];
    [self runAction:moveProjectile];

}

@end
