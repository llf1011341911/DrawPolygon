//
//  PolygonUtils.swift
//  Draw
//
//  Created by Flora Raymond on 2023/8/7.
//

import Foundation

class PolygonUtils {
    
    // Check if the points can form a polygon
    static func isPolygon(points: [CGPoint]) -> Bool {
        let count = points.count
        guard count >= 3 else {
            // Not enough points to form a polygon
            return false
        }
        
        // Convert points into an array of line segments
        let lines = stride(from: 0, to: count-1, by: 1).map { index in
            let startPoint = points[index]
            let endPoint = points[(index + 1) % count]
            return PolygonLine(startPoint: startPoint, endPoint: endPoint)
        }
        
        // Check for any intersecting lines
        for i in 0..<lines.count-1 {
            let line1 = lines[i]
            for j in i + 1..<lines.count {
                let line2 = lines[j]
                if line1.intersects(with: line2) {
                    // Two line segments intersect, cannot form a polygon
                    return false
                }
            }
        }
        return true
    }
}
