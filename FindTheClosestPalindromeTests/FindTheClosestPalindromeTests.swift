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
    
    func nearestPalindromic(number: String) -> String {
        
        guard let n = Int(number) else {
            return ""
        }
        
        let leftPalindrome = findLeftSidePalindrome(number: n)
        let rightPalindrome = findRightSidePalindrome(number: n)
        
        let leftDifference = abs(n - leftPalindrome)
        let rightDifference = abs(n - rightPalindrome)
        
        let mininumDifference = min(leftDifference, rightDifference)
        
        return mininumDifference == leftDifference
        ? String(leftPalindrome)
        : String(rightPalindrome)
    }
    
    private func findLeftSidePalindrome(number: Int) -> Int {
        
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
    
    private func findRightSidePalindrome(number: Int) -> Int {
        
        var result: Int? = nil
        var currentNumber = number
        
        while result == nil {
            if currentNumber.isPalindrome && currentNumber != number {
                result = currentNumber
            }
            currentNumber += 1
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
    
    func test_nearestPalindromic_shouldReturnEmptyOnEmptyStringNumber() {
        let sut = Program()
        
        let result = sut.nearestPalindromic(number: "")
        
        XCTAssertEqual(result, "")
    }
    
    
    func test_nearestPalindromic_shouldFindNearestPalindromeOnThreeDigits() {
        let sut = Program()
        
        let result = sut.nearestPalindromic(number: "123")
        
        XCTAssertEqual(result, "121")
    }
    
    func test_nearestPalindromic_shouldFindNearestPalindromeOnSingleDigit() {
        let sut = Program()
        
        let result = sut.nearestPalindromic(number: "1")
        
        XCTAssertEqual(result, "0")
    }
    
    func test_nearestPalindromic_shouldFindNearestPalindromeOnTwoDigits() {
        let sut = Program()
        
        let result = sut.nearestPalindromic(number: "56")
        
        XCTAssertEqual(result, "55")
    }
}
