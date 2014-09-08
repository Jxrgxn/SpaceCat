//
//  SpaceCat.m
//  Space Cat
//
//  Created by Basel Farag on 8/26/14.
//  Copyright (c) 2014 NextTierGames. All rights reserved.
//

#import "SpaceCat.h"

//empty parenthesis indicate an empty category on our class where we can define private properties. that property will be accessible outside of your class.
@interface SpaceCat ()
@property (nonatomic) SKAction *tapAction;

@end

@implementation SpaceCat

+ (instancetype)spaceCatAtPosition:(CGPoint)position
{
    SpaceCat *spaceCat = [self spriteNodeWithImageNamed:@"spacecat_1"];
    spaceCat.position = position;
    spaceCat.anchorPoint = CGPointMake(0.5, 0);
    spaceCat.name = @"spacecat";

    return spaceCat;
}

-(void)performTap
{
    [self runAction:self.tapAction];
}

-(SKAction *)tapAction {
    if (_tapAction != nil)
    {
        return _tapAction;
    }
    //Let's inititalize a textures array
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"spacecat_2"],
                          [SKTexture textureWithImageNamed:@"spacecat_1"]];

    _tapAction = [SKAction animateWithTextures:textures timePerFrame:0.25];

    return _tapAction;

}
@end
