/*
Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

Note that the same word in the dictionary may be reused multiple times in the segmentation.

Example 1:

Input: s = "leetcode", wordDict = ["leet","code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".

Example 2:

Input: s = "applepenapple", wordDict = ["apple","pen"]
Output: true
Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
Note that you are allowed to reuse a dictionary word.

Example 3:

Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
Output: false

Constraints:

1 <= s.length <= 300
1 <= wordDict.length <= 1000
1 <= wordDict[i].length <= 20
s and wordDict[i] consist of only lowercase English letters.
All the strings of wordDict are unique.
*/

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