struct KakaoFriends: CustomStringConvertible {
    let name: String
    let age: Int
    let height: Int
    
    var description: String {
        "\(name), \(age), \(height)"
    }
}

let ryan = KakaoFriends(name: "ryan", age: 21, height: 180)
let choosik = KakaoFriends(name: "choosik", age: 3, height: 50)
let apeach = KakaoFriends(name: "apeach", age: 18, height: 160)

print(ryan)
// ryan, 21, 180

print(ryan)

let kakaoFriends = [ryan, choosik, apeach]

for friend in kakaoFriends {
    print(friend)
}
//ryan, 21, 180
//"ryan"
//
//ryan, 21, 180
//choosik, 3, 50
//apeach, 18, 160
