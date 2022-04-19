//
//  ViewController.swift
//  Gestures app
//
//  Created by Student on 11/04/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.showStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin,ARSCNDebugOptions.showFeaturePoints]
     // Tap gesture definition
        let tapGesture = UITapGestureRecognizer(target:self, action :#selector(handleTap))
        sceneView.addGestureRecognizer(tapGesture)
        addShapes()
         
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

    
    func addShapes() {
        let node = SCNNode(geometry: SCNBox(width: 0.05, height: 0.04, length: 0.03, chamferRadius: 0))
        
        node.position = SCNVector3(0.1,0,-0.1)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.name = "box"
        sceneView.scene.rootNode.addChildNode(node)
        
        
        let node2 = SCNNode(geometry: SCNPyramid(width: 0.05, height: 0.06, length: 0.04))
        node2.position = SCNVector3(0.1,0.1,-0.1)
        
        node2.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        node2.name = "Pyramid"
        sceneView.scene.rootNode.addChildNode(node2)
        
    }
    
    @objc func handleTap(sender:UITapGestureRecognizer) {
        let areaTapped =  sender.view as! SCNView
        let tappedCoordinates = sender.location(in: areaTapped)
        let hitTest = areaTapped.hitTest(tappedCoordinates)
        if hitTest.isEmpty {
            print("Nothing")
        }
        else{
            let results = hitTest.first!
            let name = results.node.name
            print(name ?? "Background")
        }
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
}
