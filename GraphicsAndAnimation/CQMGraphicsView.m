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
    
//    [self drawRooftopAtTopPointOf:CGPointMake(160.0f, 40.0f)
//                    textToDisplay:@"Miter"
//                         lineJoin:(CGLineJoin)kCGLineJoinMiter];
//    
//    [self drawRooftopAtTopPointOf:CGPointMake(160.0f, 180.0f)
//                    textToDisplay:@"Bevel"
//                         lineJoin:(CGLineJoin)kCGLineJoinBevel];
//    
//    [self drawRooftopAtTopPointOf:CGPointMake(160.0f, 320.0f)
//                    textToDisplay:@"Round"
//                         lineJoin:(CGLineJoin)kCGLineJoinRound];
    
    
    
    //pathExample();
    
    //drawRectangle();
    
    //addManyRecatngles();
    
//    addShadowsAtTop();
//    addShadowsAtBottom();
    
    //addShadowsAtTopWithContextPushPop();
    //addShadowsAtBottom();
    
    //drawGradientEx1();
    
    drawGradientEx2();
    
    //dispacingShapes();
    
    //dispacingShapesUingCTM();
    
    //scalingShapes();
    
    //rotatingShapes();
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
    
    //extend - as the "brush" stops at the end point
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

CGRect getBoundsWithOrientation (bool needsRrientationSupport)
{
    //get the screen bounds
    CGRect screenBounds =   CGRectZero;
    
    if (needsRrientationSupport)
    {
        //If you need orientation Support
        if ([[[[[UIApplication sharedApplication] windows] firstObject] rootViewController] isKindOfClass:[UINavigationController class]])
        {
            screenBounds    =
            [[[(UINavigationController*)[[[[UIApplication sharedApplication] windows] firstObject] rootViewController] topViewController] view ]bounds];
            
        }
        else
        {
            screenBounds    =
            [[(UINavigationController*)[[[[UIApplication sharedApplication] windows] firstObject] rootViewController] view ]bounds];
        }

    }
    else
    {
        
        screenBounds    =   [[UIScreen mainScreen] bounds];
    }
    

    return screenBounds;
}

void pathExample (void)
{
    /*
     *  TASK : - Draw an 'X' across the screen
     */
    
    /*
     
     (minX,minY)-------(midX,minY)--------(maxX,minY)
     |                                              |
     |                                              |
     |                                              |
     |(minX,midY)      (midX,midY)       (maxX,midY)|
     |                                              |
     |                                              |
     |                                              |
     (minX,maxY)-------(midX,maxY)--------(maxX,maxY)
     */
    
    
    //create the path
    CGMutablePathRef mutablePath    =   NULL;
    mutablePath =   CGPathCreateMutable();
    
    //get the screen bounds
    CGRect screenBounds =   CGRectZero;
    //screenBounds    =   [[UIScreen mainScreen] bounds];
    screenBounds    =   getBoundsWithOrientation(true);
    //topLeft
    CGPoint topLeft =    CGPointZero;
    topLeft.x   =   CGRectGetMinX(screenBounds);
    topLeft.y   =   CGRectGetMinY(screenBounds);
    
    //bottomRight
    CGPoint bottomRight =    CGPointZero;
    bottomRight.x   =   CGRectGetWidth(screenBounds);
    bottomRight.y   =   CGRectGetHeight(screenBounds);
    
    //start from topleft
    CGPathMoveToPoint
    (mutablePath, NULL, topLeft.x, topLeft.y);
    
    //draw a line from top left to bottom right
    CGPathAddLineToPoint
    (mutablePath, NULL, bottomRight.x, bottomRight.y);
    
    //topright
    CGPoint topRight =    CGPointZero;
    topRight.x   =   CGRectGetMaxX(screenBounds);
    topRight.y   =   CGRectGetMinY(screenBounds);
    
    //start another line from top-right
    CGPathMoveToPoint
    (mutablePath, NULL, topRight.x, topRight.y);
    
    //bottomLeft
    CGPoint bottomLeft =    CGPointZero;
    bottomLeft.x   =   CGRectGetMinX(screenBounds);
    bottomLeft.y   =   CGRectGetMaxY(screenBounds);
    
    //draw a line from top-right to bottom-left
    CGPathAddLineToPoint
    (mutablePath, NULL, bottomLeft.x, bottomLeft.y);
    
    //get the context that the path has to be drawn on
    CGContextRef currentContext =   NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    //add the path to the context ,so that we can draw it later
    CGContextAddPath(currentContext, mutablePath);
    
    //stroke color
    [[UIColor blueColor] setStroke];
    
    //draw the path with the stroke color
    CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathStroke);
    
    //release path
    CGPathRelease((CGPathRef)mutablePath);
}

