//
//  ViewController.swift
//  AR_First
//
//  Created by Renāte Zara on 22/12/2018.
//  Copyright © 2018 Kārlis Zars. All rights reserved.
//

//Sphere texture taken from https://www.solarsystemscope.com/textures/
//3D models taken from https://www.turbosquid.com

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //sceneView.showsStatistics = true

        let sphere = SCNSphere(radius: 0.2)
        let sphere2 = SCNSphere(radius: 0.3)
        
        //Example with cube
        //let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)

        let material = SCNMaterial()
        let material2 = SCNMaterial()

        material2.diffuse.contents = UIImage(named: "art.scnassets/8k_earth_daymap.jpg")
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
        
        //For 3D Models example
        //material.diffuse.contents = UIImage(named: "art.scnassets/8k_venus_atmosphere.jpg")
        
        //Example with cube
        //material.diffuse.contents = UIColor.red

        sphere.materials = [material]
        sphere2.materials = [material2]
        
        //Example with cube
        //cube.materials = [material]

        let node = SCNNode()
        let node2 = SCNNode()

        node2.position = SCNVector3(x: 0.5, y: 0.1, z: -0.1)
        node.position = SCNVector3(x: 0, y: 0.1, z: -1)

        node2.geometry = sphere2
        node.geometry = sphere
        
        //Example with cube
        //node.geometry = cube

        sceneView.scene.rootNode.addChildNode(node2)
        sceneView.scene.rootNode.addChildNode(node)


        sceneView.autoenablesDefaultLighting = true
        

        
        // For 3D Models example
//        let cameraScene = SCNScene(named: "art.scnassets/collada.scn")!
//
//        if let cameraNode = cameraScene.rootNode.childNode(withName: "opener", recursively: true) {
//
//            cameraNode.position = SCNVector3(x: 0, y: 0, z: -0.1)
//
//            sceneView.scene.rootNode.addChildNode(cameraNode)
//
//        }
//       // Set the scene to the view
//        sceneView.scene = scene

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
