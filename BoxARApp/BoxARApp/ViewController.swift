//
//  ViewController.swift
//  BoxARApp
//
//  Created by Aman Bind on 23/02/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        sceneView.autoenablesDefaultLighting = true
        sceneView.showsStatistics = true
        let scene = SCNScene()
        sceneView.scene = scene
        
        addBoxToScene()
    }
    
    private func addBoxToScene(){
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.green
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(0,0, -2)
        sceneView.scene.rootNode.addChildNode(boxNode)
        
        
    }


}

