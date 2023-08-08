//
//  CanvasError.swift
//  Draw
//
//  Created by Flora Raymond on 2023/8/7.
//

import SwiftUI

public enum CanvasEvent: Error {
    /// The canvas is not started yet. Tap on the blue area to generate the first vertex.
    case unstarted
    /// The canvas has already been reset as there are no vertices.
    case alreadyReset
    /// Minimum three vertices are required to form a polygon.
    case pointsCountError
    /// The vertices you touched cannot form a polygon. Please try again.
    case unableToDrawPolygon
    /// Cannot draw a polygon with current vertices, but you can add more vertices to complete the drawing.
    case currentUnableToDrawPolygon
    /// Drawing is already completed. Reset the canvas to start a new drawing.
    case alreadyComplete
    /// Draw polygon success
    case success
    
    /// Get the error description in text form.
    var text: String {
        switch self {
        case .unstarted:
            return "Tap on the blue area to generate the first vertex."
        case .alreadyReset:
            return "The canvas has already been reset as there are no vertices."
        case .pointsCountError:
            return "Minimum three vertices are required to form a polygon."
        case .unableToDrawPolygon:
            return "The vertices you touched cannot form a polygon. Please try again."
        case .currentUnableToDrawPolygon:
            return "Cannot draw a polygon with current vertices, but you can add more vertices to complete the drawing."
        case .alreadyComplete:
            return "Drawing is already completed. Reset the canvas to start a new drawing."
        case .success:
            return "Draw polygon success!"
        }
    }
    
    /// Get the text color for displaying the error message.
    var textColor: Color {
        switch self {
        case .success:
            return Color.green
        default:
            return Color.red
        }
    }
}
