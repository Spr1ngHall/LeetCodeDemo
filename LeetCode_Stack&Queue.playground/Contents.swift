import UIKit


///155.最小栈
class MinStack {
    
    private var values: [Int] = []
    private var minValues: [Int] = []

    /** initialize your data structure here. */
    init() {

    }
    
    func push(_ x: Int) {
        values.append(x)
        let minValue = minValues.last
        if minValue == nil || x <= minValue! {
            minValues.append(x)
        }
        
    }
    
    func pop() {
        let minValue = minValues.last
        let x = values.removeLast()
        if x == minValue {
            minValues.removeLast()
        }
        
    }
    
    func top() -> Int {
        return values.last!
    }
    
    func getMin() -> Int {
        return minValues.last!
    }
}

let obj = MinStack()
obj.push(1)
obj.push(5)
obj.push(6)
obj.push(7)
obj.push(3)
obj.push(4)
obj.pop()
let ret_3: Int = obj.top()
let ret_4: Int = obj.getMin()


///239. 滑动窗口最大值
class Solution239 {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count == 0 || k < 1 {
            return [Int]()
        }
        if nums.count == 1 {
            return nums
        }

        var queue = [Int]()
        var finalQueue = [Int]()
        var maxCountIndex = 0
        for index in 0..<nums.count {
            if index - k + 1 > maxCountIndex {
                queue.removeFirst()
            }
            while !queue.isEmpty && nums[queue.last!] < nums[index] {
                queue.removeLast()
            }
            queue.append(index)
            maxCountIndex = queue[0]
            if index + 1 >= k {
                finalQueue.append(nums[maxCountIndex])
            }
            
        }
        return finalQueue
    }
}
