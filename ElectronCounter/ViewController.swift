//
//  ViewController.swift
//  ElectronCounter
//
//  Created by Sanjarbek Abdurayimov on 26/06/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var plusBtn: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var minusBtn: UIButton!
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func plusPressed(_ sender: Any) {
        if count == 33 {
            let AudioURL = NSURL(fileURLWithPath: Bundle.main.path(forResource: "note", ofType: "mp3")!)
            var AudioPlayer = AVAudioPlayer()

            do {
                AudioPlayer = try AVAudioPlayer(contentsOf: AudioURL as URL)
            } catch _ as NSError {
                fatalError()
            }

            AudioPlayer.play()
            count = 0
            countLabel.text = "\(count)"
        } else {
            count += 1
            countLabel.text = "\(count)"
        }
        
    }
    
    
    @IBAction func minusPressed(_ sender: Any) {
        count -= 1
        if count >= 0 {
            countLabel.text = "\(count)"
        } else {
            count = 0
        }
    }
  
    
    @IBAction func resetPressed(_ sender: Any) {
        count = 0
        countLabel.text = "\(count)"
    }
    
    
}

