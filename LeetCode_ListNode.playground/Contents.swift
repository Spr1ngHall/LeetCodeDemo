import UIKit


///链表公共方法
public class ListNode: NSObject {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
        self.next = nil
     }
    override public var description: String {
        return "\(val) -> \(String(describing: next?.val))"
    }
}

class Custom {
    func getListNode(_ arr: Array<Int>) -> ListNode? {
        var startNode: ListNode? = ListNode(0)
        let startHead = startNode
        for i in arr {
            let newNode: ListNode? = ListNode(i)
            startNode?.next = newNode
            startNode = startNode?.next
        }
        print(startHead?.next as Any)
        return startHead?.next
    }
}

/////3. 无重复字符的最长子串
//class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        var tempStr = String()
//        var maxStr = String()
//        for char in s {
//            while tempStr.contains(char) {
//                tempStr.remove(at: tempStr.startIndex)
//            }
//            tempStr.append(char)
//            if tempStr.count > maxStr.count {
//                maxStr = tempStr
//            }
//        }
//        return maxStr.count
//    }
//
//}
//
//var a = Solution()
//a.lengthOfLongestSubstring("abcabcbb")
//
//a.lengthOfLongestSubstring("abcabcbb")

/////86. 分隔链表
//class Solution86 {
//    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
//        var optHeadNode = head
//
//        let minNode = ListNode(0)
//        var optMinNode = minNode
//
//        let maxNode = ListNode(0)
//        var optMaxNode = maxNode
//
//        while optHeadNode != nil {
//            if optHeadNode!.val >= x {
//                optMaxNode.next = optHeadNode
//                optMaxNode = optMaxNode.next!
//            } else {
//                optMinNode.next = optHeadNode
//                optMinNode = optMinNode.next!
//            }
//            optHeadNode = optHeadNode?.next
//        }
//        optMaxNode.next = nil
//        optMinNode.next = maxNode.next
//        return minNode.next
//    }
//}


///234.回文链表
class Solution234 {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head?.next == nil {
            return true
        }
        if (head?.next?.next == nil) && head?.next?.val == head?.val {
            return true
        }
        var headNode = head
        
        let middleNode: ListNode? = getMiddleNode(head)
        var reverseNode: ListNode? = getReverseNode(middleNode)
        var isPalindrome = true
        while headNode != nil && reverseNode != nil {
            if headNode?.val != reverseNode?.val {
                isPalindrome = false
            }
            headNode = headNode?.next
            reverseNode = reverseNode?.next
        }
        
        return isPalindrome
    }
    ///翻转链表
    func getReverseNode(_ head: ListNode?) -> ListNode? {
        var curNode: ListNode? = nil
        var headNode = head
        while headNode != nil {
            let newNode: ListNode? = ListNode(headNode!.val)
            newNode?.next = curNode
            curNode = newNode
            headNode = headNode?.next
        }
        return curNode
    }
    ///获取中间节点
    func getMiddleNode(_ head: ListNode?) -> ListNode? {
        var slowNode = head
        var fastNode = head
        while slowNode?.next != nil && fastNode?.next?.next != nil  {
            slowNode = slowNode?.next
            fastNode = fastNode?.next?.next
        }
        if fastNode?.next != nil {
            return slowNode?.next
        }
        return slowNode
    }
}

let array = [4,1,1,2,1,1,4]
var custom = Custom().getListNode(array)
var istrue = Solution234().isPalindrome(custom)
print(istrue)



