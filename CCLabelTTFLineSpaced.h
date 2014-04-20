#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface CCLabelTTFLineSpaced : CCLayer {
}

+ (id) labelWithString:(NSString*)string dimensions:(CGSize)dimensions hAlignment:  (CCTextAlignment)alignment fontName:(NSString*)name fontSize:(CGFloat)size lineSpace:(CGFloat)space;

- (id) initWithString:(NSString*)str dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment fontName:(NSString*)name fontSize:(CGFloat)size lineSpace:(CGFloat)space;

-(void)fadeTo:(int)newOp withDuration:(float)dur withDelay:(float)del;
@property (nonatomic) ccColor3B color;
@property (nonatomic) int opacity;

@end

