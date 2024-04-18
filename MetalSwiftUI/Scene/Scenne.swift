//
//  Scene.swift
//  MetalSwiftUI
//
//  Created by Philipp Kotte on 17.04.24.
//

import MetalKit

class Scenne: Node {
    
    init(device: MTLDevice) {
        super.init()
        for value in stride(from: 0, to: 1, by: 0.01){
            let triangle = Triangle(color: SIMD4(SIMD3(repeating: Float(value)), 1), device: device)
            //triangle.translate(direction: SIMD3(Float(1-value / 4), Float(1 - value / 4), 1.0))
            triangle.rotate(degrees: 45, axis: SIMD3(1.0, 0.0, 0.0))
            triangle.scale(axis: SIMD3(repeating: Float(1 - value)))
            
            add(child: triangle)
        }
        /*let triangle = Triangle(color: SIMD4(1, 1, 1, 1), device: device)
        triangle.scale(axis: SIMD3(0.5, 0.26253, 0.6))
        add(child: triangle)*/
    }
    
    
}
