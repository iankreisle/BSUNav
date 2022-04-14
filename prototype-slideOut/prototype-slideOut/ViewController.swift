//
//  ViewController.swift
//  prototype-slideOut
//
//  Created by Kaden Baratcart on 4/13/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var menuLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var buttonLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var buttonTrailingConstraint: NSLayoutConstraint!
    @IBOutlet var sceneView: ARSCNView!
    @IBAction func slideOutButton(_ sender: UIButton) {
     
        if(menuLeadingConstraint.constant == 77){
            menuLeadingConstraint.constant = 415;
            buttonLeadingConstraint.constant = 395;
            buttonTrailingConstraint.constant = 9;
        }else{
            menuLeadingConstraint.constant = 77;
            buttonLeadingConstraint.constant = 58;
            buttonLeadingConstraint.constant = 57;
            buttonTrailingConstraint.constant = 347;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
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
