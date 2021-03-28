
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return addTwoNumbers(l1, l2, 0)
    }

    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?, _ carry: Int) -> ListNode? {
        guard l1 != nil || l2 != nil else {
            return (carry > 0) ? ListNode(carry) : nil
        }
        
        let l1Val = l1?.val ?? 0
        let l2Val = l2?.val ?? 0
        let value = l1Val + l2Val + carry
        let rl = ListNode(value%10)
        rl.next = addTwoNumbers(l1?.next, l2?.next, value/10)
        return rl
    }
}

print("VAL")
print(Solution().addTwoNumbers(ListNode(2, ListNode(4, ListNode(3))), ListNode(5, ListNode(6, ListNode(4))))?.val as Any) // ==> 7
print("NEXT")
print(Solution().addTwoNumbers(ListNode(2, ListNode(4, ListNode(3))), ListNode(5, ListNode(6, ListNode(4))))?.next?.val as Any) // ==> 0
print("LAST")
print(Solution().addTwoNumbers(ListNode(2, ListNode(4, ListNode(3))), ListNode(5, ListNode(6, ListNode(4))))?.next?.next?.val as Any) // ==> 8
print("DONE")
