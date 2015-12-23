//
//  ViewController.swift
//  Streaming Audio
//
//  Created by Ben Johnson on 3/17/15.
//  Copyright (c) 2015 Bixelcog LLC. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    var playerController: AVPlayerViewController? = nil
    
    @IBOutlet weak var URLTextField: UITextField!
    
    private struct StoryboardConstant {
        static let playerSegue = "PlayerSegue"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == StoryboardConstant.playerSegue {
            if let playerViewController = segue.destinationViewController as? AVPlayerViewController {
                playerController = playerViewController
            }
        }
    }
    @IBAction func handlePlayButtonPressed(sender: UIButton) {
        guard let text = URLTextField.text, URL = NSURL(string: text) else { return }
        playerController?.player = AVPlayer(URL: URL)
        playerController?.player?.play()
    }
}

