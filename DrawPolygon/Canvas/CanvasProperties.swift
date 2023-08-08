//
//  CanvasProperties.swift
//  Draw
//
//  Created by Flora Raymond on 2023/8/7.
//

import SwiftUI

struct CanvasProperties {
    /// The width of the lines drawn on the canvas.
    var lineWidth: CGFloat = 1
    
    /// The radius of the dots drawn on the canvas.
    var dotRadius: CGFloat = 2
    
    /// The color of the lines drawn on the canvas.
    var strokeColor: Color = .white
    
    /// The color of the dots drawn on the canvas.
    var pointColor: Color = .black
    
    /// The background color of the canvas.
    var backgroundColor: Color = .blue
}
