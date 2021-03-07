### Observer Pattern 이해 및 구현

- Subject(Protocol)
- Observer(Protocol)
- ConcreteSubject(Subject protocol 채택)
- ConcreteObserver(Observer protocol 채택)

ConcreteSubject 객체의 상태가 변할 때(update), 옵저버에게 변화 내용을 알릴 수 있도록 구현(notify)
