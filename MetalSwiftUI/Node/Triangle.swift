//
//  Triangle.swift
//  MetalSwiftUI
//
//  Created by Philipp Kotte on 18.04.24.
//

import MetalKit

class Triangle : Primitive {
    
    var color: SIMD4<Float>
    
    init(color: SIMD4<Float>, device: MTLDevice){
        self.color = color
        super.init(device: device)
    }
    
    override func build_vertecies() {
        vertecies = [
            Vertex(position: SIMD3( 0.0,  1.0, 0.0), color: color),
            Vertex(position: SIMD3( 1.0, -1.0, 0.0), color: color),
            Vertex(position: SIMD3(-1.0, -1.0, 0.0), color: color)
        ]
        
        indecies = [0, 1, 2/*, 0, 2, 3, 0, 3, 1*/]
    }
}
