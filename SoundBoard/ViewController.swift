//
//  ViewController.swift
//  SoundBoard
//
//  Created by stephan rollins on 1/13/19.
//  Copyright © 2019 stephan rollins. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?
    
    let buttonOne: UIButton = {
       let button = UIButton(type: .system)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitle("TBA - Beatowski", for: .normal)
        button.tag = 0
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.green
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitle("Vic Grimes - Bond Villains", for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let buttonThree: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.orange
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.setTitle("stop", for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(buttonStop), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUI()
    }

    func setUI()
    {
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        view.addSubview(buttonThree)
        
        buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonOne.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonOne.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buttonOne.heightAnchor.constraint(equalToConstant: 150).isActive = true

        buttonTwo.centerXAnchor.constraint(equalTo: buttonOne.centerXAnchor).isActive = true
        buttonTwo.centerYAnchor.constraint(equalTo: buttonOne.centerYAnchor, constant: 160).isActive = true
        buttonTwo.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buttonTwo.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        buttonThree.centerXAnchor.constraint(equalTo: buttonOne.centerXAnchor).isActive = true
        buttonThree.centerYAnchor.constraint(equalTo: buttonTwo.centerYAnchor, constant: 160).isActive = true
        buttonThree.widthAnchor.constraint(equalToConstant: 300).isActive = true
        buttonThree.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    @objc func buttonTap(sender: UIButton)
    {
        do
        {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: sender.titleLabel?.text, ofType: "mp3")!))
            
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        }
        
        catch
        {
            print("error: file not found")
        }
    }
    
    @objc func buttonStop()
    {
            audioPlayer?.stop()
    }
}























