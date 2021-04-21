//
//  SceneLoadable.swift
//  MetalScope
//
//  Created by Jun Tanaka on 2017/01/20.
//  Copyright © 2017 eje Inc. All rights reserved.
//

import SceneKit

public protocol SceneLoadingDelegate: class {
    func sceneDidLoad(_ scene: SCNScene?)
}

public protocol SceneLoadable: class {
    var scene: SCNScene? { get set }
    var delegate: SceneLoadingDelegate? {get set}
}

