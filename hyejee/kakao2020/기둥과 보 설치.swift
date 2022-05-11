import Foundation

typealias Location = (x: Int, y: Int)

func isValidLocation(location: Location, mapSize: Int) -> Bool {
    if location.x < 0 || location.x > mapSize || location.y < 0 || location.y > mapSize {
        return false
    }
    else {
        return true
    }
}

func checkAvailablityOfBuildingPillar(at location: Location, _ map: [[[Bool]]]) -> Bool {
    // 바닥에 있거나, 아래에 기둥이 있거나, 보의 왼쪽 끝에 있거나, 보의 오른쪽 끝에 있거나
    if location.y == 0 ||
        (location.y - 1 >= 0 && map[location.y - 1][location.x][0]) ||
        map[location.y][location.x][1] ||
        (location.x - 1 >= 0 && map[location.y][location.x - 1][1]) {
        return true
    }
    
    return false
}

func checkAvailablityOfBuildingBeam(at location: Location, _ map: [[[Bool]]]) -> Bool {
    // 왼쪽 끝에 기둥이 있거나, 오른쪽 끝에 기둥이 있거나, 양쪽에 보가 있는 경우
    if (location.y - 1 >= 0 && map[location.y - 1][location.x][0]) ||
        (location.y - 1 >= 0 && location.x + 1 < map.count && map[location.y - 1][location.x + 1][0]) ||
        (location.x - 1 >= 0 && location.x + 1 < map.count && map[location.y][location.x - 1][1] && map[location.y][location.x + 1][1]) {
        return true
    }
    
    return false
}

func removePillar(at location: Location, _ map: inout [[[Bool]]]) {
    var tempMap = map
    tempMap[location.y][location.x][0] = false
    
    // (location.x - 1, location.y + 1)의 보 확인
    if isValidLocation(location: (location.x - 1, location.y + 1), mapSize: map.count), tempMap[location.y + 1][location.x - 1][1], !checkAvailablityOfBuildingBeam(at: (location.x - 1, location.y + 1), tempMap) {
        return
    }
    
    // (location.x, location.y + 1)의 보 확인
    if isValidLocation(location: (location.x, location.y + 1), mapSize: map.count), tempMap[location.y + 1][location.x][1], !checkAvailablityOfBuildingBeam(at: (location.x, location.y + 1), tempMap) {
       return
    }
    
    // (location.x, location.y + 1)의 기둥 확인
    if isValidLocation(location: (location.x, location.y + 1), mapSize: map.count), tempMap[location.y + 1][location.x][0], !checkAvailablityOfBuildingPillar(at: (location.x, location.y + 1), tempMap) {
        return
    }
    
    map[location.y][location.x][0] = false
}

func removeBeam(at location: Location, _ map: inout [[[Bool]]]) {
    var tempMap = map
    tempMap[location.y][location.x][1] = false
    
    // (location.x - 1, location.y)의 보 확인
    if isValidLocation(location: (location.x - 1, location.y), mapSize: map.count), tempMap[location.y][location.x - 1][1], !checkAvailablityOfBuildingBeam(at: (location.x - 1, location.y), tempMap) {
        return
    }
    
    // (location.x + 1, location.y)의 보 확인
    if isValidLocation(location: (location.x + 1, location.y), mapSize: map.count), tempMap[location.y][location.x + 1][1], !checkAvailablityOfBuildingBeam(at: (location.x + 1, location.y), tempMap) {
        return
    }
    
    // location의 기둥 확인
    if isValidLocation(location: location, mapSize: map.count), tempMap[location.y][location.x][0], !checkAvailablityOfBuildingPillar(at: location, tempMap) {
        return
    }
    
    // (location.x + 1, location.y)의 기둥 확인
    if isValidLocation(location: (location.x + 1, location.y), mapSize: map.count), tempMap[location.y][location.x + 1][0], !checkAvailablityOfBuildingPillar(at: (location.x + 1, location.y), tempMap) {
        return
    }
    
    map[location.y][location.x][1] = false
}

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var map: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: n + 1), count: n + 1)
    
    for buildFrame in build_frame {
        let location: (x: Int, y: Int) = (buildFrame[0], buildFrame[1])
        let structure: Int = buildFrame[2]
        let isRemove: Bool = buildFrame[3] == 0 ? true : false
        
        if isRemove {
            switch structure {
            case 0:
                if map[location.y][location.x][0] {
                    removePillar(at: location, &map)
                }
            case 1:
                if map[location.y][location.x][1] {
                    removeBeam(at: location, &map)
                }
            default:
                fatalError("Invalid input")
            }
        }
        else {
            switch structure {
            case 0:
                if checkAvailablityOfBuildingPillar(at: location, map) {
                    map[location.y][location.x][0] = true
                }
            case 1:
                if checkAvailablityOfBuildingBeam(at: location, map) {
                    map[location.y][location.x][1] = true
                }
            default:
                fatalError("Invalid input")
            }
        }
    }
    
    var answer: [[Int]] = []
    
    for x in 0...n {
        for y in 0...n {
            if map[y][x][0] {
                answer.append([x, y, 0])
            }
            
            if map[y][x][1] {
                answer.append([x, y, 1])
            }
        }
    }
    
    return answer
}
