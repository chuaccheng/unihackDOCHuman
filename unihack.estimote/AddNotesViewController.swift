//
//  AddNotesViewController.swift
//  unihack.estimote
//
//  Created by Terra on 31/07/2016.
//  Copyright © 2016 self. All rights reserved.
//

import UIKit

class AddNotesViewController: UIViewController {

    @IBOutlet var noteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTextView.text = "    click to type"
        noteTextView.textColor = UIColor.lightGrayColor()


        
        //noteTextView.becomeFirstResponder()
        //noteTextView.selectedTextRange = noteTextView.textRangeFromPosition(noteTextView.beginningOfDocument, toPosition: noteTextView.beginningOfDocument)
        


    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == UIColor.lightGrayColor() {
            noteTextView.text = nil
            noteTextView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            noteTextView.text = "Placeholder"
            noteTextView.textColor = UIColor.lightGrayColor()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
