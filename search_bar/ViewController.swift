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
        searchBarLocation.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)),
                                  for: .editingChanged)
        //tableView.delegate = self
        //tableView.dataSource = self
        //tableView.contentInset = UIEdgeInsets(top: -40, left: 0, bottom: 0, right: 0)
        
        
    }
    
    // Search Bar Functions
    private var locations = ["Queens Building", "ITL Building", "Library", "Octagon"]
    private var results = ["Queens Building", "ITL Building", "Library", "Octagon"]
    private var selectedLoc = ""
    
    //MARK: Actions
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    // Deals with user fully inputting a locations name instead of click the corresponding cell in tableView
    func textFieldDidEndEditing(_ textField: UITextField) {
        let searchedLocation = textField
        
        if checkLocationExists(searchedLocation){
            searchBarLocation.text = searchedLocation.text
        }
        else{
            searchBarLocation.text = "Sorry, I could not find that location."
                
        }
        
        testLoc.sizeToFit()
        
    }
    
    // Checks the firt letter inputted by user, checks upon array list to see if any locations start with that letter. It then auto-completes and displays that location within a tableView
    @objc func textFieldDidChange(_ textField: UITextField) {
        let inputSoFar = textField.text!
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: -40, left: 0, bottom: 0, right: 0)
        
        
        if(inputSoFar == ""){
            results = [""]
            self.tableView.reloadData()
            return
        }
        
        if(inputSoFar[inputSoFar.startIndex].lowercased() == "q")
        {
            results = [locations[0]]
            self.tableView.reloadData()
        }
        
        else if(inputSoFar[inputSoFar.startIndex].lowercased() == "i")
        {
            results = [locations[1]]
            self.tableView.reloadData()
        }
        
        else if(inputSoFar[inputSoFar.startIndex].lowercased() == "l")
        {
            results = [locations[2]]
            self.tableView.reloadData()
        }
        else if(inputSoFar[inputSoFar.startIndex].lowercased() == "o")
        {
            results = [locations[3]]
            self.tableView.reloadData()
            
        }
        else{
            results = ["Does Not Exist"]
            self.tableView.reloadData()
            
        }
        
    }
    
    // Checks to see if location exists within locations array
    func checkLocationExists(_ searchedLocation: UITextField) -> Bool{
        for location in locations{
            if searchedLocation.text?.lowercased() == location.lowercased(){
                
                return true
            }
        }
        return false
    }
    
    
    // Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count;
    }
    
    // Populates the tableView with data - cells.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier", for: indexPath) as UITableViewCell
        
        let text = results[indexPath.row]
        cell.textLabel?.text = text
        
        return cell
    }
    
    // Each cell will only have one section
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Stores selected location - from tableView - within selectedLoc variable
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let selectedCell = self.tableView.cellForRow(at: indexPath as IndexPath)
        selectedLoc = (selectedCell?.textLabel?.text)!
        searchBarLocation.text = selectedLoc
        
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

