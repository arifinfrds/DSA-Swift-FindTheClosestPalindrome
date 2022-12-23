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
    func findLeftSidePalindrome(text: String) -> String {
        return "121"
    }
}

final class FindTheClosestPalindromeTests: XCTestCase {

    func test_findLeftSidePalindrome_shouldFineLeftSide() {
        let sut = Program()
        
        let result = sut.findLeftSidePalindrome(text: "123")
        
        XCTAssertEqual(result, "121")
    }
}
