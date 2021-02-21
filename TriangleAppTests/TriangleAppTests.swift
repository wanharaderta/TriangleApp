//
//  TriangleAppTests.swift
//  TriangleAppTests
//
//  Created by Wanhar on 21/02/21.
//

import XCTest
@testable import TriangleApp

class TriangleAppTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func testExample() throws {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }
  
  func testPerformanceExample() throws {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
  func testInvalidInputSides(){
    XCTAssertThrowsError(try detectTriangle(-1, 2, 3)) { error in
      XCTAssertEqual(error as? TriangleError, TriangleError.invalidInput)
    }
  }
  
  
  func testDetectEquilateralTriangle() {
    XCTAssertEqual(try detectTriangle(2, 2, 2), "Segitiga Sama Sisi")
  }
 
  func testDetectIsoscelesTriangle() {
    XCTAssertEqual(try detectTriangle(1, 1, 2), "Segitiga Sama Kaki")
    XCTAssertEqual(try detectTriangle(1, 2, 1), "Segitiga Sama Kaki")
    XCTAssertEqual(try detectTriangle(1, 2, 2), "Segitiga Sama Kaki")
    XCTAssertEqual(try detectTriangle(2, 1, 2), "Segitiga Sama Kaki")
  }
  
  func detectTriangle(
    _ sideA: Int,
    _ sideB: Int,
    _ sideC: Int
  ) throws -> String {
    for side in [sideA, sideB, sideC] {
      if side < 1 {
        throw TriangleError.invalidInput
      }
    }
    
    if sideA == sideB && sideA == sideC {
      return "Segitiga Sama Sisi"
    } else if sideA == sideB || sideA == sideC || sideB == sideC {
      return "Segitiga Sama Kaki"
    } else {
      return "Segitiga Sembarang"
    }
  }
}

enum TriangleError: Error {
  case invalidInput
}