void drawRectangle (void)
{
    //create path
    CGMutablePathRef path   =   NULL;
    path    =   CGPathCreateMutable();
    
    //rectangleToDraw
    CGRect rectangleToDraw  =   CGRectZero;
    rectangleToDraw.origin.x    =   10.0f;
    rectangleToDraw.origin.y    =   10.0f;
    rectangleToDraw.size.width  =   200.0f;
    rectangleToDraw.size.height =   300.0f;
    
    //add the rect to path
    CGPathAddRect(path, NULL, rectangleToDraw);
    
    //get the handle to the currentContext
    CGContextRef currentContext =   NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    //Add path to context
    CGContextAddPath(currentContext, path);
    
    //setfillcolor - cornFlowerBlue
    [[UIColor colorWithRed:0.20f
                    green:0.60f
                     blue:0.80f
                     alpha:1.0f] setFill];
    
    //strokeColor - brown
    [[UIColor brownColor] setStroke];
    
    //lineWidth
    CGContextSetLineWidth(currentContext, 5.0f);
    
    //strokeAndFill
    /*
     * enum CGPathDrawingMode {
     kCGPathFill,
     kCGPathEOFill,
     kCGPathStroke,
     kCGPathFillStroke,
     kCGPathEOFillStroke
     };
     */
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathFill);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathEOFill);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathStroke);
    CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathFillStroke);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathEOFillStroke);
    
    //release path
    CGPathRelease((CGPathRef)path);
    
    return;
}

void addManyRecatngles (void)
{
    //path
    CGMutablePathRef path   =   NULL;
    path    =   CGPathCreateMutable();
    
   
    /* Here are our first rectangle boundaries */
    CGRect rectangle1 = CGRectMake(10.0f,10.0f, 200.0f, 300.0f);
    
    /* And the second rectangle */
    CGRect rectangle2 = CGRectMake(40.0f,
                                   100.0f, 90.0f, 300.0f);
    
    CGRect rectArray[2] = {rectangle1,rectangle2};
    
    //add rectanglesTOpath
    CGPathAddRects(path, NULL, (const CGRect *)&rectArray, 2);
    
    //context
    CGContextRef currentContext =   NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    //add path to context
    CGContextAddPath(currentContext, path);
    
    
    /* Set the fill color to cornflower blue */
    [[UIColor colorWithRed:0.20f
      
                     green:0.60f blue:0.80f
      
                     alpha:1.0f] setFill];
    
    /* Set the stroke color to black */
    [[UIColor blackColor] setStroke];
    
    /* Set the line width (for the stroke) to 5 */
    CGContextSetLineWidth(currentContext,5.0f);
    
    //draw
    CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathFillStroke);
    
    //release path
    CGPathRelease((CGPathRef)path);
    
    
}


