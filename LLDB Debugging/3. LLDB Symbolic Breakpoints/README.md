## Symbolic Breakpoints

### Xcode 디버그 관련 navigator

- Debug navigator: ⌘ + 7
- Breakpoint navigator: ⌘ + 8

### Symbolic Breakpoint를 이용한 디버깅

- Breakpoint navigator 하단 - Symbolic breakpoint
- Symbol: -[UIButton initWithFrame:]
- Symbol: UIButton.init

(lldb) po $arg1

(lldb) p (SEL)$arg1

(lldb) p $arg1

(lldb) image lookup -rn didFinishLaunchingWithOptions

심볼 파일이란 어셈블리 코드에서 함수 , 변수이름과 같은 정보를 담고있는 파일이다.

.pdb , .dbg 확장자로 심볼파일이 생성 된다.

심볼은 프로그램이나 , 라이브러리 , 드라이버등의 컴파일 작업시에 생성되며 프로그램 디버깅 시 필요한 정보를 가지고 있다.





심볼파일은 다음과 같은 정보를 가지고있다.



전역 변수의 이름과 주소

로컬 변수의 이름과 주소

각엔트리 포인트의 함수 이름과 주소

FPO DATA

변수의 구조 등의 타입정보

소스 파일의 경로와 줄 번호

### 참고 링크

---

> [Apple Debugging L2 - Breakpoints](https://www.youtube.com/watch?v=VdBlMpjqqAc&list=PLgTh9sDnKCUM9cgjfwIkJCSMkUGYmjB6-&index=3)