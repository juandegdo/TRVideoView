//
//  ViewController.swift
//  VideoTest
//
//  Created by Tim Roesner on 9/20/17.
//  Copyright © 2017 Tim Roesner. All rights reserved.
//

import UIKit
import TRVideoView

class ViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var txtView: UITextView!
    
    var videoViewCache = [String : TRVideoView]()
    var video: TRVideoView!

    override func viewDidLoad() {
        super.viewDidLoad()
        txtView.text = "https://www.youtube.com/watch?v=QPAloq5MCUA"
        loadVideoView()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        loadVideoView()
    }
    
    func loadVideoView() {
        video = TRVideoView(text: txtView.text)
        video.removeFromSuperview()
        
        if(video.containsURLs()){
            
            // Check if we loaded this link (text) before
            if let storedVideoView = videoViewCache[txtView.text] {
                self.view.addSubview(storedVideoView)
            
            // Ideally you have a unqiue id associated where you place your video (i.e. message or post id)
            } else {
                video.frame = CGRect(x: 16, y: 225, width: 340, height: 180)
                videoViewCache[txtView.text] = video
                self.view.addSubview(video)
            }
        } else {
            print("No url found")
        }
        
        // This return the original text without the URLs
        print(video.textWithoutURLs())
    }
    
    @IBAction func changeFrame() {
        video.frame = CGRect(x: 16, y: 225, width: 170, height: 90)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

