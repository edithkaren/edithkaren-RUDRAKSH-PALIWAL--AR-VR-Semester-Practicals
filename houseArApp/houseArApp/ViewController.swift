//
//  ViewController.swift
//  houseArApp
//
//  Created BY RUDRAKSH PALIWAL on 22/03/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.session.run(configuration)
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        sceneView.scene = scene
        
    }

    @IBAction func addHouse(_ sender: Any) {
        addCylinder()
        addCone()
    }
    func addCylinder(){
        let cylinder = SCNNode()
        cylinder.geometry = SCNCylinder(radius: 0.1, height: 0.2)
        cylinder.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "brick.png")
        cylinder.position = SCNVector3(0,-0.15,0)
        sceneView.scene.rootNode.addChildNode(cylinder)
    }
    func addCone(){
        let cone = SCNNode()
        cone.geometry = SCNCone(topRadius: 0, bottomRadius: 0.15, height: 0.17)
        cone.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "roof.jpeg")
        cone.position = SCNVector3(0,0.02,0)
        sceneView.scene.rootNode.addChildNode(cone)
    }
    
    @IBAction func resetView(_ sender: Any) {
        sceneView.session.pause()
        sceneView.scene.rootNode.enumerateChildNodes{(node, _) in
            node.removeFromParentNode()
        }
        sceneView.session.run(configuration, options: [.resetTracking,.removeExistingAnchors])
    }
}

