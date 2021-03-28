import Foundation

func solution(_ bridge_length: Int, _ weight :Int, _ truck_weights: [Int]) -> Int {
    
    var answer = 0
    
    var trucks = truck_weights
    var bridge = Array(repeating: 0, count: bridge_length)
    var onBridge = 0
    
    while !bridge.isEmpty {
        print("sec: \(answer), bridge: \(bridge), onBridge: \(onBridge), trucks: \(trucks)")
        
        answer += 1
        
        // 지나간 트럭 무게 빼준 후 다리 위에서 트럭 제거
        onBridge -= bridge[0]
        bridge.remove(at: 0)
        
        if trucks.count > 0 {
            let truck = trucks[0]
            
            if onBridge + truck <= weight { // 진입 가능
                onBridge += trucks[0]
                trucks.remove(at: 0)
                bridge.append(truck)
            } else { // 진입 불가
                bridge.append(0)
            }
        }
        
    }
    
    return answer
}

print("=====")
print(solution(2, 10, [7,4,5,6])) // ==> 8
print("=====")
//print(solution(100, 100, [10])) // ==> 101
//print("=====")
//print(solution(100, 100, [10,10,10,10,10,10,10,10,10,10])) // ==> 110

