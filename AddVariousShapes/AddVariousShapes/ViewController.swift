//
//  ViewController.swift
//  AddVariousShapes
//
//  Created by Aman Bind on 22/03/22.
//

import UIKit
import ARKit
import SceneKit


class ViewController: UIViewController, ARSCNViewDelegate{

  
    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    var nodeData = [SCNNode()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sceneView.delegate = self
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.session.run(configuration)
        
    }

    @IBAction func addCylinder(_ sender: Any) {
        let cylinder = SCNNode()
        cylinder.geometry = SCNCylinder(radius: 0.1, height: 0.15)
        cylinder
            .geometry?.firstMaterial?.diffuse.contents = UIColor.gray
        cylinder.geometry?.firstMaterial?.specular.contents = UIColor.white
        cylinder.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(cylinder)
        nodeData.append(cylinder)
    }
    
    @IBAction func addCone(_ sender: Any) {
        let cone = SCNNode()
        cone.geometry = SCNCone(topRadius: 0, bottomRadius: 0.1, height: 0.1)
        cone.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        cone.geometry?.firstMaterial?.specular.contents = UIColor.white
        cone.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(cone)
        nodeData.append(cone)
    }
    
    @IBAction func addTube(_ sender: Any) {
        let tube = SCNNode()
        tube.geometry = SCNTube(innerRadius: 0.05, outerRadius: 0.1, height: 0.15)
        tube.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        tube.geometry?.firstMaterial?.specular.contents = UIColor.white
        tube.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(tube)
        nodeData.append(tube)
    }
    
    @IBAction func addCapsule(_ sender: Any) {
        let capsule = SCNNode()
        capsule.geometry = SCNCapsule(capRadius: 0.5, height: 0.1)
        capsule.geometry?.firstMaterial?.diffuse.contents = UIColor.orange
        capsule.geometry?.firstMaterial?.specular.contents = UIColor.white
        capsule.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(capsule)
        nodeData.append(capsule)
    }
    
    @IBAction func addCube(_ sender: Any) {
        let cube = SCNNode()
        cube.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.02)
        cube.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        cube.geometry?.firstMaterial?.specular.contents = UIColor.white
        cube.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(cube)
        nodeData.append(cube)
    }
    
    @IBAction func addtoroid(_ sender: Any) {
        let toroid = SCNNode()
        toroid.geometry = SCNTorus(ringRadius: 0.2, pipeRadius: 0.03)
        toroid.geometry?.firstMaterial?.diffuse.contents = UIColor.systemIndigo
        toroid.geometry?.firstMaterial?.specular.contents = UIColor.white
        toroid.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(toroid)
        nodeData.append(toroid)
    }
    
    
    @IBAction func addPyramid(_ sender: Any) {
        let pyramid = SCNNode()
        pyramid.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        pyramid.geometry?.firstMaterial?.diffuse.contents = UIColor.red
        pyramid.geometry?.firstMaterial?.specular.contents = UIColor.white
        pyramid.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(pyramid)
        nodeData.append(pyramid)
    }
    
    @IBAction func addSphere(_ sender: Any) {
        let sphere = SCNNode()
        sphere.geometry = SCNSphere(radius: 0.1)
        sphere.geometry?.firstMaterial?.diffuse.contents = UIColor.green
        sphere.geometry?.firstMaterial?.specular.contents = UIColor.white
        sphere.position = SCNVector3(0,0,0)
        sceneView.scene.rootNode.addChildNode(sphere)
        nodeData.append(sphere)
    }
    
    @IBAction func resetScene(_ sender: Any) {
        sceneView.session.pause()
        
        for node in nodeData {
            node.removeFromParentNode()
        }
        
        sceneView.session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
        
    }
}

