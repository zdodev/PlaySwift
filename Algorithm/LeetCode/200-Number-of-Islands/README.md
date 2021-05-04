### LeetCode 200번 Number of Islands

땅("1")과 물("0")로 표현된 m x n 2D 이진 그리드가 주어질 때 섬의 수를 구하는 문제입니다. 여기서 섬은 수직과 수평으로 인접한 땅을 연결하여 물로 둘러싸인 땅을 말합니다.

---

### DFS를 사용하여 풀이

섬이라고 판단할 수 있는 알고리즘을 생각해야 합니다. "1"인 지역을 발견하고 인접한 지역을 모두 탐색합니다. "1"로 연결된 지역을 모두 탐색하면 그 지역은 이제 하나의 섬이라고 판단할 수 있습니다. 그렇다면 "1"인 지역을 탐방했다고 어떻게 판단할까요?

여기서 탐방했다는 것은 "1" 값을 다른 값으로 바꾸면 됩니다. "1"로 표현된 섬 전체를 다른 값으로 바꾸면 다음에 탐색할 때 해당 섬은 땅이라 판단하지 않고 탐색을 생략하게 됩니다. 따라서 "1"로 표현된 섬 전체를 다른 값으로 바꾸면 그때 섬을 하나 찾았다는 카운트 변수를 1 증가시키면 됩니다.

---

1. DFS를 수행할 메서드를 정의합니다.
2. 그래프 전체를 탐색할 수 있도록 반복문을 구현합니다.
3. DFS를 수행합니다. DFS가 끝나면 섬을 하나 찾은 것이므로 카운트를 증가시킵니다.

1. DFS의 종료 조건은 인덱스를 벗어난 지점을 탐색할 때, 이미 탐색했거나 물인 지역을 탐색할 때.
2. 현재 정점을 탐색했다는 의미로 다른 값으로 변경합니다.
3. 현재 정점을 기준으로 동서남북으로 DFS를 수행합니다. 인접한 정점, 땅으로 표현된 "1"을 반복적으로 찾아 하나의 섬으로 판단하기 위함입니다.