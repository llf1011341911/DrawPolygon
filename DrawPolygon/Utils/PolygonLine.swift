//
//  PolygonLine.swift
//  Draw
//
//  Created by Flora Raymond on 2023/8/7.
//

import Foundation

struct PolygonLine {
    // Start point of the line segment
    var startPoint: CGPoint
    // End point of the line segment
    var endPoint: CGPoint
    
    init(startPoint: CGPoint, endPoint: CGPoint) {
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    // Check if two lines intersect
    func intersects(with line: PolygonLine) -> Bool {
        // Calculate the determinant
        let det1 = determinant(startX: self.startPoint.x, startY: self.startPoint.y, endX: self.endPoint.x, endY: self.endPoint.y, lineStartX: line.startPoint.x, lineStartY: line.startPoint.y)
        let det2 = determinant(startX: self.startPoint.x, startY: self.startPoint.y, endX: self.endPoint.x, endY: self.endPoint.y, lineStartX: line.endPoint.x, lineStartY: line.endPoint.y)
        let det3 = determinant(startX: line.startPoint.x, startY: line.startPoint.y, endX: line.endPoint.x, endY: line.endPoint.y, lineStartX: self.startPoint.x, lineStartY: self.startPoint.y)
        let det4 = determinant(startX: line.startPoint.x, startY: line.startPoint.y, endX: line.endPoint.x, endY: line.endPoint.y, lineStartX: self.endPoint.x, lineStartY: self.endPoint.y)
        
        // Check if two line segments intersect or are collinear
        let isIntersecting = (det1 * det2 < 0) && (det3 * det4 < 0)
        let isCollinear = (det1 == 0 && det3 == 0 && det2 >= 0 && det2 <= 1) || (det2 == 0 && det4 == 0 && det1 >= 0 && det1 <= 1)

        return isIntersecting || isCollinear
    }

    // Use the result of the determinant to determine if the intersection point is between the two line segments.
    // If the determinant value is positive, the point is on the left side of the line segment. If it's negative, it's on the right side. If it's 0, the three points are collinear.
    private func determinant(startX: CGFloat, startY: CGFloat, endX: CGFloat, endY: CGFloat, lineStartX: CGFloat, lineStartY: CGFloat) -> CGFloat {
        return (endX-startX) * (lineStartY-startY) - (lineStartX-startX) * (endY-startY)
    }
}
