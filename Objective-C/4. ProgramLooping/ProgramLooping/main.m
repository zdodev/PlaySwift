#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        long sum = 0;
        
        for (int number = 1; number <= 10; number++) {
            sum += number;
        }
        NSLog(@"%ld", sum);
        sum = 0;
        
        int number = 0;
        while (number <= 10) {
            sum += number;
            number++;
        }
        NSLog(@"%ld", sum);
        sum = 0;
        number = 0;
        
        do {
            sum += number;
            number++;
        } while (number <= 10);
        NSLog(@"%ld", sum);
    }
    
    return 0;
}
