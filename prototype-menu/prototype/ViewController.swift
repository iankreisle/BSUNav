//
//  ViewController.swift
//  prototype
//
//  Created by Kaden Baratcart on 4/13/22.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    
    var isMenuOut: Bool = false
    var isAccessible: Bool = false
    
    @IBOutlet var sceneView: ARSCNView!
    
    @IBAction func accessButton(_ sender: UIButton) {
        
    }
    @IBOutlet weak var accessLabel: UILabel!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var mapLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var notificationLabel: UILabel!
    @IBOutlet weak var helpLabel: UILabel!
    @IBAction func accessButton(sender: UIButton) {
        if(isAccessible == false) {
            isAccessible = true;
            accessLabel.isHidden = false;
            searchLabel.isHidden = false;
            mapLabel.isHidden = false;
            accountLabel.isHidden = false;
            notificationLabel.isHidden = false;
            helpLabel.isHidden = false;
        } else {
            isAccessible = false;
            accessLabel.isHidden = true;
            searchLabel.isHidden = true;
            mapLabel.isHidden = true;
            accountLabel.isHidden = true;
            notificationLabel.isHidden = true;
            helpLabel.isHidden = true;
        }
    }
    
    @IBAction func menuButton(_ sender: UIButton) {
        
    }
    @IBOutlet weak var accessButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
        
    @IBAction func menuButton(sender: UIButton){
        if (isMenuOut == false){
            isMenuOut = true;
            accessButton.isHidden = false;
            searchButton.isHidden = false;
            mapButton.isHidden = false;
            accountButton.isHidden = false;
            notificationButton.isHidden = false;
            helpButton.isHidden = false;
            
        } else {
            isMenuOut = false;
            accessButton.isHidden = true;
            searchButton.isHidden = true;
            mapButton.isHidden = true;
            accountButton.isHidden = true;
            notificationButton.isHidden = true;
            helpButton.isHidden = true;
            isAccessible = false;
            accessLabel.isHidden = true;
            searchLabel.isHidden = true;
            mapLabel.isHidden = true;
            accountLabel.isHidden = true;
            notificationLabel.isHidden = true;
            helpLabel.isHidden = true;
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        accessLabel.isHidden = true;
        searchLabel.isHidden = true;
        mapLabel.isHidden = true;
        accountLabel.isHidden = true;
        notificationLabel.isHidden = true;
        helpLabel.isHidden = true;
        accessButton.isHidden = true;
        searchButton.isHidden = true;
        mapButton.isHidden = true;
        accountButton.isHidden = true;
        notificationButton.isHidden = true;
        helpButton.isHidden = true;
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        /*/ Create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!*/
        
        // Set the scene to the view
        //sceneView.scene = scene
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
