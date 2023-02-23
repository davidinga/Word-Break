func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let s = s.map(Character.init)
    let words = Set(wordDict)

    var table: [Bool] = Array(repeating: false, count: s.count + 1)
    
    table[0] = true
    
    for i in table.indices where i > 0 {
        for j in s.indices where j >= i {
            table[i] = table[i] || (words.contains(String(s[i...j])) && table[i - 1])
        }
    }
    
    return table[s.count]
}