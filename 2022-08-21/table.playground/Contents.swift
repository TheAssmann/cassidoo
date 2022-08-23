import Foundation;

var table1: String =
"""
| Syntax | Description |
| --- | ----------- |
| Header | Title |
| Paragraph | Text |
"""

var table2: String =
"""
| Syntax | Descriptionzzzzzzzzzzzz | Other Stuff |
| --- | -------------- | - |
| Header | Title | Lorem Ipsum Dolor sit amet |
| Paragraph | Text | ... |
"""

func format(_ table: String) -> String {
    var x: [Int] = (table.split(separator: "\n")[0].split(separator: "|")).map{$0.trimmingCharacters(in: [" "]).count}
    table.split(separator: "\n").forEach{$0.split(separator: "|").enumerated().forEach{(i, a) in x[i] = max(x[i], a.count)}}
    
    return "| " + table.split(separator: "\n").map{$0.split(separator: "|").enumerated().map{ var pad = $1.contains{$0 != " " && $0 != "-" } ? " " : "-"; return $1.trimmingCharacters(in: [" "]).padding(toLength: x[$0] - 1, withPad: pad, startingAt: 0)}.joined(separator: " | ")}.joined(separator: " |\n| ") + " |"
}

print(format(table1))
print("")
print(format(table2))
