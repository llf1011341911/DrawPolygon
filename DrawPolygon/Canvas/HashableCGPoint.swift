//
//  HashableCGPoint.swift
//  Draw
//
//  Created by Flora Raymond on 2023/8/7.
//
//  The HashableCGPoint struct is a custom struct that conforms to the Hashable protocol. It represents a hashable wrapper around a CGPoint value.

import Foundation

struct HashableCGPoint: Hashable {
    let x: CGFloat
    let y: CGFloat

    init(_ point: CGPoint) {
        self.x = point.x
        self.y = point.y
    }
}
