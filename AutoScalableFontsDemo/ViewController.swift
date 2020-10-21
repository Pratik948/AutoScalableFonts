//
//  ViewController.swift
//  AutoScalableFontsDemo
//
//  Created by Pratik Jamariya on 15/10/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var helloLabels: [UILabel]!
    @IBOutlet var sizeLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for helloLabel in helloLabels {
            helloLabel.fontUpdateHandler = { originalSize, preferredSize, multiplier in
                print("For original size: \(originalSize) set preferred size: \(preferredSize), multiplier: \(multiplier)")
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if helloLabels.count == sizeLabels.count {
            for (index, helloLabel) in helloLabels.enumerated() {
                sizeLabels[index].text = String(format: "%.2f", helloLabel.font.pointSize)
            }
        } else {
            fatalError("Please connect all the outlets.")
        }
    }
}
