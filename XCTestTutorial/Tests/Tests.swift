import XCTest

final class Tests: XCTestCase {
    private var calculator: Calculator!
    
    override func setUp() {
        super.setUp()
        
        calculator = Calculator()
    }
    
    override func tearDown() {
        calculator = nil
        
        super.tearDown()
    }
    
    func test_add_두_정수를_더하면_합계를_반환한다() {
        // given
        let firstNumber = 10
        let secondNumber = 20
        
        // when
        let result = calculator.add(firstNumber, secondNumber)
        
        // then
        XCTAssertEqual(result, 30, "10 + 20은 30이어야 합니다.")
    }
    
    func test_subtract_두_정수를_빼면_차를_반환한다() {
        // given
        let firstNumber = 10
        let secondNumber = 5
        
        // when
        let result = calculator.subtract(firstNumber, secondNumber)
        
        // then
        XCTAssertEqual(result, 5, "10 - 5는 5이어야 합니다.")
    }
}
