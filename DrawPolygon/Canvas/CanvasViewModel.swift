//
//  CanvasViewModel.swift
//  Draw
//
//  Created by Flora Raymond on 2023/8/7.
//

import SwiftUI

class CanvasViewModel: ObservableObject {
    
    // Array to hold the canvas points
    @Published var canvasPoints: [CGPoint] = []
    
    // Boolean flag to indicate if polygon drawing is in progress
    @Published var drawPolygon: Bool = false
    
    // Canvas error enum to hold and display any errors that occur
    @Published var canvasEvent: CanvasEvent? = .unstarted
    
    /// Add a touch point to the canvas.
    func addPoint(_ point: CGPoint) {
        // If polygon drawing is already complete, show error
        if drawPolygon {
            self.canvasEvent = .alreadyComplete
            return
        }
        
        let points = canvasPoints + [point]
        
        // Check if at least three points exist or if the points form a valid polygon
        if points.count <= 3 || PolygonUtils.isPolygon(points: points) {
            canvasPoints = points
            canvasEvent = nil
        } else {
            canvasEvent = .unableToDrawPolygon
        }
    }
    
    /// Reset the canvas.
    func reset() {
        // If canvas is already empty, show error
        guard canvasPoints.count > 0 else {
            self.canvasEvent = .alreadyReset
            return
        }
        
        // Clear the canvas points and reset the polygon drawing flag
        canvasPoints = []
        drawPolygon = false
        canvasEvent = nil
    }
    
    /// Complete the polygon drawing.
    func complete() {
        // If polygon drawing is already complete, show error
        if drawPolygon {
            self.canvasEvent = .alreadyComplete
            return
        }
        
        // If less than 3 points are present, show error
        guard canvasPoints.count > 2 else {
            self.canvasEvent = .pointsCountError
            return
        }
        
        // Append the first point at the end to close the polygon
        guard let firstPoint = canvasPoints.first else {
            self.canvasEvent = .pointsCountError
            return
        }
        
        let completedPoints = canvasPoints + [firstPoint]
        
        // Check if the completed points form a valid polygon
        if PolygonUtils.isPolygon(points: completedPoints) {
            drawPolygon = true
            canvasPoints = completedPoints
            self.canvasEvent = .success
        } else {
            self.canvasEvent = .currentUnableToDrawPolygon
        }
    }
}
