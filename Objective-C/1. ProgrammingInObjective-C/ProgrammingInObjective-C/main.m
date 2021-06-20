// 헤더파일
#import <Foundation/Foundation.h>

// main 함수
int main(int argc, const char * argv[]) {
    // 오토릴리즈풀
    // 객체를 생성하고 사용하는 메모리를 시스템에서 효과적으로 관리.
    @autoreleasepool {
        // Logs an error message to the Apple System Log facility.
        NSLog(@"In Objective-C, lowercase letters are significant.");
        // NSString 형태의 문자열
        NSLog(@"main is where program execution begins.");
        NSLog(@"Open and closed braces enclose program statements in a routine.");
        NSLog(@"All program statements must be terminated by a semicolon");
        
        // 변수 선언
        int i = 1;
        NSLog(@"Testing...");
        // 서식 문자
        NSLog(@"....%i", i);
        NSLog(@"...%i", i + 1);
        NSLog(@"..%i", i + 2);
        
        int number1 = 87;
        int number2 = 15;
        NSLog(@"%d - %d = %d", number1, number2, number1 - number2);
        
        int sum;
        sum = 25 + 37 - 19;
        NSLog(@"The answer is %d", sum);
        
        int answer, result;
        answer = 100;
        result = answer - 10;
        NSLog(@"The result is %d\n", result + 5);
    }
    return 0;
}
