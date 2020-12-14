//
//  ViewController.swift
//  search_bar
//
//  Created by Kyra MS on 27/10/2020.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBarLocation: UITextField!
    @IBOutlet weak var testLoc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchBarLocation.delegate = self
        

        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: -40, left: 0, bottom: 0, right: 0)
        
        
    }
    private var locations = ["Queens Building", "ITL Building", "Library", "Octagon"]
    
    //MARK: Actions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let searchedLocation = textField
        
        if checkLocationExists(searchedLocation){
            testLoc.text = searchedLocation.text
        }
        else{
            testLoc.text = "Sorry, I could not find that location."
                
        }
        
        testLoc.sizeToFit()
        
    }
    
    func checkLocationExists(_ searchedLocation: UITextField) -> Bool{
        for location in locations{
            if searchedLocation.text?.lowercased() == location.lowercased(){
                
                return true
            }
        }
        return false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as UITableViewCell
        
        let text = locations[indexPath.row]
        cell.textLabel?.text = text
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Functions for the buttons, when pressed
    @IBAction func buttonTappedBancroft(_ sender: Any) {
        //Perform an action
        view.backgroundColor = UIColor.green
    }
    
    
    @IBAction func buttonTappedCafe(_ sender: Any) {
        view.backgroundColor = UIColor.gray
    }
    
    @IBAction func buttonTappedLibrary(_ sender: Any) {
        view.backgroundColor = UIColor.red
    }
    
    
    @IBAction func buttonTappedShop(_ sender: Any) {
        view.backgroundColor = UIColor.blue
    }
}

