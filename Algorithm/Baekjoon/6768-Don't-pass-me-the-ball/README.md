###  Baekjoon 6768번 Don't pass me the ball!

조합 문제입니다. nC4를 구하는 문제로 이해했는데 문제에 '져지 번호가 있고 가장 높은 번호가 골 득점자인 경우에만 골이 계산됩니다.' 라는 문장이 있습니다.

가장 높은 번호는 주어진 값에서 가장 큰 수이며 이 번호를 가진 선수가 4번째에 득점을 해야 득점을 한다는 얘기입니다.

그러므로 가장 큰 번호는 이미 골랐다고 생각하면 n명 중에서 1명이 빠지고 나머지 3명을 구하는 문제가 됩니다.

따라서 문제는 n-1C3을 구하는 문제가 됩니다.

n이 1~3인 경우는 카운트를 못하므로 0으로 처리하면 됩니다.