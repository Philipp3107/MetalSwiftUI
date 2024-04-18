//
//  Shader.metal
//  MetalSwiftUI
//
//  Created by Philipp Kotte on 16.04.24.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIN {
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct Vertex {
    float4 position [[position]];
    float4 color;
};

struct ModelConstants {
    float4x4 model_matrix;
};



vertex Vertex vertexMain(const VertexIN vIn [[ stage_in ]],constant ModelConstants &modelConstants [[ buffer(1) ]]){
    Vertex v;
    v.position = modelConstants.model_matrix * float4(vIn.position, 1);
    v.color = vIn.color;
    return v;
}

fragment float4 fragmentMain(Vertex vIn [[stage_in]]){
    return vIn.color;
}

