//
//  ViewController.swift
//  Idle Timer
//
//  Created by Ruben Vitt on 07.02.20.
//  Copyright © 2020 Rubeen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var treeImageWidthContraint: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    
    var currentTree = 1
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func buttonOnClickHandler(_ sender: UIButton)
    {
        switch button.titleLabel?.text {
        case "Start":
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerHandle), userInfo: nil, repeats: true)
            button.setTitle("Stop", for: .normal)
        case "Stop":
            timer?.invalidate()
            button.setTitle("Start", for: .normal)
        default:
            break
        }
        
    }
    
    @objc func timerHandle() {
        currentTree += 1
        if let image = UIImage(named: "Tree\(currentTree)") {
            treeImageView.image = image
            treeImageWidthContraint.constant += treeImageWidthContraint.constant * 0.5
        } else {
            timer?.invalidate()
            button.setTitle("Start", for: .normal)
        }
    }
}

