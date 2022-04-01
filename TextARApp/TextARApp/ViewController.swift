//
//  ViewController.swift
//  TextARApp
//
//  Created by RUDRAKSH PALIWAL on 17/03/22.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.session
            .run(configuration)
        sceneView.showsStatistics = true
        
        let text = SCNNode()
        text.geometry = SCNText(string: "Aman Bind", extrusionDepth: 0.2)
        text.geometry?.firstMaterial?.diffuse.contents = UIColor.magenta
        text.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(text)
        
    }


}

