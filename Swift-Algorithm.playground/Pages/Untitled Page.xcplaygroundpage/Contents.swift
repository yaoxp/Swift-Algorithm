//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

extension Array where Element: Comparable {
    func countUniques() -> Int {
        let sorted = self.sorted()
        let initial: (Element?, Int) = (nil, 0)
        let reduce = sorted.reduce(initial) {
            ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)
        }
        return reduce.1
    }
}

//countUniques([1, 2, 0, 0, 3, 3, 4])
[1, 2, 0, 0, 3, 3, 4].countUniques()
