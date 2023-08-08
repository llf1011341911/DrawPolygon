//
//  CanvasViewModelTests.swift
//  DrawPolygon
//
//  Created by Flora Raymond on 2023/8/7.
//

import XCTest
@testable import DrawPolygon

class CanvasViewModelTests: XCTestCase {
    
    var viewModel: CanvasViewModel!
    
    override func setUpWithError() throws {
        viewModel = CanvasViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    // Test case for adding valid points
    func testAddPoint_withValidPoints_shouldAddPoint() {
        let point = CGPoint(x: 0, y: 0)
        viewModel.addPoint(point)
        XCTAssertEqual(viewModel.canvasPoints, [point])
    }
    
    // Test case for adding points after polygon drawing is complete
    func testAddPoint_withInvalidPoints_shouldReturnError() {
        let point = CGPoint(x: 0, y: 0)
        viewModel.drawPolygon = true
        viewModel.addPoint(point)
        XCTAssertEqual(viewModel.canvasEvent, .alreadyComplete)
    }
    
    // Test case for adding points that would result in overlapping lines
    func testAddPoint_withUnableToDrawPolygon_shouldReturnError() {
        let point1 = CGPoint(x: 0, y: 0)
        let point2 = CGPoint(x: 0, y: 1)
        let point3 = CGPoint(x: 1, y: 1)
        let point4 = CGPoint(x: 1, y: 2)
        viewModel.canvasPoints = [point1, point2, point3, point4]
        let point5 = CGPoint(x: 0, y: 0)
        viewModel.addPoint(point5)
        XCTAssertEqual(viewModel.canvasEvent, .unableToDrawPolygon)
    }
    
    // Test case for resetting the canvas
    func testReset_shouldResetCanvasPointsAndDrawPolygon() {
        let point = CGPoint(x: 0, y: 0)
        viewModel.canvasPoints = [point]
        viewModel.drawPolygon = true
        viewModel.reset()
        XCTAssertTrue(viewModel.canvasPoints.isEmpty)
        XCTAssertFalse(viewModel.drawPolygon)
    }
    
    // Test case for completing the polygon drawing with three points
    func testComplete_shouldSetDrawPolygonToTrue() {
        let point1 = CGPoint(x: 0, y: 0)
        let point2 = CGPoint(x: 0, y: 1)
        let point3 = CGPoint(x: 1, y: 1)
        viewModel.canvasPoints = [point1, point2, point3]
        viewModel.complete()
        XCTAssertTrue(viewModel.drawPolygon)
        XCTAssertEqual(viewModel.canvasPoints, [point1, point2, point3, point1])
    }
    
}