void addShadowsAtTop (void)
{
   
    /*
     * Procedure - draw rect with paths
     * ---------
     * 1. get Mutable Path
     * 2. get the rectangle to draw
     * 3. add the rect to the Path
     * 4. get current Context
     * 5. add Path to the current Context
     * 6. set fill / stroke color
     * 7. contextDraw Path
     * 8. path release
     */
    
    /*
     * Procedure - draw line  with context
     * ---------
     * 1. get current Context
     * 2. set line Width and line join style
     * 3. Move to point - beginning point of the line
     * 4. add line to point - end point
     * 5. set fill / stroke color
     * 6. context Stroke Path
     * 7. path release
     */


     //draw rect with shadow
    
    //get path
    CGMutablePathRef mutablePath    =    NULL;
    mutablePath =    CGPathCreateMutable();
    
    //get rect
    CGRect  rectToDraw  =   CGRectZero;
    rectToDraw.origin.x =   55.0f;
    rectToDraw.origin.y =   60.0f;
    rectToDraw.size.width   =   150.0f;
    rectToDraw.size.height  =   150.0f;
    
    //add rect to path
    CGPathAddRect(mutablePath, NULL, rectToDraw);
    
    //get current Context
    CGContextRef currentContext =   NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    //add path to current contex
    CGContextAddPath(currentContext, mutablePath);
    
    //fillColor
    [[UIColor colorWithRed:0.20f
                     green:0.60f blue:0.80f
                     alpha:1.0f] setFill];
    
    //shadow
    CGSize shadowOffset =   CGSizeZero;
    shadowOffset.width  =   10.0f;
    shadowOffset.height =   10.0f;
   
    static  CGFloat const shadowBlur  =   10.0f;
    
    CGColorRef shadowColor  =   NULL;
    shadowColor =   [[UIColor grayColor] CGColor];
    
    CGContextSetShadowWithColor
    (currentContext, shadowOffset, shadowBlur, shadowColor);
    
    //context draw  path
    CGContextDrawPath(currentContext, (CGPathDrawingMode)kCGPathFill);
    
    //release
    CGPathRelease(mutablePath);
    
}

void addShadowsAtBottom (void)
{
    
    /*
     * Procedure - draw rect with paths
     * ---------
     * 1. get Mutable Path
     * 2. get the rectangle to draw
     * 3. add the rect to the Path
     * 4. get current Context
     * 5. add Path to the current Context
     * 6. set fill / stroke color
     * 7. contextDraw Path
     * 8. path release
     */
    
    /*
     * Procedure - draw line  with context
     * ---------
     * 1. get current Context
     * 2. set line Width and line join style
     * 3. Move to point - beginning point of the line
     * 4. add line to point - end point
     * 5. set fill / stroke color
     * 6. context Stroke Path
     * 7. path release
     */
    
    
    //draw rect with shadow
    
    //get path
    CGMutablePathRef mutablePath    =    NULL;
    mutablePath =    CGPathCreateMutable();
    
    //get rect
    CGRect  rectToDraw  =   CGRectZero;
    rectToDraw.origin.x =   150.0f;
    rectToDraw.origin.y =   250.0f;
    rectToDraw.size.width   =   100.0f;
    rectToDraw.size.height  =   100.0f;
    
    //add rect to path
    CGPathAddRect(mutablePath, NULL, rectToDraw);
    
    //get current Context
    CGContextRef currentContext =   NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    //add path to current contex
    CGContextAddPath(currentContext, mutablePath);
    
    //fillColor
    [[UIColor purpleColor] setFill];
    
    //Context reatains shadow from previous
    
//    //shadow
//    CGSize shadowOffset =   CGSizeZero;
//    shadowOffset.width  =   10.0f;
//    shadowOffset.height =   10.0f;
//    
//    static  CGFloat const shadowBlur  =   10.0f;
//    
//    CGColorRef shadowColor  =   NULL;
//    shadowColor =   [[UIColor grayColor] CGColor];
//    
//    CGContextSetShadowWithColor
//    (currentContext, shadowOffset, shadowBlur, shadowColor);
    
    //context draw  path
    CGContextDrawPath(currentContext, (CGPathDrawingMode)kCGPathFill);
    
    //release
    CGPathRelease(mutablePath);
    
}

