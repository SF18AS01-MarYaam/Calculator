//
//  ViewController.swift
//  Calculator
//
//  Created by Mariam Camara on 1/29/19.
//  Copyright © 2019 Mariam Camara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var numberOnScreen: Double  = 0;
    var previousNumber: Double  = 0;
    var performingMath: Bool = false;
   // var decimalPlaceWasUsed: Bool = false;
    var operation = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func numbers(_ sender: UIButton) {
        if performingMath {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false;
            
        }
        else {
            label.text! += String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 18 {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 {
                label.text = String(previousNumber * -1)
            }
            if sender.tag == 13 {
                label.text = String(previousNumber/100)
            }
            
            operation = sender.tag;
            performingMath = true;
        }
        else if sender.tag == 18 {
            if operation == 14 {
                label.text = String(previousNumber/numberOnScreen)
            }
            else if operation == 15 {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 16 {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 17 {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        
        else if sender.tag == 11 {
            label.text = "";
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//work on decimal point function
/* else if sender.tag == 19 {

label.text = String(previousNumber) + ".";

}*/
