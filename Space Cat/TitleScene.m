//
//  TitleScene.m
//  Space Cat
//
//  Created by Basel Farag on 8/23/14.
//  Copyright (c) 2014 NextTierGames. All rights reserved.
//
//SKAction -We can build any animation. Fade changes the opacity of an image. Move changes things in x andy y. Rotate changes angle. SKAction has a bunch of things you can use.

#import "TitleScene.h"
#import "GamePlayScene.h"


@implementation TitleScene


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"splash_1"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));

        [self addChild:background];

    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    GamePlayScene *gamePlayScene = [GamePlayScene sceneWithSize:self.frame.size];
    SKTransition *transition = [SKTransition fadeWithDuration:1.0];
    [self.view presentScene:gamePlayScene transition:transition];
}

//-(void)update:(NSTimeInterval)currentTime
//{
//    NSLog(@"%f", fmod(currentTime, 60));
//}

@end
