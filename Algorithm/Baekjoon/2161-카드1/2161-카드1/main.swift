struct Solution {
    private func readInteger() -> Int {
        Int(readLine()!)!
    }
    
    func solution() {
        let countOfCard = readInteger()
        var cards = [Int]()
        
        for index in 1...countOfCard {
            cards.append(index)
        }
        
        var discardedCards = [Int]()
        
        while cards.count != 1 {
            discardedCards.append(cards.removeFirst())
            cards.append(cards.removeFirst())
        }
        discardedCards.append(cards[0])
        
        let numberToString = discardedCards.map {
            String($0)
        }.joined(separator: " ")
        print(numberToString)
    }
}

Solution().solution()
