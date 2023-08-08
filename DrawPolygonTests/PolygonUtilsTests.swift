//
//  PolygonUtilsTests.swift
//  DrawTests
//
//  Created by Flora Raymond on 2023/8/7.
//

import XCTest
@testable import DrawPolygon

class PolygonUtilsTests: XCTestCase {
    
    // Test case for valid points array without overlapping lines
    func testIsPolygon_ValidPoints_ReturnsTrue() {
        let points: [CGPoint] = [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 0, y: 1),
            CGPoint(x: 1, y: 0),
            CGPoint(x: 1, y: 1)
        ]
        XCTAssertTrue(PolygonUtils.isPolygon(points: points))
    }
    
    // Test case for points array with less than 3 points
    func testIsPolygon_LessThan3Points_ReturnsFalse() {
        let points: [CGPoint] = [
            CGPoint(x: 0, y: 0)
        ]
        XCTAssertFalse(PolygonUtils.isPolygon(points: points))
    }
    
    // Test case for points array with overlapping lines
    func testIsPolygon_OverlappingLines_ReturnsFalse() {
        let points: [CGPoint] = [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 0, y: 1),
            CGPoint(x: 1, y: 0),
            CGPoint(x: 1, y: 1),
            CGPoint(x: 0, y: 0)
        ]
        XCTAssertFalse(PolygonUtils.isPolygon(points: points))
    }
    
    // Test case for points array without overlapping lines
    func testIsPolygon_NonOverlappingLines_ReturnsTrue() {
        let points: [CGPoint] = [
            CGPoint(x: 0, y: 0),
            CGPoint(x: 0, y: 1),
            CGPoint(x: 1, y: 0),
            CGPoint(x: 1, y: 2),
            CGPoint(x: 2, y: -1),
            CGPoint(x: 0, y: 0)
        ]
        XCTAssertTrue(PolygonUtils.isPolygon(points: points))
    }
    
}


