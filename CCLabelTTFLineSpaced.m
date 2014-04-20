#import "CCLabelTTFLineSpaced.h"


@implementation CCLabelTTFLineSpaced

+ (id) labelWithString:(NSString*)string dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment fontName:(NSString*)name fontSize:(CGFloat)size lineSpace:(CGFloat)space{
    return [[[self alloc] initWithString: string dimensions:dimensions hAlignment:alignment fontName:name fontSize:size lineSpace:(CGFloat)space]autorelease];
}

- (id) initWithString:(NSString*)str dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment fontName:(NSString*)name fontSize:(CGFloat)size lineSpace:(CGFloat)space{
    if( (self=[super init]) ) {
        _anchorPoint = ccp(0.5f, 0.5f);
        [self setContentSize:dimensions];
        self.ignoreAnchorPointForPosition = YES;
        
        int pos = 0;
        int i = 0;
        while (pos<[str length]) {
            int end = 0;
            int lastCut = -1;
            bool finished=NO;
            while (finished==NO) {
                CGSize actualSize = [[str substringWithRange:NSMakeRange(pos, end)] sizeWithFont:[UIFont fontWithName:name size:size]];
                
                if (actualSize.width > dimensions.width || pos+end == [str length]) {
                    if (pos+end == [str length] && actualSize.width <= dimensions.width) lastCut = end;
                    finished=YES;
                }
                else {
                    if ([[str substringWithRange:NSMakeRange(pos+end, 1)] isEqualToString:@" "] || [[str substringWithRange:NSMakeRange(pos+end, 1)] isEqualToString:@"."] || [[str substringWithRange:NSMakeRange(pos+end, 1)] isEqualToString:@","]) {
                        lastCut = end;
                    }
                    end++;
                }
            }
            
            NSString * strLine = [str substringWithRange:NSMakeRange(pos, lastCut)];
            
            /*remove the space if the first */
            if([[strLine substringWithRange:NSMakeRange(0,1)] isEqualToString:@" "]){
               strLine = [strLine substringWithRange:NSMakeRange(1, [strLine length]-1)];
            }
            
            CCLabelTTF * line = [CCLabelTTF labelWithString:strLine dimensions:CGSizeMake(dimensions.width, size*2) hAlignment:alignment fontName:name fontSize:size];
            [line setAnchorPoint:ccp(0,1)];
            [line setPosition:ccp(0,-i*space)];
            [self addChild:line];
            
            pos=pos+lastCut;
            i++;
        }
        
    }
    return self;
}


-(void)setColor:(ccColor3B)color
{
    for (int i = 0; i < [[self children] count]; i ++){
        CCLabelTTF* child = (CCLabelTTF*)[[self children] objectAtIndex:i];
        child.color =  color;
    }
}

-(void)setOpacity:(int)opacity
{
    for (int i = 0; i < [[self children] count]; i ++){
        CCLabelTTF* child = (CCLabelTTF*)[[self children] objectAtIndex:i];
        child.opacity =  opacity;
    }
}

-(void)fadeTo:(int)newOp withDuration:(float)dur withDelay:(float)del{
    CCDelayTime * dela = [CCDelayTime actionWithDuration:del];
    for (int i = 0; i < [[self children] count]; i ++){
        CCLabelTTF* child = (CCLabelTTF*)[[self children] objectAtIndex:i];
        [child runAction:[CCSequence actions:dela,[CCFadeTo actionWithDuration:dur opacity:newOp],nil]];
    }
}



@end