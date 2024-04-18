//
//  Types.swift
//  MetalSwiftUI
//
//  Created by Philipp Kotte on 16.04.24.
//

import MetalKit

struct Vertex {
    var position: SIMD3<Float>
    var color: SIMD4<Float>
}

struct ModelConstants {
    var model_matrix = matrix_identity_float4x4
}
