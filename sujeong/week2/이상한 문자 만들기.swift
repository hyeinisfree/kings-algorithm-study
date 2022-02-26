func solution(_ s:String) -> String {
    let words: [String] = s.components(separatedBy:" ")
    return words.map{
        var word: String = ""
        for (i, v) in $0.enumerated() {
            if i % 2 == 0 { word += v.uppercased() }
            else { word += v.lowercased() }
        }
        return word
    }.joined(separator:" ")
}