void addShadowsAtTopWithContextPushPop (void)
{
    
    /*
     * Procedure - draw rect with paths
     * ---------
     * 1. get Mutable Path
     * 2. get the rectangle to draw
     * 3. add the rect to the Path
     * 4. get current Context
     * 5. save the existing State - before modification
     * 6. add Path to the current Context
     * 7. set fill / stroke color
     * 8. contextDraw Path
     * 9. path release
     * 10. restore context to what it was before
     */
    
    /*
     * Procedure - draw line  with context
     * ---------
     * 1. get current Context
     * 2. set line Width and line join style
     * 3. Move to point - beginning point of the line
     * 4. add line to point - end point
     * 5. set fill / stroke color
     * 6. context Stroke Path
     * 7. path release
     */
    
    
    //draw rect with shadow
    
    //get path
    CGMutablePathRef mutablePath    =    NULL;
    mutablePath =    CGPathCreateMutable();
    
    //get rect
    CGRect  rectToDraw  =   CGRectZero;
    rectToDraw.origin.x =   55.0f;
    rectToDraw.origin.y =   60.0f;
    rectToDraw.size.width   =   150.0f;
    rectToDraw.size.height  =   150.0f;
    
    //add rect to path
    CGPathAddRect(mutablePath, NULL, rectToDraw);
    
    //get current Context
    CGContextRef currentContext =   NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    //save the existing State - before modification
    CGContextSaveGState(currentContext);
    
    //add path to current contex
    CGContextAddPath(currentContext, mutablePath);
    
    //fillColor
    [[UIColor colorWithRed:0.20f
                     green:0.60f blue:0.80f
                     alpha:1.0f] setFill];
    
    //shadow
    CGSize shadowOffset =   CGSizeZero;
    shadowOffset.width  =   10.0f;
    shadowOffset.height =   10.0f;
    
    static  CGFloat const shadowBlur  =   10.0f;
    
    CGColorRef shadowColor  =   NULL;
    shadowColor =   [[UIColor grayColor] CGColor];
    
    CGContextSetShadowWithColor
    (currentContext, shadowOffset, shadowBlur, shadowColor);
    
    //context draw  path
    CGContextDrawPath(currentContext, (CGPathDrawingMode)kCGPathFill);
    
    //release
    CGPathRelease(mutablePath);
    
    //restore context to what it was before
    CGContextRestoreGState(currentContext);
    
}


void drawGradientEx1 (void)
{
    //get colorspace
    CGColorSpaceRef colorSpace  =   NULL;
    colorSpace  =   CGColorSpaceCreateDeviceRGB();
    
    //startColor
    UIColor* startColor =   nil;
    startColor  =   [UIColor blueColor];
    
    //startColorComponents
    CGFloat* startColorComponents   =   NULL;
    startColorComponents    =
    (CGFloat*)CGColorGetComponents([startColor CGColor]);
    
    //endColor
    UIColor* endColor   =   nil;
    endColor    =   [UIColor greenColor];
    
    //endColorComponents
    CGFloat* endColorComponents   =   NULL;
    endColorComponents    =
    (CGFloat*)CGColorGetComponents([endColor CGColor]);
    
    CGFloat colorComponents[8];
    
    //four components of the blue color RGBA
    //first color = blue
    colorComponents[0]  =   startColorComponents[0];
    colorComponents[1]  =   startColorComponents[1];
    colorComponents[2]  =   startColorComponents[2];
    colorComponents[3]  =   startColorComponents[3];
    
    //four components of the green color (RGBA)
    colorComponents[4]  =   endColorComponents[0];
    colorComponents[5]  =   endColorComponents[1];
    colorComponents[6]  =   endColorComponents[2];
    colorComponents[7]  =   endColorComponents[3];

    //color indices
    //2 colors 2 indices
    //Because we have only two colors in this array,
    //we need to specify that the first is positioned
    //at the very beginning of the gradient (position 0.0)
    //and the second at the very end (position 1.0). So let’s place these
    //indices in an array to pass to the
    //CGGradientCreateWithColorComponents function:
    
    CGFloat colorIndices[2];
    colorIndices[0] =   0.0f; /* Color 0 in the colorComponnets array */
    colorIndices[1] =   1.0f; /* Color 1 in the colorComponnets array */
    
    //create gradient
    CGGradientRef gradient  =   NULL;
    gradient    =
    CGGradientCreateWithColorComponents
    (colorSpace,
     (const CGFloat *)&colorComponents,
     (const CGFloat *)&colorIndices,
     sizeof(colorIndices) / sizeof(colorIndices[0])
     );
    
    //release
    CGColorSpaceRelease(colorSpace);
    
    //Drawing Axial Gradient
    //get screen bounds
    CGRect screenBounds     =   CGRectZero;
    screenBounds    =   getBoundsWithOrientation(true);
    
    CGPoint startPoint  =   CGPointZero;
    startPoint.x    =   CGRectGetMinX(screenBounds); //0.0f
    startPoint.y    =   //CGRectGetMaxY(screenBounds) / 2.0f;
    CGRectGetMidY(screenBounds);
    
    
    CGPoint endPoint    =   CGPointZero;
    endPoint.x  =   CGRectGetMaxX(screenBounds);
    endPoint.y  =   startPoint.y;
    
    CGContextDrawLinearGradient
    (UIGraphicsGetCurrentContext(),
     gradient,
     startPoint,
     endPoint,
     0);
    
    //release
    CGGradientRelease(gradient);
}


