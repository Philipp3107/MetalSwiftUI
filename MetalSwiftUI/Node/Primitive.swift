//
//  Primitive.swift
//  MetalSwiftUI
//
//  Created by Philipp Kotte on 18.04.24.
//

import MetalKit

class Primitive: Node{
    
    var vertecies: [Vertex]!
    var indecies: [UInt16]!
    
    var vertexBuffer: MTLBuffer!
    var indexBuffer: MTLBuffer!
    var renderPipelineState: MTLRenderPipelineState!
    
    var modelConstants = ModelConstants()
    
    init(device: MTLDevice){
        super.init()
        build_vertecies()
        build_buffer(device: device)
        buildPipelineState(device: device)
    }
    
    func build_vertecies() {}
    
    func build_buffer(device: MTLDevice) {
        vertexBuffer =  device.makeBuffer(bytes: vertecies, length: MemoryLayout<Vertex>.stride * vertecies.count, options: [])!
        indexBuffer = device.makeBuffer(bytes: indecies, length: MemoryLayout<UInt16>.size * indecies.count, options: [])!
    }
    
    func buildPipelineState(device: MTLDevice){
        let library = device.makeDefaultLibrary()
        let vertexFunction = library?.makeFunction(name: "vertexMain")
        let fragmentFunction = library?.makeFunction(name: "fragmentMain")
        
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = .rgba8Unorm
        renderPipelineDescriptor.vertexFunction = vertexFunction
        renderPipelineDescriptor.fragmentFunction = fragmentFunction
        
        
        let vertexDecriptor = MTLVertexDescriptor()
        vertexDecriptor.attributes[0].bufferIndex = 0
        vertexDecriptor.attributes[0].format = .float3
        vertexDecriptor.attributes[0].offset = 0
        
        vertexDecriptor.attributes[1].bufferIndex = 0
        vertexDecriptor.attributes[1].format = .float4
        vertexDecriptor.attributes[1].offset = MemoryLayout<SIMD4<Float>>.size
        
        vertexDecriptor.layouts[0].stride = MemoryLayout<Vertex>.stride
        
        renderPipelineDescriptor.vertexDescriptor = vertexDecriptor
        
        
        
        do {
            renderPipelineState = try device.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
        }catch let error as NSError {
            print("\(error.description)")
        }
    }
    
    func scale(axis: SIMD3<Float>){
        modelConstants.model_matrix.scale(axis: axis)
    }
    
    func translate(direction: SIMD3<Float>){
        modelConstants.model_matrix.translate(direction: direction)
    }
    
    func rotate(degrees: Int, axis: SIMD3<Float>){
        modelConstants.model_matrix.rotate(degrees: degrees, axis: axis)
    }
    
    override func render(commandEncoder: any MTLRenderCommandEncoder) {
        commandEncoder.setRenderPipelineState(renderPipelineState)
        super.render(commandEncoder: commandEncoder)
        
        commandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        commandEncoder.setVertexBytes(&modelConstants, length: MemoryLayout<ModelConstants>.stride, index: 1)
         commandEncoder.drawIndexedPrimitives(type: .triangle,
                                             indexCount: indecies.count,
                                             indexType: .uint16,
                                             indexBuffer: indexBuffer,
                                             indexBufferOffset: 0)
    }
    
}
