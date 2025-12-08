import XCTest

class MockNetwork: NetworkProvider {
    var isFetchCalled = false
    var fakeResult = "TestUser"
    
    func fetchUserName(userId: String) -> String {
        isFetchCalled = true
        return fakeResult
    }
}

final class NetworkTests: XCTestCase {
    private var userService: UserService!
    private var mockNetwork: MockNetwork!
    
    override func setUp() {
        super.setUp()
        
        mockNetwork = MockNetwork()
        userService = UserService(network: mockNetwork)
    }
    
    override func tearDown() {
        super.tearDown()
        
        mockNetwork = nil
        userService = nil
    }
    
    func test_getWelcomMessage_데이터를_가져와서_메시지를_반환한다() {
        // given
        mockNetwork.fakeResult = "IronMan"
        
        // when
        let message = userService.getWelcomeMessage(userId: "user_01")
        
        // then
        XCTAssertEqual(message, "Hello, IronMan!", "환영 메시지가 형식에 맞지 않습니다.")
        XCTAssertTrue(mockNetwork.isFetchCalled, "네트워크 요청이 수행되지 않았습니다.")
    }
}