void drawGradientEx2 (void)
{
  /*
   * - Gradient Drawing Procedure
   * 1. get the context
   2. save the context
   3. get the colorspace rgb
   4. get start color
   5. split it into components using CGColorGetComponents
   6. get end color
   7. split it into components using CGColorGetComponents
   8. create color components array of size (4* number of colors)
   9. fill th colorComponnets array with the color componnets from 
        step 5 and step 7
   10. Assuming we use 2 colors
        startColor will produce  a color components array of size 4
        endColor will produce  a color components array of size 4
        So colorComponnets array will be of size 8
        indexes 0-3 will hold color components of start color
        indexes 4-7 will hold color components of end color
   11. Prepare the color indices array or locations
        locations
        The location for each color provided in components. 
        Each location must be a CGFloat value in the range of 0 to 1, 
        inclusive. If 0 and 1 are not in the locations array, Quartz uses the 
        colors provided that are closest to 0 and 1 for those locations.
        If locations is NULL, the first color in colors is assigned to location 
        0, the last color incolors is assigned to location 1, and intervening
        colors are assigned locations that are at equal intervals in between.
   12. Create the gradient
   13. Release the colorspace
   14. get startPoint and ennPoint
   15. draw the gradient
   16. pop the context
    */
    
    //currentContext
    CGContextRef currentContext =   NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    //save Context
    CGContextSaveGState(currentContext);
    
    //get colorspace
    CGColorSpaceRef colorSpace  =   NULL;
    colorSpace  =   CGColorSpaceCreateDeviceRGB();
    
    //startColor
    UIColor* startColor =   nil;
    startColor  =   [UIColor orangeColor];
    
    //startColorComponents
    CGFloat* startColorComponents   =   NULL;
    startColorComponents    =
    (CGFloat*)CGColorGetComponents([startColor CGColor]);
    
    //endColor
    UIColor* endColor   =   nil;
    endColor    =   [UIColor blueColor];
    
    //endColorComponents
    CGFloat* endColorComponents   =   NULL;
    endColorComponents    =
    (CGFloat*)CGColorGetComponents([endColor CGColor]);
    
    CGFloat colorComponents[8];
    
    //four components of the blue color RGBA
    //first color = orange
    colorComponents[0]  =   startColorComponents[0];
    colorComponents[1]  =   startColorComponents[1];
    colorComponents[2]  =   startColorComponents[2];
    colorComponents[3]  =   startColorComponents[3];
    
    //four components of the green color (RGBA)
    //blue
    colorComponents[4]  =   endColorComponents[0];
    colorComponents[5]  =   endColorComponents[1];
    colorComponents[6]  =   endColorComponents[2];
    colorComponents[7]  =   endColorComponents[3];
    
    //color indices
    //2 colors 2 indices
    //Because we have only two colors in this array,
    //we need to specify that the first is positioned
    //at the very beginning of the gradient (position 0.0)
    //and the second at the very end (position 1.0). So let’s place these
    //indices in an array to pass to the
    //CGGradientCreateWithColorComponents function:
    
    CGFloat colorIndices[2];
    colorIndices[0] =   0.0f; /* Color 0 in the colorComponnets array */
    colorIndices[1] =   1.0f; /* Color 1 in the colorComponnets array */
    
    //create gradient
    CGGradientRef gradient  =   NULL;
    gradient    =
    CGGradientCreateWithColorComponents
    (colorSpace,
     (const CGFloat *)&colorComponents,
     (const CGFloat *)&colorIndices,
     (sizeof(colorIndices) / sizeof(colorIndices[0]))
     );
    
    //release
    CGColorSpaceRelease(colorSpace);
    
    //Drawing Axial Gradient

    CGPoint startPoint  =   CGPointZero;
    startPoint.x    =   120.0f;
    startPoint.y    =   260.0f;
    
    CGPoint endPoint    =   CGPointZero;
    endPoint.x  =   200.0f;
    endPoint.y  =   220.0f;
    
    CGContextDrawLinearGradient
    (currentContext,
     gradient,
     startPoint,
     endPoint,
     kCGGradientDrawsBeforeStartLocation |
     kCGGradientDrawsAfterEndLocation);
    //to draw before an after the start and end location
    
    //release
    CGGradientRelease(gradient);
    
    //restoreContext
    CGContextRestoreGState(currentContext);
    
    
}


