//
//  ViewController.swift
//  Plane Detection
//
//  Created by Student on 25/04/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        // Set the view's delegate
        sceneView.delegate = self
        
      
        
        // Set the scene to the view
        sceneView.scene = scene
        
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(tapResponse))
        sceneView.addGestureRecognizer(TapGesture)
        
        @objc func  tapResponse(sender: UITapGestureRecognizer) {
            let scene = sender.view as!  ARSCNView
            let tapLocation = sender.location(in: scene)
            let hitTest =  scene.hitTest(tapLocation, types: .existingPlaneUsingExtent)
            if hitTest.isEmpty {
                print("No Plan Detected")
            }
            else{
                 print("Founded a Plane Detection")
                guard let hitResult = hitTest.first
                else{return}
                addObject(hitResult : hitResult)
            }
    }
    
    func renderer(_renderer:SCNSceneRenderer, didAdd node : SCNNode, for anchor: ARAnchor ) {
        guard anchor is ARPlaneAnchor else {return}
        print("Plane Detected")
    }
    
    func renderer(_rendered:SCNSceneRenderer, didAdd node: SCNNode ,for anchor : ARAnchor) {
        guard anchor is ARPlaneAnchor else {return}
        print("Updating Plane anchor")
    }
        
        func addObeject(hitResult : ARHitTestResult){
            let  objectNode = SCNNode()
            objectNode.geometry = SCNSphere(radius: 0.3)
            objectNode.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
            objectNode.position = SCNVector3(hitResult.worldTransform.columns.3.x, hitResult.worldTransform.columns.3.y, hitResult.worldTransform.columns.3.z)
            
            objectNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
            sceneView.scene.rootNode.addChildNode(objectNode)
        
        }
        
        func displayPlane(anchor: ARPlaneAnchor) -> SCNNode{
            let planeNode = SCNNode()
            planeNode.geometry = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
            planeNode.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
            planeNode.position = SCNVector3(anchor.center.x,anchor.center.y, anchor.center.z)
            let ninetyDegrees = GLKMathDegreesToRadians(90) planeNode.eulerAngles = SCNVector3(ninetyDegrees, 0, 0) planeNode.physicsBody = SCNPhysicsBody(type: .kinematic, shape: nil) planeNode.geometry?.firstMaterial?.isDoubleSided = true
            return planeNode
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
