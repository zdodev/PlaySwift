#import <Foundation/Foundation.h>

// 클래스 선언
@interface Car : NSObject

// 메서드 선언
- (void) name;
- (int) gear;
- (int) window;
- (int) wheel;

// 클래스 선언 끝
@end

// 클래스 정의
@implementation Car

// 메서드 정의
- (void)name {
    NSLog(@"부릉이");
}

- (int)gear {
    return 4;
}

- (int)window {
    return 4;
}

- (int)wheel {
    return 4;
}

// 클래스 정의 끝
@end

@interface XYPoint : NSObject

- (void)setX:(int)x;
- (void)setY:(int)y;
- (int)x;
- (int)y;

@end

@implementation XYPoint {
    int xPoint;
    int yPoint;
}

- (void)setX:(int)x {
    xPoint = x;
}

- (void)setY:(int)y {
    yPoint = y;
}

- (int)x {
    return xPoint;
}

- (int)y {
    return yPoint;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 인스턴스 생성
        Car *myCar = [Car new];
        // 인스턴스 메서드 호출
        [myCar name];
        
        XYPoint *xyPoint = [XYPoint new];
        [xyPoint setX:3];
        [xyPoint setY:4];
        NSLog(@"x: %d, y: %d", [xyPoint x], [xyPoint y]);
    }
    return 0;
}
