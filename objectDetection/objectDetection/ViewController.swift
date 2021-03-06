//
//  ViewController.swift
//  objectDetection
//
//  Created by Kaden Baratcart on 4/18/22.
//

import UIKit
import SceneKit
import ARKit


class ViewController: UIViewController, ARSCNViewDelegate {
    //video variables
    var videoNode: SKVideoNode!
    var videoPlayer: AVPlayer!
    
    var isMenuOut: Bool = false
    var isAccessible: Bool = false
    
    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var accessLabelOutlet: UILabel!
    @IBOutlet weak var searchLabelOutlet: UILabel!
    @IBOutlet weak var mapLabelOutlet: UILabel!
    @IBOutlet weak var accountLabelOutlet: UILabel!
    @IBOutlet weak var notificationLabelOutlet: UILabel!
    @IBOutlet weak var helpLabelOutlet: UILabel!
    
    @IBOutlet weak var menuButtonOutlet: UIButton!
    @IBOutlet weak var accountButtonOutlet: UIButton!
    @IBOutlet weak var notificationButtonOutlet: UIButton!
    @IBOutlet weak var helpButtonOutlet: UIButton!
    @IBOutlet weak var accessButtonOutlet: UIButton!
    @IBOutlet weak var searchButtonOutlet: UIButton!
    @IBOutlet weak var mapButtonOutlet: UIButton!
    @IBAction func accessButtonPressed(_ sender: Any) {
        if(isAccessible == false){
            isAccessible = true;
            accessLabelOutlet.isHidden = false;
            searchLabelOutlet.isHidden = false;
            mapLabelOutlet.isHidden = false;
            accountLabelOutlet.isHidden = false;
            notificationLabelOutlet.isHidden = false;
            helpLabelOutlet.isHidden = false;
            
        } else {
            isAccessible = false;
            accessLabelOutlet.isHidden = true;
            searchLabelOutlet.isHidden = true;
            mapLabelOutlet.isHidden = true;
            accountLabelOutlet.isHidden = true;
            notificationLabelOutlet.isHidden = true;
            helpLabelOutlet.isHidden = true;
        }
    }
    @IBAction func menuButtonPressed(_ sender: Any) {
        if(isMenuOut == false){
            isMenuOut = true;
            accessButtonOutlet.isHidden = false;
            searchButtonOutlet.isHidden = false;
            mapButtonOutlet.isHidden = false;
            accountButtonOutlet.isHidden = false;
            notificationButtonOutlet.isHidden = false;
            helpButtonOutlet.isHidden = false;
        } else {
            isMenuOut = false;
            accessButtonOutlet.isHidden = true;
            searchButtonOutlet.isHidden = true;
            mapButtonOutlet.isHidden = true;
            accountButtonOutlet.isHidden = true;
            notificationButtonOutlet.isHidden = true;
            helpButtonOutlet.isHidden = true;
            accessLabelOutlet.isHidden = true;
            searchLabelOutlet.isHidden = true;
            mapLabelOutlet.isHidden = true;
            accountLabelOutlet.isHidden = true;
            notificationLabelOutlet.isHidden = true;
            helpLabelOutlet.isHidden = true;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //buttons
        accessButtonOutlet.isHidden = true;
        searchButtonOutlet.isHidden = true;
        mapButtonOutlet.isHidden = true;
        accountButtonOutlet.isHidden = true;
        notificationButtonOutlet.isHidden = true;
        helpButtonOutlet.isHidden = true;
        //Labels
        accessLabelOutlet.isHidden = true;
        searchLabelOutlet.isHidden = true;
        mapLabelOutlet.isHidden = true;
        accountLabelOutlet.isHidden = true;
        notificationLabelOutlet.isHidden = true;
        helpLabelOutlet.isHidden = true;
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        //let configuration = ARImageTrackingConfiguration()
        
        //Image Detection
        
       // guard let arImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else { return }
        //configuration.detectionImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main)!
        //configuration.trackingImages = arImages
        //configuration.detectionImages = arImages
        configuration.maximumNumberOfTrackedImages = 1 // up to 4
        
        //Object Detection
       configuration.detectionObjects = ARReferenceObject.referenceObjects(inGroupNamed: "productResources", bundle: Bundle.main)!
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
//    func renderer(_ renderer: SCNSceneRenderer, didAdd IMGnode: SCNNode, for IMGanchor: ARAnchor) {
//        //image detection - play video
//        guard IMGanchor is ARImageAnchor else { return }
//        guard let referenceImage = ((IMGanchor as? ARImageAnchor)?.referenceImage) else { return }
//        guard let container = sceneView.scene.rootNode.childNode(withName: "container", recursively: false) else { return }
//
//        container.removeFromParentNode()
//        IMGnode.addChildNode(container)
//        container.isHidden = false
//
//        guard let videoURL = Bundle.main.url(forResource: "video", withExtension: ".mp4") else { return }
//        videoPlayer = AVPlayer(url: videoURL)
//
//        let videoScene = SKScene(size: CGSize(width: 720.0, height: 1280.0))
//        videoNode = SKVideoNode(avPlayer: videoPlayer)
//        videoNode.position = CGPoint(x: videoScene.size.width/2, y: videoScene.size.height/2)
//        videoNode.size = videoScene.size
//        videoNode.yScale = -1
//        videoNode.play()
//        videoScene.addChild(videoNode)
//
//        guard let video = container.childNode(withName: "video", recursively: true) else { return }
//        video.geometry?.firstMaterial?.diffuse.contents = videoScene
//
//        video.scale = SCNVector3(x: Float(referenceImage.physicalSize.width), y: Float(referenceImage.physicalSize.height), z: 1.0)
//        video.position = IMGnode.position
//        guard let videoContainer = container.childNode(withName: "videoContainer", recursively: false) else { return }
//
//        videoContainer.runAction(SCNAction.sequence([SCNAction.wait(duration: 1.0), SCNAction.scale(to: 1.0, duration: 0.5)]))
//
//    }
//    func renderer(_ renderer: SCNSceneRenderer, didUpdate IMGnode: SCNNode, for IMGanchor: ARAnchor) {
//        guard let imageAnchor = (IMGanchor as? ARImageAnchor) else { return }
//
//        if imageAnchor.isTracked {
//            videoNode.play()
//        } else {
//            videoNode.pause()
//        }
//    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
        //object detection

        //cast the found anchor as object anchor
        guard let objectAnchor = anchor as? ARObjectAnchor else {return nil}
        //get the name of the object from the anchor
        guard let objectName = objectAnchor.name else {return nil}

        //check to see if the name of the detected object is the one you want

        if objectName == "gimmHallway"{
            let plane = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 0.8), height: CGFloat(objectAnchor.referenceObject.extent.y * 0.5))
            plane.cornerRadius = plane.width / 8
            let spriteKitScene = SKScene(fileNamed: "gimmHallway")
            plane.firstMaterial?.diffuse.contents = spriteKitScene
            plane.firstMaterial?.isDoubleSided = true
            plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3Make(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)

            //rotate node
            let lookAtConstraint = SCNBillboardConstraint()
            node.constraints = [lookAtConstraint]

            node.addChildNode(planeNode)
        }
        if objectName == "Starbux_Sign"{
            let plane = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 0.8), height: CGFloat(objectAnchor.referenceObject.extent.y * 0.5))
            plane.cornerRadius = plane.width / 8
            let spriteKitScene = SKScene(fileNamed: "starbucks")
            plane.firstMaterial?.diffuse.contents = spriteKitScene
            plane.firstMaterial?.isDoubleSided = true
            plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3Make(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)

            //rotate node
            let lookAtConstraint = SCNBillboardConstraint()
            node.constraints = [lookAtConstraint]

            node.addChildNode(planeNode)
        }
        if objectName == "Enterance_B"{
            let plane = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 0.8), height: CGFloat(objectAnchor.referenceObject.extent.y * 0.5))
            plane.cornerRadius = plane.width / 8
            let spriteKitScene = SKScene(fileNamed: "enterance_B")
            plane.firstMaterial?.diffuse.contents = spriteKitScene
            plane.firstMaterial?.isDoubleSided = true
            plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3Make(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)

            //rotate node
            let lookAtConstraint = SCNBillboardConstraint()
            node.constraints = [lookAtConstraint]

            node.addChildNode(planeNode)
        }
        if objectName == "Transportation_Sign"{
            let plane = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 0.8), height: CGFloat(objectAnchor.referenceObject.extent.y * 0.5))
            plane.cornerRadius = plane.width / 8
            let spriteKitScene = SKScene(fileNamed: "transportationSign")
            plane.firstMaterial?.diffuse.contents = spriteKitScene
            plane.firstMaterial?.isDoubleSided = true
            plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3Make(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)

            //rotate node
            let lookAtConstraint = SCNBillboardConstraint()
            node.constraints = [lookAtConstraint]

            node.addChildNode(planeNode)
        }
        if objectName == "Entrance_Directory"{
            let plane = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 0.8), height: CGFloat(objectAnchor.referenceObject.extent.y * 0.5))
            plane.cornerRadius = plane.width / 8
            let spriteKitScene = SKScene(fileNamed: "directoryEnterance")
            plane.firstMaterial?.diffuse.contents = spriteKitScene
            plane.firstMaterial?.isDoubleSided = true
            plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3Make(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)

            //rotate node
            let lookAtConstraint = SCNBillboardConstraint()
            node.constraints = [lookAtConstraint]

            node.addChildNode(planeNode)
        }
        if objectName == "Information_Sign"{
            let plane = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 0.8), height: CGFloat(objectAnchor.referenceObject.extent.y * 0.5))
            plane.cornerRadius = plane.width / 8
            let spriteKitScene = SKScene(fileNamed: "informationSign")
            plane.firstMaterial?.diffuse.contents = spriteKitScene
            plane.firstMaterial?.isDoubleSided = true
            plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3Make(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)

            //rotate node
            let lookAtConstraint = SCNBillboardConstraint()
            node.constraints = [lookAtConstraint]

            node.addChildNode(planeNode)
        }
        if objectName == "Cafe_Hall"{
            let plane = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 0.8), height: CGFloat(objectAnchor.referenceObject.extent.y * 0.5))

            plane.cornerRadius = plane.width / 8

            let spriteKitScene = SKScene(fileNamed: "cafe_hall")

            plane.firstMaterial?.diffuse.contents = spriteKitScene
            plane.firstMaterial?.isDoubleSided = true
            plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3Make(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)

            //rotate node
            let lookAtConstraint = SCNBillboardConstraint()
            node.constraints = [lookAtConstraint]

            //adds the spriteNode to the object
            node.addChildNode(planeNode)
        }
        if objectName == "Cafe_Sign"{
            let plane = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 0.8), height: CGFloat(objectAnchor.referenceObject.extent.y * 0.5))

            plane.cornerRadius = plane.width / 8

            let spriteKitScene = SKScene(fileNamed: "cafe_sign")

            plane.firstMaterial?.diffuse.contents = spriteKitScene
            plane.firstMaterial?.isDoubleSided = true
            plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3Make(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)

            //rotate node
            let lookAtConstraint = SCNBillboardConstraint()
            node.constraints = [lookAtConstraint]

            //adds the spriteNode to the object
            node.addChildNode(planeNode)
        }
        if objectName == "Plant_Pot"{
            let plane = SCNPlane(width: CGFloat(objectAnchor.referenceObject.extent.x * 0.8), height: CGFloat(objectAnchor.referenceObject.extent.y * 0.5))

            plane.cornerRadius = plane.width / 8

            let spriteKitScene = SKScene(fileNamed: "plant")

            plane.firstMaterial?.diffuse.contents = spriteKitScene
            plane.firstMaterial?.isDoubleSided = true
            plane.firstMaterial?.diffuse.contentsTransform = SCNMatrix4Translate(SCNMatrix4MakeScale(1, -1, 1), 0, 1, 0)
            let planeNode = SCNNode(geometry: plane)
            planeNode.position = SCNVector3Make(objectAnchor.referenceObject.center.x, objectAnchor.referenceObject.center.y + 0.35, objectAnchor.referenceObject.center.z)

            //rotate node
            let lookAtConstraint = SCNBillboardConstraint()
            node.constraints = [lookAtConstraint]

            //adds the spriteNode to the object
            node.addChildNode(planeNode)
        }
        return node
    }
    
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
