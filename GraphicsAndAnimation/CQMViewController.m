//
//  CQMViewController.m
//  GraphicsAndAnimation
//
//  Created by mar Jinn on 9/20/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQMViewController.h"

@interface CQMViewController ()

@end

@implementation CQMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [UIView beginAnimations:@"viewAnimation"
                    context:(__bridge void *)[self view] ];
    
    //5 sec animation
    [UIView setAnimationDuration:1.2f];
    
    //animation delgate
    [UIView setAnimationDelegate:(id)self];
    
    //animationDidStopSelector
    [UIView setAnimationDidStopSelector:@selector(viewAnimationDidStop:finished:context:)];
    
    [UIView setAnimationRepeatCount:1.0f];
    
    [UIView setAnimationRepeatAutoreverses:YES];
    
    [UIView setAnimationCurve:(UIViewAnimationCurve)UIViewAnimationCurveEaseInOut];
    
    /* end at bottom right corner */
    CGRect endRect =  CGRectZero;
    endRect.origin.x    =   200.0f;
    endRect.origin.y    =   350.0f;
    endRect.size.width  =   100.0f;
    endRect.size.height =   100.f;
    
    //[[self view] setFrame:endRect];
    
    
    
//    [[self  view] setTransform:CGAffineTransformMakeScale(0.1f, 0.1f)];
//    [[self  view] setTransform:CGAffineTransformMakeRotation( ( (45.0f * M_PI) / 180.0f) )];
//    [[self  view] setTransform:CGAffineTransformMakeRotation( ( (90.0f * M_PI) / 180.0f) )];
//    [[self  view] setTransform:CGAffineTransformMakeRotation( ( (180.0f * M_PI) / 180.0f) )];
//    [[self  view] setTransform:CGAffineTransformMakeRotation( ( (270.0f * M_PI) / 180.0f) )];
//    [[self  view] setTransform:CGAffineTransformMakeRotation( ( (360.0f * M_PI) / 180.0f) )];
//    
    
    
    CGAffineTransform t = CGAffineTransformIdentity;
    t = CGAffineTransformScale(t,0.1f, 0.1f);
    [[self  view] setTransform:t];
    
    [UIView commitAnimations];
    
    t = CGAffineTransformRotate(t, ( (45.0f * M_PI) / 180.0f) );
    [[self  view] setTransform:t];
    
    [UIView commitAnimations];
    
    t =
    CGAffineTransformRotate(t, ( (90.0f * M_PI) / 180.0f) );
    [[self  view] setTransform:t];
    
    [UIView commitAnimations];
    
    t =
    CGAffineTransformRotate(t, ( (180.0f * M_PI) / 180.0f) );
    [[self  view] setTransform:t];
    
     [UIView commitAnimations];
    
    t =
    CGAffineTransformRotate(t, ( (270.0f * M_PI) / 180.0f) );
    [[self  view] setTransform:t];
    
    [UIView commitAnimations];
    
    t =
    CGAffineTransformRotate(t, ( (360.0f * M_PI) / 180.0f) );
    [[self  view] setTransform:t];
    
       
    [UIView commitAnimations];
    
    t =
    CGAffineTransformRotate(t, ( (-45.0f * M_PI) / 180.0f) );
    [[self  view] setTransform:t];
    
    
    [UIView commitAnimations];
    
}

-(void) viewAnimationDidStop:(NSString*)paramAnimationID
                    finished:(NSNumber*)paramFinished
                     context:(void*)paramContext
{
    NSLog(@"Animation finished.");
    
    NSLog(@"Animation ID = %@", paramAnimationID);
    
    UIView *contextImageView = (__bridge UIView *)paramContext;
    
    NSLog(@"Image View = %@", contextImageView);
    
    [contextImageView setTransform:CGAffineTransformIdentity];
    
//    CGRect endRect =  CGRectZero;
//    endRect = [[UIScreen mainScreen] bounds];
//    
//    [contextImageView setFrame:endRect];
    
    
//    [contextImageView setTransform:CGAffineTransformMakeScale(1.0f, 1.0f)];
//    
//    
//    
//    
//    
//    CGAffineTransform t = CGAffineTransformIdentity;
//    
//    t =
//    CGAffineTransformRotate(t, ( (360.0f * M_PI) / 180.0f) );
//    [[self  view] setTransform:t];
//
//    
//    t =
//    CGAffineTransformRotate(t, ( (270.0f * M_PI) / 180.0f) );
//    [[self  view] setTransform:t];
//
//    
//    t =
//    CGAffineTransformRotate(t, ( (180.0f * M_PI) / 180.0f) );
//    [[self  view] setTransform:t];
//
//    
//    t =
//    CGAffineTransformRotate(t, ( (90.0f * M_PI) / 180.0f) );
//    [[self  view] setTransform:t];
//
//    
//    t = CGAffineTransformRotate(t, ( (45.0f * M_PI) / 180.0f) );
//    [[self  view] setTransform:t];
//    
//    t = CGAffineTransformScale(t,0.1f, 0.1f);
//    [[self  view] setTransform:t];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
