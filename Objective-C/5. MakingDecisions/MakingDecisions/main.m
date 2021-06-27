#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a, b;
        NSLog(@"두 정수 입력");
        scanf("%d %d", &a, &b);
        
        if (!(a % b))
            NSLog(@"두 정수는 나누어 떨어집니다.");
    }
    return 0;
}
