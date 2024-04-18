//
//  Plane.swift
//  MetalSwiftUI
//
//  Created by Philipp Kotte on 17.04.24.
//

import MetalKit

class Plane: Primitive {
    
    override func build_vertecies() {
        
        let size: Float = 1.0
        
        vertecies = [
            /*Vertex(position: SIMD3( size,  size, 0.0), color: SIMD4(0.37, 0.4, 0.79, 1.0)),
            Vertex(position: SIMD3(-size, size, 0.0), color: SIMD4(0.1, 0.18, 0.31, 1.0)),
            Vertex(position: SIMD3( -size, -size, 0.0), color: SIMD4(0.5, 0.66, 0.69, 1.0)),
            Vertex(position: SIMD3(  size, -size, 0.0), color: SIMD4(0.01, 0.81, 0.13, 1.0)),*/
            
            Vertex(position: SIMD3( size,  size, 0.0), color: SIMD4(0.0, 0.0, 1.0, 1.0)),
            Vertex(position: SIMD3(-size, size, 0.0), color: SIMD4(0.0, 1.0, 0.0, 1.0)),
            Vertex(position: SIMD3( -size, -size, 0.0), color: SIMD4(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: SIMD3(  size, -size, 0.0), color: SIMD4(0.01, 0.81, 0.13, 1.0)),
            
        ]
        
        indecies = [0, 1, 2, 0, 2, 3]
    }
    
    
    
    
}
