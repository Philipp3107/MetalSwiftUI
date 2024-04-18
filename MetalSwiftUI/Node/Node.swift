//
//  Node.swift
//  MetalSwiftUI
//
//  Created by Philipp Kotte on 17.04.24.
//

import MetalKit

class Node {
    var children: [Node] = []
    
    func add(child: Node){
        children.append(child)
    }
    
    func render(commandEncoder: MTLRenderCommandEncoder){
        for child in children {
            child.render(commandEncoder: commandEncoder)
        }
    }
}