void dispacingShapes (void)
{
    //create path
    CGMutablePathRef path   =   NULL;
    path    =   CGPathCreateMutable();
    
    //rectangleToDraw
    CGRect rectangleToDraw  =   CGRectZero;
    rectangleToDraw.origin.x    =   10.0f;
    rectangleToDraw.origin.y    =   10.0f;
    rectangleToDraw.size.width  =   200.0f;
    rectangleToDraw.size.height =   300.0f;
    
    /*
     * Displace the rectangle to the right by 100 points 
     * keep y position unchanged
     */
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform   =   CGAffineTransformMakeTranslation(100.0f, 0.0f);
    
    //add the rect to path
    CGPathAddRect(path, (CGAffineTransform *)&transform, rectangleToDraw);
    
    //get the handle to the currentContext
    CGContextRef currentContext =   NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    //Add path to context
    CGContextAddPath(currentContext, path);
    
    //setfillcolor - cornFlowerBlue
    [[UIColor colorWithRed:0.20f
                     green:0.60f
                      blue:0.80f
                     alpha:1.0f] setFill];
    
    //strokeColor - brown
    [[UIColor brownColor] setStroke];
    
    //lineWidth
    CGContextSetLineWidth(currentContext, 5.0f);
    
    //strokeAndFill
    /*
     * enum CGPathDrawingMode {
     kCGPathFill,
     kCGPathEOFill,
     kCGPathStroke,
     kCGPathFillStroke,
     kCGPathEOFillStroke
     };
     */
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathFill);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathEOFill);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathStroke);
    CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathFillStroke);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathEOFillStroke);
    
    //release path
    CGPathRelease((CGPathRef)path);

}

void dispacingShapesUingCTM (void)
{
    
    //create path
    CGMutablePathRef path   =   NULL;
    path    =   CGPathCreateMutable();
    
    //rectangleToDraw
    CGRect rectangleToDraw  =   CGRectZero;
    rectangleToDraw.origin.x    =   10.0f;
    rectangleToDraw.origin.y    =   10.0f;
    rectangleToDraw.size.width  =   200.0f;
    rectangleToDraw.size.height =   300.0f;
    
    //add the rect to path
    CGPathAddRect(path, NULL, rectangleToDraw);
    
    //get the handle to the currentContext
    CGContextRef currentContext =   NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    /* Save the state of the context to revert back to how it was at this state, later */
    CGContextSaveGState(currentContext);
    
    //translate the CTM
    //CTM - Current transformation Matrix
    // Matrix that the context uses
    CGContextTranslateCTM(currentContext, 100.0f, 0.0f);
    
    //Add path to context
    CGContextAddPath(currentContext, path);
    
    //setfillcolor - cornFlowerBlue
    [[UIColor colorWithRed:0.20f
                     green:0.60f
                      blue:0.80f
                     alpha:1.0f] setFill];
    
    //strokeColor - brown
    [[UIColor brownColor] setStroke];
    
    //lineWidth
    CGContextSetLineWidth(currentContext, 5.0f);
    
    //strokeAndFill
    /*
     * enum CGPathDrawingMode {
     kCGPathFill,
     kCGPathEOFill,
     kCGPathStroke,
     kCGPathFillStroke,
     kCGPathEOFillStroke
     };
     */
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathFill);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathEOFill);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathStroke);
    CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathFillStroke);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathEOFillStroke);
    
    //release path
    CGPathRelease((CGPathRef)path);
    
    /* Restore the state of the context */
    CGContextRestoreGState(currentContext);
    
}

