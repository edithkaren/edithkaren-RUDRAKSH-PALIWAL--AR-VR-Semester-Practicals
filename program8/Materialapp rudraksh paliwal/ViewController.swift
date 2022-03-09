//
//  ViewController.swift
//  Materialapp rudraksh paliwal
//
//  Created by Student on 02/03/22.
//  Copyright © 2022 SVIIT. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController {

let configuration = ARWorldTrackingConfiguration()
 
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegarte == self
        sceneView.showsStatistics = true sceneView.debugOptions = [ARSCNDebugOptions. showWorldOrigin, ARSCNDebugOptions. showFeaturePoints]
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_animated: bool){
                super.viewWillAppear(animated)
                sceneView.session.run(configuration)
    }
    
    
    

    func ShowShape(){
        let box= UIBezierPath()
        box.move(to: CGPoint(x:0,y:0))
        box.addLine(to : CGPoint(x:0.1,y:0.2))
        box.addLine(to :CGPoint(x:0.1,y:-0.3))
        let customeSHape= SCNShape(path:box, extrusionDepth:0.1)
        let node = SCNNode()
        node.geometry= customeSHape
        node.geometry?.firstMaterial.diffuse.contents = UIColor.green
        node.position= SCNVector3(0,0,0)
        node.name = "box"
       
        sceneView.scene.rootNode.addChildNode(node)
        
    }
}

