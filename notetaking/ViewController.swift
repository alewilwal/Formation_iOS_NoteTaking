//
//  ViewController.swift
//  notetaking
//
//  Created by imac on 09/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTxtField: UITextField!
    @IBOutlet weak var myTxtView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func saveNote(){
        if myTxtField.text != nil {
            let textToAdd:String = myTxtField.text!
            let existingText:String
            if myTxtView.text != nil {
                existingText = myTxtView.text!
            } else {
                existingText = ""
            }
            if myTxtField.text != "" {
                if existingText == "" {
                    myTxtView.text = textToAdd
                    myTxtField.text = ""

                } else {
                    myTxtView.text = existingText + "\n" + textToAdd
                    myTxtField.text = ""
                    
                }
            }
            
        }
        myTxtField.resignFirstResponder()
    }
    
    
    @IBAction func openKeyboard(_ sender: AnyObject) {
        myTxtField.becomeFirstResponder()
    }



}

