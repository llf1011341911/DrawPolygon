//
//  ContentView.swift
//  DrawPolygon
//
//  Created by Flora Raymond on 2023/8/7.
//

import SwiftUI

struct ContentView: View {
    
    // Create an instance of the CanvasViewModel as an observed object
    @ObservedObject var viewModel = CanvasViewModel()

    // State variable to hold the canvas properties
    @State private var canvasProperties = CanvasProperties()
    
    // State variable to hold canvas errors
    @State private var error: CanvasEvent? = nil
    
    var body: some View {
        VStack(spacing: 0) {
            
            // Render the CanvasView with the specified properties and the view model
            CanvasView(canvasProperties: $canvasProperties, viewModel: viewModel)
                .edgesIgnoringSafeArea(.all)
            
            // Show the error message if an error occurs on the view model
            Text(error?.text ?? "")
                .frame(height: 60)
                .frame(alignment: .center)
                .font(.system(size: 12))
                .foregroundColor(error?.textColor ?? .red)
                .background(Color.white)
            
            // Render the BottomActionView with event handling for complete and reset actions
            BottomActionView { event in
                switch event {
                case .complete:
                    // Call the complete method on the view model
                    self.viewModel.complete()
                case .reset:
                    // Call the reset method on the view model
                    self.viewModel.reset()
                }
            }
            .frame(height: 50)
            .padding(.horizontal)
            .background(Color.white)
            .alignmentGuide(.top) { d in
                d[.bottom]
            }
        }.onReceive(viewModel.$canvasEvent) { error in
            // Update the error state when the canvasError property on the view model changes
            self.error = error
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
