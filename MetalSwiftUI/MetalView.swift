//
//  MetalView.swift
//  MetalSwiftUI
//
//  Created by Philipp Kotte on 16.04.24.
//

import SwiftUI

import SwiftUI
import MetalKit

struct MetalView: NSViewRepresentable{
    typealias UIViewType = MTKView
    
    func makeCoordinator() -> Delegate {
        Delegate(self)
    }

    func makeMTKView(_ context: MetalView.Context) -> MTKView {
        let mtkView = MTKView()
        mtkView.window?.styleMask = .borderless
        mtkView.delegate = context.coordinator
        mtkView.preferredFramesPerSecond = 60
        if let metalDevice = MTLCreateSystemDefaultDevice() {
            mtkView.device = metalDevice
        }
        mtkView.framebufferOnly = false
        mtkView.colorPixelFormat = .rgba8Unorm
        mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0)
        mtkView.drawableSize = mtkView.frame.size
        mtkView.enableSetNeedsDisplay = true
        mtkView.isPaused = false
        return mtkView
    }
    
    func makeNSView(context: Context) -> MTKView {
        makeMTKView(context)
    }
    
    func updateNSView(_ nsView: MTKView, context: Context) {
    }
}



#Preview {
    MetalView()
}
