//
//  ViewController.swift
//  relativePositionARApp
//
//  Created by RUDRAKSH PALIWAL on 22/03/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate{
    
    let configuration = ARWorldTrackingConfiguration()

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        sceneView.showsStatistics = true
        sceneView.session.run(configuration)
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        let sphere = SCNNode()
        sphere.geometry = SCNSphere(radius: 0.2)
        sphere.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "smiley.jpeg")
        sphere.position = SCNVector3(0,-0.2,0)
        
        let cone = SCNNode()
        cone.geometry = SCNCone(topRadius: 0, bottomRadius: 0.25, height: 0.2)
        cone.geometry?.firstMaterial?.diffuse
            .contents = UIColor.orange
        cone.position = SCNVector3(0, 0.2, 0)
        sphere.addChildNode(cone)
        
        sceneView.scene.rootNode.addChildNode(sphere)
    }


}

