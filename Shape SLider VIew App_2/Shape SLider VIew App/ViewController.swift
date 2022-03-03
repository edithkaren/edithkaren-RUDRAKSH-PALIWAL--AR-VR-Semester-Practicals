//
//  ViewController.swift
//  Shape SLider VIew App
//
//  Created by Student on 23/02/22.
//  Copyright © 2022 SVIIT. All rights reserved.
//

import UIKit
import SceneKit
import ARKit



class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet var XSlider: UISlider!
    @IBOutlet var YSlider: UISlider!
    @IBOutlet var ZSlider: UISlider!
    
    
    let configuration = ARWorldTrackingConfiguration()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
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
     
    
    @IBAction func addbutton(_ sender: UIButton) {
        showShape()
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        sceneView.session.pause()
        sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            if node.name == "Sphere"{
                  node.removeFromParentNode()
                }
            }
            sceneView.session.run(configuration, options:
        [.resetTracking, .removeExistingAnchors])    }
    
    func showShape(){
        let node = SCNNode()
        node.geometry = SCNSphere(radius:0.05)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        node.position = SCNVector3(XSlider.value,YSlider.value,ZSlider.value)
        node.name="Sphere"
        sceneView.scene.rootNode.addChildNode(node)
    }
    
  		
    
    
    

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    func showShape(){
        	
        let text = SCNText(string: "Hello", extrusionDepth: 1)
        let material = SCNMaterial() material.diffuse.contents = UIColor.orange text.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(Xslider.value, Yslider.value, Zslider.value)
        node.scale = SCNVector3(0.01, 0.01, 0.01) node.geometry = text
        node.name = "shape"
                sceneView.scene.rootNode.addChildNode(node)
    }
}

