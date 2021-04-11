import Foundation

let date = Date().description

var startIndex = date.startIndex
var endIndex = date.index(startIndex, offsetBy: 3)
let year = date[startIndex...endIndex]

startIndex = date.index(startIndex, offsetBy: 5)
endIndex = date.index(startIndex, offsetBy: 1)
let month = date[startIndex...endIndex]

startIndex = date.index(startIndex, offsetBy: 3)
endIndex = date.index(startIndex, offsetBy: 1)
let day = date[startIndex...endIndex]

print(year)
print(month)
print(day)
