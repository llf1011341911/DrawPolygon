//
//  BottomActionView.swift
//  Draw
//
//  Created by Flora Raymond on 2023/8/7.
//
//  The BottomActionView is a SwiftUI View that presents two buttons at the bottom, namely “Reset” and “Complete”. Each button has an associated touch event handler closure (touchEventHandler) which takes a BottomActionEvent as a parameter.

import SwiftUI

enum BottomActionEvent {
    case reset
    case complete
}

struct BottomActionView: View {
    
    // Closure to handle bottom action events
    let touchEventHandler: ((BottomActionEvent) -> Void)?
    
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {
                // Call the touch event handler with the "reset" event
                self.touchEventHandler?(.reset)
            }) {
                Text("Reset")
            }
            
            Button(action: {
                // Call the touch event handler with the "complete" event
                self.touchEventHandler?(.complete)
            }) {
                Text("Complete")
            }
        }
        .padding(10)
    }
}
