//
//  ViewController.swift
//  Project2
//
//  Created by Alan Pham on 8/6/16.
//  Copyright © 2016 Alan Pham. All rights reserved.
//

import UIKit
import GameplayKit


class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        // CALayer is under every UIButton
        // Adds border.
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        // Changes border color. CGColor is a part of CALayer, but UIColor is not. UIColor can convert to CGColor easily
        // since borderColor does not take a UIColor.
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // Pass nil because there is no UIAlertAction for this.
        askQuestion()
    }
    
    //Sets default action to nil. no need for askQuestion(nil).
    func askQuestion(action: UIAlertAction! = nil){
        
        // Randomizes order of countries.
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        title = countries[correctAnswer].uppercaseString
        
    }
    /*
     * Check whether the answer was correct.
     * Adjust the player's score up or down.
     * Show a message telling them what their new score is.
     */
    
    @IBAction func buttonTapped(sender: UIButton) {
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        }
        else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        presentViewController(ac, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

