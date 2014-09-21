//
//  CQMGraphicsView.m
//  GraphicsAndAnimation
//
//  Created by mar Jinn on 9/20/14.
//  Copyright (c) 2014 mar Jinn. All rights reserved.
//

#import "CQMGraphicsView.h"

@implementation CQMGraphicsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing at point
    //drawString();
    
    //draw in rect
    //setColor();
    
    //get color components
    //printColorComponents();
    
    //draw
    //drawImage();
    
    //drawline
    //drawLine();
    
    [self drawRooftopAtTopPointOf:CGPointMake(160.0f, 40.0f)
                    textToDisplay:@"Miter"
                         lineJoin:(CGLineJoin)kCGLineJoinMiter];
    
    [self drawRooftopAtTopPointOf:CGPointMake(160.0f, 180.0f)
                    textToDisplay:@"Bevel"
                         lineJoin:(CGLineJoin)kCGLineJoinBevel];
    
    [self drawRooftopAtTopPointOf:CGPointMake(160.0f, 320.0f)
                    textToDisplay:@"Round"
                         lineJoin:(CGLineJoin)kCGLineJoinRound];
}


void drawString (void)
{
    //font
    UIFont* helveticBold    =   nil;
    helveticBold    =
    [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0f];
    
    //string
    NSString* myString  =   nil;
    myString    =   @"I am f**king alive!";
    
    //draw
    //NSAttributedString.h
    
    [myString drawAtPoint:CGPointMake(40.0f, 80.0f) withAttributes:
     [NSDictionary dictionaryWithObject:helveticBold
                                 forKey:NSFontAttributeName]];
}

void setColor (void)
{
    //color
    UIColor* magenta =
    [UIColor colorWithRed:0.5f
                    green:0.5f
                     blue:0.5f
                    alpha:1.0f];
    
    //set the color to the context
    [magenta set];
    
    //load the font
    UIFont* helveticaBold   =   nil;
    helveticaBold   =
    [UIFont boldSystemFontOfSize:30.0f];
    
    //string
    static NSString* const  myString    =
    @"I Learn Really Fast";
    
    //draw
    CGRect rectToDraw = CGRectZero;
    rectToDraw =
    CGRectMake(100.0f, 120.0f, 100.0f, 200.0f);
    
    [myString drawInRect:rectToDraw
          withAttributes:@{
                           NSFontAttributeName: helveticaBold,
                           NSForegroundColorAttributeName: [UIColor magentaColor]
                           }];
}


void printColorComponents (void)
{
    //color
    UIColor* steelBlueColor =   nil;
    steelBlueColor  =
    [UIColor colorWithRed:0.3f
                    green:0.4f
                     blue:0.6f
                    alpha:1.0f];
    
    CGColorRef colorRef =   NULL;
    colorRef    =
    [steelBlueColor CGColor];
    
    const CGFloat* components   = NULL;
    components  =
    CGColorGetComponents(colorRef);
    
    NSUInteger componentsCount  =   0;
    componentsCount =
    CGColorGetNumberOfComponents(colorRef);
    
    NSUInteger counter  =   0;
    for (counter = 0; counter < componentsCount; counter++)
    {
        NSLog(@"Components %lu = %0.02f",
              (unsigned long)counter + 1,
              components[counter]);
    }
    
    return;
}


void drawImage (void)
{
    //image
    UIImage* image  =   nil;
    image   =
    [UIImage imageNamed:@"Xcode_icon.png"];
    
    //draw at point
    [image drawAtPoint:CGPointMake(0.0f, 20.0f)
             blendMode:(CGBlendMode)kCGBlendModeColorDodge
                 alpha:1.0f];
    
    [image drawInRect:
     CGRectMake(50.0f, 10.0f, 40.0f, 35.0f)
            blendMode:(CGBlendMode)kCGBlendModeColorDodge
                alpha:1.0f];
}


void drawLine (void)
{
    //color
    [[UIColor brownColor] set];
    
    //get current graphics context
    CGContextRef currentContext =   NULL;
    currentContext  =
    UIGraphicsGetCurrentContext();
    
    //line width
    CGContextSetLineWidth(currentContext, 5.0f);
    
    //start point
    CGContextMoveToPoint(currentContext, 50.0f, 10.0f);
    
    //add line - end point
    CGContextAddLineToPoint(currentContext, 100.0f, 200.0f);
    
    //extend the line to another point
    CGContextAddLineToPoint(currentContext, 300.0f, 100.0f);
    
    //stroke line
    CGContextStrokePath(currentContext);
    
}

-(void) drawRooftopAtTopPointOf:(CGPoint)paramToPoint
                  textToDisplay:(NSString*)paramText
                       lineJoin:(CGLineJoin)paramLineJoin
{
    //color
    [[UIColor brownColor] set];
    
    //context
    CGContextRef currentContext = NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    //linewidth
    CGContextSetLineWidth(currentContext, 5.0f);
    
    //lineJoinStyle
    CGContextSetLineJoin(currentContext, paramLineJoin);
    
    //start point
    CGContextMoveToPoint
    (currentContext, paramToPoint.x - 140.0f, paramToPoint.y + 100.0f);
    
    //endpoint add line
    CGContextAddLineToPoint(currentContext, paramToPoint.x, paramToPoint.y);
    
    //extend - as the "brush" stops at the nend point
    CGContextAddLineToPoint
    (currentContext, paramToPoint.x + 140.0f, paramToPoint.y + 100.0f);
    
    //stroke
    CGContextStrokePath(currentContext);
    
    //text
    [paramText drawAtPoint:
     CGPointMake(paramToPoint.x - 40.0f, paramToPoint.y + 60.0f)
            withAttributes:@{
                              NSFontAttributeName:
                                  [UIFont boldSystemFontOfSize:30.0f],
                              NSForegroundColorAttributeName:
                                  [UIColor blackColor]
                              }
     ];
    
}


@end