void scalingShapes (void)
{
    //create path
    CGMutablePathRef path   =   NULL;
    path    =   CGPathCreateMutable();
    
    //rectangleToDraw
    CGRect rectangleToDraw  =   CGRectZero;
    rectangleToDraw.origin.x    =   10.0f;
    rectangleToDraw.origin.y    =   10.0f;
    rectangleToDraw.size.width  =   200.0f;
    rectangleToDraw.size.height =   300.0f;
    
    /*
     * Scale the rectangle to half its size
     */
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform   =   CGAffineTransformMakeScale(0.5f, 0.5f);
    
    //add the rect to path
    CGPathAddRect(path, (CGAffineTransform *)&transform, rectangleToDraw);
    
    //get the handle to the currentContext
    CGContextRef currentContext =   NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    /* Save the state of the context to revert back to how it was at this state, later */
    CGContextSaveGState(currentContext);
    
    //Add path to context
    CGContextAddPath(currentContext, path);
    
    //setfillcolor - cornFlowerBlue
    [[UIColor colorWithRed:0.20f
                     green:0.60f
                      blue:0.80f
                     alpha:1.0f] setFill];
    
    //strokeColor - brown
    [[UIColor brownColor] setStroke];
    
    //lineWidth
    CGContextSetLineWidth(currentContext, 5.0f);
    
    //strokeAndFill
    /*
     * enum CGPathDrawingMode {
     kCGPathFill,
     kCGPathEOFill,
     kCGPathStroke,
     kCGPathFillStroke,
     kCGPathEOFillStroke
     };
     */
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathFill);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathEOFill);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathStroke);
    CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathFillStroke);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathEOFillStroke);
    
    //release path
    CGPathRelease((CGPathRef)path);
    
    /* Restore the state of the context */
    CGContextRestoreGState(currentContext);
    
}

void rotatingShapes (void)
{
    //create path
    CGMutablePathRef path   =   NULL;
    path    =   CGPathCreateMutable();
    
    //rectangleToDraw
    CGRect rectangleToDraw  =   CGRectZero;
    rectangleToDraw.origin.x    =   10.0f;
    rectangleToDraw.origin.y    =   10.0f;
    rectangleToDraw.size.width  =   200.0f;
    rectangleToDraw.size.height =   300.0f;
    
    /*
     * rotate the rectangle 45 degree clock wise M_PI_4
     * takes value sin radians ..hence we have to multiply by pi/180
     */
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform   =   CGAffineTransformMakeRotation( ( (45.0f * M_PI) / 180.0f) );
    
    //add the rect to path
    CGPathAddRect(path, (CGAffineTransform *)&transform, rectangleToDraw);
    
    //get the handle to the currentContext
    CGContextRef currentContext =   NULL;
    currentContext  =   UIGraphicsGetCurrentContext();
    
    /* Save the state of the context to revert back to how it was at this state, later */
    CGContextSaveGState(currentContext);
    
    //Add path to context
    CGContextAddPath(currentContext, path);
    
    //setfillcolor - cornFlowerBlue
    [[UIColor colorWithRed:0.20f
                     green:0.60f
                      blue:0.80f
                     alpha:1.0f] setFill];
    
    //strokeColor - brown
    [[UIColor brownColor] setStroke];
    
    //lineWidth
    CGContextSetLineWidth(currentContext, 5.0f);
    
    //strokeAndFill
    /*
     * enum CGPathDrawingMode {
     kCGPathFill,
     kCGPathEOFill,
     kCGPathStroke,
     kCGPathFillStroke,
     kCGPathEOFillStroke
     };
     */
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathFill);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathEOFill);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathStroke);
    CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathFillStroke);
    //CGContextDrawPath(currentContext, (CGPathDrawingMode) kCGPathEOFillStroke);
    
    //release path
    CGPathRelease((CGPathRef)path);
    
    /* Restore the state of the context */
    CGContextRestoreGState(currentContext);
    
}


@end
