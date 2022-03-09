//
//  ViewController.swift
//  working with light 1 rudraksh
//
//  Created by Student on 09/03/22.
//  Copyright © 2022 SVIIT. All rights reserved.
//

import UIKit
import ARKit
import SceneKit



class ViewController: UIViewController {

    
    @IBOutlet var SceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    let showLight = SCNNode()
    
    	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        SceneView.delegate = self
        SceneView.showStatistics = true
        SceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
    }

   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showShape()
        lightOn()
        SceneView.session.run(configuration)
         
    }
    func showShape() {
        let sphere = SCNSphere(radius: 0.03)
        sphere.firstMaterial?.diffuse.contents = UIColor.white
        let node = SCNNode()
        node.geometry = sphere
        node.position = SCNVector3(0.1,0,0)
        SceneView.scene.rootNode.addChildNode(node)
        
    }
    
    func lightOn(){
        SCNLight.showLight.light = SCNLight()
        SCNLight.showLight.light.type = .omni
        SCNLight.showLight.light.color = UIColor(white: 0.6, alpha: 1.0)
        
        showLight.position = SCNVector3(0,0,0)
        
    }
    
    @IBAction func TempratureChange(_ sender: UISlider) {
        SCNLight.showLight.light.temprature = CGFloat(sender.value)
    }
    
    @IBAction func internsityChange(_ sender: UISlider) {
        (SCNLight.showLight.light().intensity = CGFloat(sender.value)
    }
    
    @IBAction func colorButton(_ sender: UIButton) {
        SCNLight.showLight.light().color = sender.backgroundColor!
    }
}

