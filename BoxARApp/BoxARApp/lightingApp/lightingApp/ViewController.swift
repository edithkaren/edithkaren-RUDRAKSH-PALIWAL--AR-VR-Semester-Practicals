//
//  ViewController.swift
//  lightingApp
//
//  Created by Student on 09/03/22.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController, ARSCNViewDelegate{

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    let showLight = SCNNode()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        sceneView.scene = scene
                
    }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
        showShape()
        lightOn()
        sceneView.session.run(configuration)
    }
    
    func showShape() {
        let sphere = SCNSphere(radius: 0.03)
        sphere.firstMaterial?.diffuse.contents = UIColor.white
        let node = SCNNode()
        node.geometry = sphere
        node.position = SCNVector3(0.1, 0, 0)
        sceneView.scene.rootNode.addChildNode(node)
    }
    func lightOn() {
        showLight.light = SCNLight()
        showLight.light?.type = .omni
        showLight.light?.color = UIColor(white: 0.6, alpha: 1.0)
        showLight.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(showLight)
    }
    
    @IBAction func temperatureChange(_ sender: UISlider) { showLight.light?.temperature = CGFloat(sender.value)
    }
    
    @IBAction func intensityChange(_ sender: UISlider) { showLight.light?.intensity = CGFloat(sender.value)
    }
    @IBAction func colorButton(_ sender: UIButton) { showLight.light?.color = sender.backgroundColor!
    }
    
    


}

