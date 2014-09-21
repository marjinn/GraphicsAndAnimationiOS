//
//  main.m
//  GraphicsAndAnimation
//
//  Created by mar Jinn on 9/20/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CQMAppDelegate.h"


void enumerateFonts (void)
{
    for (NSString* familyName in [UIFont familyNames])
    {
        NSLog(@"Font family = %@", familyName);
        
        NSArray* fontNames = nil;
        fontNames = [UIFont fontNamesForFamilyName:familyName];
        
        for (NSString* fontName in fontNames)
        {
            NSLog(@"Font name = %@", fontName);
        }
        
        fontNames   = nil;
    }
    return;
}

int main(int argc, char * argv[])
{
    
    enumerateFonts();
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([CQMAppDelegate class]));
    }
}
