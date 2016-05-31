//
//  ViewController.swift
//  Silly Song Final
//
//  Created by modelf on 5/30/16.
//  Copyright © 2016 modelf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(sender: AnyObject) {
        nameField.text = ""
        lyricsView.text = ""
    }
    @IBAction func displayLyrics(sender: AnyObject) {
        if nameField.text != "" {lyricsView.text = lyricsForName(nameField.text!, template: bananaFanaTemplate)}
        else { lyricsView.text = "tesssst" }
    }

}

func shortNameFromName(fullName: String) -> String {
    let lowercaseName = fullName.lowercaseString
    let vowels = NSCharacterSet(charactersInString: "aeiou")
    
    if let newVar = lowercaseName.rangeOfCharacterFromSet(vowels) {
        return lowercaseName.substringFromIndex(newVar.startIndex)
    }
    
    
    return lowercaseName
}

func lyricsForName (name: String, template: String) -> String {
    let shortName = shortNameFromName(name)
    
    let lyrics = template
        .stringByReplacingOccurrencesOfString("<FULL_NAME>", withString: name)
        .stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: shortName)
    
    return lyrics
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joinWithSeparator("\n")

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
