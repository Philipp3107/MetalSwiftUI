//
//  Maths.swift
//  MetalSwiftUI
//
//  Created by Philipp Kotte on 18.04.24.
//

import MetalKit
import simd

extension matrix_float4x4  {
    
    ///Scaling for a float4x4 matrix
    mutating func scale(axis: SIMD3<Float>){
        var result = matrix_identity_float4x4
        
        let x = axis.x
        let y = axis.y
        let z = axis.z
        
        result.columns = (
            simd_float4(x,0,0,0),
            simd_float4(0,y,0,0),
            simd_float4(0,0,z,0),
            simd_float4(0,0,0,1)
        )
        
        self = matrix_multiply(self, result)
    }
    
    mutating func translate(direction: SIMD3<Float>){
        var result = matrix_identity_float4x4
        
        let x = direction.x
        let y = direction.y
        let z = direction.z
        
        result.columns = (
            simd_float4(1,0,0,0),
            simd_float4(0,1,0,0),
            simd_float4(0,0,1,0),
            simd_float4(x,y,z,1)
        )
        
        self = matrix_multiply(self, result)
    }
    
    mutating func rotate(degrees: Int, axis: SIMD3<Float>){
        
    }
    
}
