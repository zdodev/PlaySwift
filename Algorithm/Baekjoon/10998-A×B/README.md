### Baekjoon-10998번 AxB

#### 문제 해결 방식

1. readLine() 메서드로 표준 입력 구현
2. 표준 입력 값(string)을 공백 단위로 분리 후 Integer형 배열로 형변환(map 사용)
3. reduce를 사용하여 배열 원소의 곱을 구함

입력받은 두 정수의 곱을 구하는 문제로 reduce의 첫 번째 인자로 1을 전달하고 nextPartialResult에 결과를 곱하는 클로저를 전달하는 형태로 풀어보았습니다.