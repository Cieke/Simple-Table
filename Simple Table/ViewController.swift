//
//  ViewController.swift
//  Simple Table
//
//  Created by Tywin Lannister on 03/10/16.
//  Copyright © 2016 Training. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var listData : [String]!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        listData = ["Mac Plus", "Bondi iMac", "iMac Flat Panel", "Mac Pro", "Mac Mini", "iMac Aluminium", "PowerBook 100", "PowerBook Duo", "PowerBook G4", "White MacBook", "MacBook 13" , "MacBook Air" ]
        
    }

    
    func tableView(_ tableView : UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
   
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableIdentifier", for: indexPath as IndexPath)
        cell.textLabel?.text = listData[indexPath.row]
        
        let imageName = listData[indexPath.row] as String
        let fullImageName = imageName + ".png"
        let image = UIImage(named: fullImageName)
        cell.imageView?.image = image
        if indexPath.row < 6 {
            cell.detailTextLabel?.text = "Desktop"
        }
        else{
            cell.detailTextLabel?.text = "Portable"
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let row = indexPath.row
        if row < 6 {
        return nil
        }
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let rowValue = listData[row]
        let message = "You selected \(rowValue)"
        
        let myAlert = UIAlertController(title: "Row Selected", message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            print("OK Pressed")
        }
        
        myAlert.addAction(ok)
        
        
        
        present(myAlert, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

