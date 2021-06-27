#import "Fraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Fraction *myFraction = [Fraction new];
        
        myFraction.numerator = 1;
        myFraction.denominator = 3;
        
        NSLog(@"The value of myFraction is:");
        [myFraction print];
        
        NSLog(@"myfraction.numerator: %d", myFraction.numerator);
        NSLog(@"myfraction.denomunator: %d", myFraction.denominator);
        
        [myFraction setTo:100 over:200];
        [myFraction print];
        
        Fraction *aFraction = [Fraction new];
        Fraction *bFraction = [Fraction new];
        
        [aFraction setTo:1 over:4];
        [bFraction setTo:1 over:2];
        
        [aFraction print];
        NSLog(@"+");
        [bFraction print];
        NSLog(@"=");
        
        [aFraction add:bFraction];
        [aFraction print];
    }
    return 0;
}
