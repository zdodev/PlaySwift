#import <Foundation/Foundation.h>

@interface Calculator : NSObject

// 누산기 메서드
- (void)setAccumulator:(double)value;
- (void)clear;
- (double)accumulator;

// 산술 연산 메서드
-(void)add:(double)value;
-(void)subtract:(double)value;
-(void)multiply:(double)value;
-(void)divide:(double)value;

@end

@implementation Calculator {
    double accumulator;
}

- (void)setAccumulator:(double)value {
    accumulator = value;
}

- (void)clear {
    accumulator = 0;
}

- (double)accumulator {
    return accumulator;
}

- (void)add:(double)value {
    accumulator += value;
}

- (void)subtract:(double)value {
    accumulator -= value;
}

- (void)multiply:(double)value {
    accumulator *= value;
}

- (void)divide:(double)value {
    accumulator /= value;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"char = %lu", sizeof(char));
        NSLog(@"short = %lu", sizeof(short));
        NSLog(@"int = %lu", sizeof(int));
        NSLog(@"long = %lu", sizeof(long));
        NSLog(@"long int = %lu", sizeof(long int));
        NSLog(@"long long = %lu", sizeof(long long));
        NSLog(@"long long int = %lu", sizeof(long long int));
        
        NSLog(@"float = %lu", sizeof(float));
        NSLog(@"double = %lu", sizeof(double));
        NSLog(@"long double = %lu", sizeof(long double));
    }
    
    Calculator *deskCalc = [Calculator new];
    
    [deskCalc setAccumulator:100.0];
    NSLog(@"%f", [deskCalc accumulator]);
    
    [deskCalc add:200.0];
    NSLog(@"%f", [deskCalc accumulator]);
    
    [deskCalc divide:15.0];
    NSLog(@"%f", [deskCalc accumulator]);
    
    [deskCalc subtract:10.0];
    NSLog(@"%f", [deskCalc accumulator]);
    
    [deskCalc multiply:5.0];
    NSLog(@"%f", [deskCalc accumulator]);
    
    return 0;
}
