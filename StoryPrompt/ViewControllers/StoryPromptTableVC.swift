//
//  StoryPromptTableVC.swift
//  StoryPrompt
//
//  Created by VINH HOANG on 25/11/2021.
//

import UIKit

class StoryPromptTableVC: UITableViewController {

    var storyPrompts = [StoryPromptEntry]()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateStoryPromptList(notification: )), name: .StoryPromptSaved, object: nil)
       
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return storyPrompts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryPromptCell", for: indexPath)
        cell.textLabel?.text = "promt \(indexPath.row + 1)"
        cell.imageView?.image = storyPrompts[indexPath.row].image
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyPrompt = storyPrompts[indexPath.row]
        performSegue(withIdentifier: "ShowStoryPrompt", sender: storyPrompt)
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowStoryPrompt" {
            guard let storyPromptViewController = segue.destination as? StoryPromptVC,
            let storyPrompt = sender as? StoryPromptEntry
            else { return }
            storyPromptViewController.storyPrompt = storyPrompt
        }
    }

    @IBAction func saveStoryPrompt(unwindSegue: UIStoryboardSegue) {
//        guard let storyPromptVC = unwindSegue.source as? StoryPromptVC, let storyPrompt = storyPromptVC.storyPrompt else { return }
//        storyPrompts.append(storyPrompt)
//        tableView.reloadData()
        
    }
    @IBAction func cancelStoryPrompt(unwindSegue: UIStoryboardSegue) {
        
    }
    
    @objc func updateStoryPromptList(notification: Notification) {
        guard let storyPrompt = notification.object as? StoryPromptEntry else {
            return
        }
        storyPrompts.append(storyPrompt)
        tableView.reloadData()
    }
    
}
