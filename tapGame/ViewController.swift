//
//  ViewController.swift
//  tapGame
//
//  Created by Nicholas Drazenovic on 5/4/16.
//  Copyright © 2016 Nicholas Drazenovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var primaryViewOutlet: UIView!
    @IBOutlet weak var changeColorButton: UIButton!
    @IBOutlet weak var counterOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Button listener
    @IBAction func changeColorButtonPressed(sender: UIButton) -> Void {
        
        print("The user has pressed the button")
        
        //Change the color to a random UIColor
        primaryViewOutlet.backgroundColor = randomBackgroundColor()
        
        //Update the counter
        var counter:Int = Int(counterOutlet.text ?? "0")!
        counter += 1
        
        //Add some fun for the user
        if counter == 50
        {
            counterOutlet.font = counterOutlet.font.fontWithSize(26)
        }
        if counter == 100
        {
            counterOutlet.font = counterOutlet.font.fontWithSize(32)
        }
        counterOutlet.text = String(counter)
        
    }
    
    //Get Random color for background
    func randomBackgroundColor() -> UIColor
    {
        //Get the new colors
        let r = CGFloat.randomNumberGenerator()
        let g = CGFloat.randomNumberGenerator()
        let b = CGFloat.randomNumberGenerator()
        
        //Set the background
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
   
}

//Random number generator
extension CGFloat {
    static func randomNumberGenerator() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

