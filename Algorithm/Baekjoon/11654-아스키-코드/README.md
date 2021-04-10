### Baekjoon 11654번 아스키 코드

입력 문자 값에 대해서 아스키 코드 값을 출력하는 문제입니다. Swift에서는 `UnicodeScalar`를 사용하여 해결할 수 있습니다. UnicodeScalar(character).value 를 사용하면 character에 대한 유니코드 값을 얻을 수 있는데 문제에서 주어진 문자를 character에 넣으면 아스키 값을 얻을 수 있습니다.