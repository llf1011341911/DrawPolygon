//
//  CanvasView.swift
//  Draw
//
//  Created by Flora Raymond on 2023/8/7.
//
//  The CanvasView is a SwiftUI View that displays the canvas, including the polygon shape and the points/dots. It uses the CanvasShape struct to draw the polygon shape and iterates through the canvas points to draw circles at each point location.

import SwiftUI

struct CanvasView: View {
    
    @Binding var canvasProperties: CanvasProperties
    // Observable object that holds the canvas data
    @ObservedObject var viewModel: CanvasViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Draw the polygon shape using the CanvasShape struct
                CanvasShape(points: viewModel.canvasPoints,
                            drawPolygon: viewModel.drawPolygon)
                .stroke(canvasProperties.strokeColor, lineWidth: canvasProperties.lineWidth)
                
                // Draw points as circles at each canvas point
                ForEach(viewModel.canvasPoints.map(HashableCGPoint.init), id: \.self) { point in
                    Circle()
                        .frame(width: canvasProperties.dotRadius * 2, height: canvasProperties.dotRadius * 2)
                        .foregroundColor(canvasProperties.pointColor)
                        .position(CGPoint(x: point.x, y: point.y))
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(canvasProperties.backgroundColor)
            .onTapGesture(count: 1) { location in
                // Add the tapped point to the canvas
                viewModel.addPoint(location)
            }
        }
    }
}

