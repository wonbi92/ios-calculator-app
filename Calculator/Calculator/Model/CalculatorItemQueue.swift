//
//  CalculatorItemQueue.swift
//  Created by Wonbi on 2022/09/19.
//

import Foundation

struct CalculatorItemQueue {
    private var data: [CalculateItem?] = []
    private var head: Int = 0
    
    var isEmpty: Bool {
        if count == 0 { return true }
        return false
    }
    
    var count: Int {
        data.count - head
    }
    
    mutating func enqueue(_ element: CalculateItem) {
        data.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> CalculateItem? {
        guard head < data.count, let element = data[head] else { return nil }
        data[head] = nil
        head += 1
        
        if head >= 10 {
            data.removeFirst(head)
            head = 0
        }
        
        return element
    }
}
