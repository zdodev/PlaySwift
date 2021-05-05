## Print Statements

객체의 상태를 보기 위해 다음과 같은 함수를 사용할 수 있습니다.

- print()
- debugPrint()
- dump()

print() 함수는 다음과 같이 동작합니다.

- description이 정의되어 있는지 확인합니다. 정의되어 있으면 `description`을 출력합니다.
- 그렇지 않으면 단순히 프로젝트명.클래스명으로 출력합니다.

debugPrint(), dump() 함수는 다음과 같이 동작합니다.

- debugDescription이 정의되어 있는지 확인합니다. 정의되어 있으면 `debugDescription`을 출력합니다.
- 그렇지 않으면 description을 출력합니다. 그렇지 않으면 단순히 프로젝트명.클래스명으로 출력합니다.

### CustomStringConvertible 프로토콜

print() 함수에서 사용하는 description을 구현하기 위해서 `CustomStringConvertible` 프로토콜을 채택합니다.

### CustomDebugStringConvertible 프로토콜

debugPrint(), dump() 함수에서 사용하는 debugDescription을 구현하기 위해서 `CustomDebugStringConvertible` 프로토콜을 채택합니다.

debugDescription의 경우 실제로 디버깅에 활용할 수 있는 좋은 형태로 정의합니다. 객체 이름, 주소, 프로퍼티 상태를 출력할 수 있는 디버그 문자열을 만들어두면 디버깅 시에 유용하게 활용할 수 있습니다.

### 참고 링크

---

> [Apple Debugging L1 - Print Statements](https://www.youtube.com/watch?v=TAMIveu0Aag&list=PLgTh9sDnKCUM9cgjfwIkJCSMkUGYmjB6-&index=1)