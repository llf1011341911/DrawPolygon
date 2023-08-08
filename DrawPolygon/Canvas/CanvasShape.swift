//
//  CanvasShape.swift
//  Draw
//
//  Created by Flora Raymond on 2023/8/7.
//
//  The path(in:) function constructs a Path object that represents the polygon shape. It starts by moving to the first point, then iterates through the remaining points and adds lines to connect them. If drawPolygon is true, it also adds a line from the last point to the first point to close the polygon.

import SwiftUI

struct CanvasShape: Shape {
    
    // Array of points representing the vertices of the polygon
    var points: [CGPoint]
    
    // Boolean flag indicating if polygon drawing is complete
    var drawPolygon: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Ensure there is at least one point
        guard let firstPoint = points.first else { return path }
        
        // Move to the first point
        path.move(to: firstPoint)
        
        for (index, point) in points.enumerated() {
            if index != 0 {
                // Draw a line to each subsequent point
                path.addLine(to: point)
                
                // If drawing polygon is complete, close the path by drawing a line from the last point to the first point
                if index == points.count - 1 && drawPolygon {
                    path.move(to: point)
                    path.addLine(to: firstPoint)
                }
            }
        }
        
        // Return the completed path
        return path
    }
}
