#import "Fraction.h"

@implementation Fraction

@synthesize numerator;
@synthesize denominator;

- (void)print {
    NSLog(@"%d/%d", numerator, denominator);
}

- (double)convertToNum {
    if (denominator != 0)
        return (double)numerator / denominator;
    else
        return NAN;
}

- (void)setTo:(int)n over:(int)d {
    numerator = n;
    denominator = d;
}

- (void)set:(int)n :(int)d {
    numerator = n;
    denominator = d;
}

- (void)add:(Fraction *)f {
    numerator = numerator * f.denominator + denominator * f.numerator;
    denominator = denominator * f.denominator;
}

@end
