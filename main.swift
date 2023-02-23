func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
    let s = s.map(Character.init)
    let words = Set(wordDict)

    var table: [Bool] = Array(repeating: false, count: s.count + 1)
    
    table[0] = true
    
    for i in s.indices {
        var word = ""
        for j in s.indices where j >= i {
            word.append(s[j])
            table[j + 1] = table[j + 1] || (words.contains(word) && table[i])
        }
    }
    
    return table[s.count]
}