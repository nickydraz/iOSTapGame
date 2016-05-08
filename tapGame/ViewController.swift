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
    
    var counter: Int = 0
    var colorCounter: Int = 0
    var fakeCounter: Int = 0
    
    //Previous colors variables
    var prevR = [CGFloat]()
    var prevG = [CGFloat]()
    var prevB = [CGFloat]()
    
    
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
        
        //Log to console
        print("The user has pressed the button")
                
        //Change the color to a random UIColor
        primaryViewOutlet.backgroundColor = randomBackgroundColor()
        
        //Update the counters
        counter += 1
        colorCounter = 0
        fakeCounter = counter
        
        print("Counter is: " + String(counter))
        
        //Add some fun for the user
        //If counter reaches 50 or 100, 
        //increase the font size of the counter
        if counter == 50
        {
            counterOutlet.font = counterOutlet.font.fontWithSize(26)
            
            //Log to console
            print("Changed font size to 26")
        }
        
        if counter == 100
        {
            counterOutlet.font = counterOutlet.font.fontWithSize(32)
            
            //Log to console
            print ("Changed font size to 32")
        }
        
        //Set the counter text
        counterOutlet.text = String(counter)
        
    }
    
    //Get Random color for background
    func randomBackgroundColor() -> UIColor
    {
        //Get the new colors
        let r = CGFloat.randomNumberGenerator()
        let g = CGFloat.randomNumberGenerator()
        let b = CGFloat.randomNumberGenerator()
        
        //Log to console
        var colorString = String("The random color is: (");
        colorString += String(r);
        colorString += String(" , ")
        colorString += String(g)
        colorString += String(" , ")
        colorString += String(b)
        colorString += String(" )")
        
        print(colorString);
        
        //Save for previous color
        prevR.append(r)
        prevG.append(g)
        prevB.append(b)
        
        //Set the background
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    //Method for changing to the previous color
    //if the user clicks anywhere besides the button
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchLocation = touch!.locationInView(self.view)
        
        //Log to console
        print("User has touched the background")
        
        if touchLocation.y >= changeColorButton.frame.origin.y
        {
            //Log to console
            print("User's touch is within the button")
            //do nothing
            return
        }
        else if counter == 0 || fakeCounter == 0
        {
            //Log to console
            print("Counter is zero, doing nothing")
            //do nothing
            return
        }
        else if (fakeCounter - 1) - (colorCounter + 1) < 0
        {
            //Log to console
            print("Previous color index would be out of range")
            //do nothing
            return
        }
        else
        {
            //Update the counters
            colorCounter += 1
            fakeCounter -= 1
            
            //Log to console
            print("Setting background color to previous color\n")
            //Log to console
            var colorString = String("The previous color is: (");
            colorString += String(prevR[fakeCounter - colorCounter]);
            colorString += String(" , ")
            colorString += String(prevG[fakeCounter - colorCounter])
            colorString += String(" , ")
            colorString += String(prevB[fakeCounter - colorCounter])
            colorString += String(" )")
            
            print(colorString);
            
            print("Changing to color at index: " + String(fakeCounter - colorCounter))
            
            //Change background to previous color
            /*
             Still not functioning properly. 
             the if out of range check above breaks it,
             not allowing some of the colors to be retrieved.
             Closer, but still not fully done yet.
             */
            primaryViewOutlet.backgroundColor = UIColor(red: prevR[fakeCounter - colorCounter], green: prevG[fakeCounter - colorCounter], blue: prevB[fakeCounter - colorCounter], alpha: 1.0)
        }
    }
    
   
}

//Random number generator
extension CGFloat {
    static func randomNumberGenerator() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

