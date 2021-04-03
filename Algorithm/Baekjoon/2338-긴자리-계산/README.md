###  Baekjoon-2338번 긴자리 계산

다른 임의 정밀도 / 큰 수 연산처럼 big number에 대한 문제입니다. 자리수가 < 1000인 조건으로 일반 데이터 타입으로 진행하면 런타임 에러가 발생합니다. 따라서 이전에  1271번 엄청난 부자2 문제처럼 Swift에서 큰 수처리를 할 수 있는 BInt 라이브러리를 가져와서 풀었습니다.

문제는 간단합니다. A+B, A-B, A*B 결과를 차례대로 출력하면 됩니다.

[mkrd/Swift-BigInt](https://github.com/mkrd/Swift-BigInt)