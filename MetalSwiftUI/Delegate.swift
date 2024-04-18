//
//  Delegate.swift
//  MetalSwiftUI
//
//  Created by Philipp Kotte on 16.04.24.
//

import Foundation
import Metal
import MetalKit

class Delegate: NSObject, MTKViewDelegate{
    var parent: MetalView
    var _device: MTLDevice!
    var commandQueue: MTLCommandQueue!
    var pipeline: MTLRenderPipelineState!
    
    var scene: Scenne!
    
    init(_ parent: MetalView){
        self.parent = parent
        if let device = MTLCreateSystemDefaultDevice() {
            self._device = device
        }
        self.commandQueue = _device.makeCommandQueue()!
        super.init()
        self.scene = Scenne(device: _device)
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        print("Width: \(size.width) |  Height: \(size.height)")
    }
    
    
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable, let rpd = view.currentRenderPassDescriptor else {
            return
        }
        let commandBuffer = commandQueue.makeCommandBuffer()
        rpd.colorAttachments[0].clearColor = MTLClearColorMake(1.0, 1.0, 1.0, 1.0)
        rpd.colorAttachments[0].loadAction = .clear
        rpd.colorAttachments[0].storeAction = .store
        let commandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: rpd)
        
        scene.render(commandEncoder: commandEncoder!)
        
        commandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
