#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Fraction : NSObject

@property int numerator;
@property int denominator;

- (void)print;
- (double)convertToNum;
- (void)setTo:(int)n over:(int)d;
- (void)set:(int)n :(int)d;
- (void)add:(Fraction *)f;

@end

NS_ASSUME_NONNULL_END
