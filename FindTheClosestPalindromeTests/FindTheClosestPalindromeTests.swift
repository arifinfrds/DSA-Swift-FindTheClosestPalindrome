//
//  FindTheClosestPalindromeTests.swift
//  FindTheClosestPalindromeTests
//
//  Created by arifinfrds.engineer on 23/12/22.
//

// "123" -> "121"
// "1" -> "0"

// "123" -> 123
// <- 123 : 121
// 123 -> 131
// 121 < 131 -> "121"

import XCTest
@testable import FindTheClosestPalindrome

struct Program {
    func findLeftSidePalindrome(number: Int) -> Int {
        
        var result: Int? = nil
        var currentNumber = number
        
        while result == nil {
            if currentNumber.isPalindrome && currentNumber != number {
                result = currentNumber
            }
            currentNumber -= 1
        }
        
        return result!
    }
}

private extension Int {
    var isPalindrome: Bool {
        return String(self) == String(String(self).reversed())
    }
}

final class FindTheClosestPalindromeTests: XCTestCase {

    func test_findLeftSidePalindrome_shouldFindLeftSide() {
        let sut = Program()
        
        let result = sut.findLeftSidePalindrome(number: 123)
        
        XCTAssertEqual(result, 121)
    }
    
    func test_findLeftSidePalindrome_shouldFindLeftSideOnSingleDigit() {
        let sut = Program()
        
        let result = sut.findLeftSidePalindrome(number: 1)
        
        XCTAssertEqual(result, 0)
    }
}
