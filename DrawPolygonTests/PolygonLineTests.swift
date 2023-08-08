//
//  PolygonLineTests.swift
//  DrawTests
//
//  Created by Flora Raymond on 2023/8/7.
//

import XCTest
@testable import DrawPolygon

class PolygonLineTests: XCTestCase {

    // Test case for overlapping lines
    func testIntersects_OverlappingLines_ReturnsTrue() {
        let line1 = PolygonLine(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 2, y: 2))
        let line2 = PolygonLine(startPoint: CGPoint(x: 1, y: 1), endPoint: CGPoint(x: 3, y: 3))
        XCTAssertTrue(line1.intersects(with: line2))
    }

    // Test case for non-overlapping lines
    func testIntersects_NonOverlappingLines_ReturnsFalse() {
        let line1 = PolygonLine(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 2, y: 2))
        let line2 = PolygonLine(startPoint: CGPoint(x: 3, y: 3), endPoint: CGPoint(x: 5, y: 0))
        XCTAssertFalse(line1.intersects(with: line2))
    }

    // Test case for collinear lines
    func testIntersects_CollinearLines_ReturnsTrue() {
        let line1 = PolygonLine(startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 2, y: 2))
        let line2 = PolygonLine(startPoint: CGPoint(x: 3, y: 3), endPoint: CGPoint(x: 4, y: 4))
        XCTAssertTrue(line1.intersects(with: line2))
    }

}
