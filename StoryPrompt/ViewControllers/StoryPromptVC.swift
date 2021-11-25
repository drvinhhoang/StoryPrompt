//
//  StoryPromptVC.swift
//  StoryPrompt
//
//  Created by VINH HOANG on 25/11/2021.
//

import UIKit

class StoryPromptVC: UIViewController {

    
    @IBOutlet weak var storyPromptTextView: UITextView!
    
    var storyPrompt: StoryPromptEntry?
    var isNewStoryPrompt = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        storyPromptTextView.text = storyPrompt?.description
        if isNewStoryPrompt {
            let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.leftBarButtonItem = cancelButton
            
        }
        
    }
    
    
    @objc func cancelStoryPrompt() {
    performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
    }
    
    @objc func saveStoryPrompt() {
    performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
    }
    

}
