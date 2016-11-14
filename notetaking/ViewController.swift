//
//  ViewController.swift
//  notetaking
//
//  Created by imac on 09/11/2016.
//  Copyright © 2016 imac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myTxtField: UITextField!
    @IBOutlet weak var myTxtView: UITextView!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myLabel: UILabel!
    let NOTES_USER_DEFAULTS_KEY:String = "NOTES_DATA"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadNotes()
        updateMySwitchState()
        myTxtField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTxtField.resignFirstResponder()
        return false
    }
    
    func saveNotes() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(self.myTxtView.text, forKey: NOTES_USER_DEFAULTS_KEY)
        userDefaults.synchronize()
    }
    
    func loadNotes(){
        let userDefaults = UserDefaults.standard
        let notesData:String? = userDefaults.object(forKey: NOTES_USER_DEFAULTS_KEY) as? String
        if notesData != nil {
            self.myTxtView.text = notesData!
        }
    }
    
    func updateMySwitchState() {
        if mySwitch.isOn{
            myTxtField.autocorrectionType = UITextAutocorrectionType.yes
            myLabel.text = "Autocorrect is ON"
        }
        else{
            myTxtField.autocorrectionType = UITextAutocorrectionType.no
            myLabel.text = "Autocorrect is OFF"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addNoteButtonTouched() {
        let textToAdd:String? = self.myTxtField.text!
        if textToAdd != nil {
            var existingText:String = self.myTxtView.text
            if existingText.characters.count > 0 {
                existingText = existingText + "\n"
            }
            existingText = existingText + textToAdd!
            self.myTxtView.text = existingText
            saveNotes()
            self.myTxtField.text = ""
        }
        myTxtField.resignFirstResponder()
    }
    
    @IBAction func openKeyboard() {
        myTxtField.becomeFirstResponder()
    }
    
    
    @IBAction func mySwitchTapped() {
        updateMySwitchState()
    }
    
    
    
}

