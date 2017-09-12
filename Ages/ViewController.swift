//
//  ViewController.swift
//  Ages
//
//  Created by Enrico Pineda on 9/11/17.
//  Copyright © 2017 Enrico Pineda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITextFieldDelegate {

    var person = [String]()
    var names = ["Steph", "Klay", "Kevin", "Dray", "Iggy", "Shawn", "Zaza", "Javale", "Nick", "Jordan", "Kevon", "Pat"]
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
 

    
    @IBAction func addButton(_ sender: UIButton) {
        names.append(textField.text! + "   " + (String(arc4random_uniform(UInt32(60)))) + " " + "years old")
        textField.text = " "
        tableView.reloadData()
        tableView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        
        let age = arc4random_uniform(UInt32(75))
        cell.detailTextLabel?.text = "\(age) years old"
        return cell
    }
    
}

