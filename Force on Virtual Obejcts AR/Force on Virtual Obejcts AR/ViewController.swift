//
//  ViewController.swift
//  Force on Virtual Obejcts AR
//
//  Created by Student on 26/04/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
 
    let configuration = ARWorldTrackingConfiguration()
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        sceneView.delegate = self
        sceneView.session.run(configuration)
         
        let TapGesture = UITapGestureRecognizer(target: self, action: #selector(tapResponse))
        sceneView.addGestureRecognizer(TapGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
    @objc func tapResponse(sender: UITapGestureRecognizer){
          
        guard let scene = sender.view as?  ARSCNView else {return }
        guard  let pov = scene.pointOfView else {return}
        let transform = pov.transform
        let orientation = SCNVector3(-transform.m31, -transform.m32,-transform.m33)
        let location =  SCNVector3(transform.m41, transform.m42, transform.m43)
        let position = SCNVector3(orientation.x + location.x, orientation.y + location.y, orientation.z + location.z)
        let projectile = SCNNode()
        projectile.geometry = SCNSphere(radius: 0.03)
        projectile.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        projectile.position = position
        projectile.physicsBody = SCNPhysicsBody(type: .dynamic, shape: SCNPhysicsShape(node: projectile, options: nil ))
        projectile.physicsBody?.isAffectedByGravity = false
        let force : Float = 50
        projectile.physicsBody?.applyForce(SCNVector3(orientation.x * force, orientation.y * force, orientation.z * force), asImpulse: true)
        sceneView.scene.rootNode.addChildNode(projectile)
        
        
        
      
    
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
