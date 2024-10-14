//
//  ContentView.swift
//  WordScramble
//
//  Created by Мария Газизова on 14.10.2024.
//

import SwiftUI

struct ContentView: View {
    let names = ["Mariia", "Stepan", "Kool"]
    var body: some View {
        List {
            Text("Hello")
            Text("Hello")
        }
        
        List {
            ForEach(0..<3) {
                Text("Mariia \($0)")
            }
            Section("Sec1") {
                Text("The most intresting part")
            }
            Section {
                Text ("Good bye")
            }
        }
        .listStyle(.grouped)
        
        List(0..<5) { // List is quite similar to Form, but create dynamic rows can only List
            Text("Do \($0) myself")
        }
        
        List(names, id: \.self) { name in
            Text(name)
        }
    }
    
    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "some-file",
                                         withExtension: "txt" ) {
            if let fileContent = try? String(contentsOf: fileURL) {
                // file loaded to a String that can be used
            }
        }
    }
    
    func testString() {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        
        let anotherInput = """
        a
        b
        c
        """
        let sameLetters = input.components(separatedBy: "\n")
        
        let lettter = letters.randomElement()
        let trimmed = lettter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspeledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en") // returns NSNotFound if there is no mistakes, can't return nil because it comes from obj-c
        
        let allGood = misspeledRange.location == NSNotFound
    }
}

#Preview {
    ContentView()
}
