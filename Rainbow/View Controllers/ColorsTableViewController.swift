//
//  ColorsTableViewController.swift
//  Rainbow
//
//  Created by Gerardo Hernandez on 11/13/19.
//  Copyright © 2019 Gerardo Hernandez. All rights reserved.
//

import UIKit

class ColorsTableViewController: UITableViewController {
    
    var colors: [MyColor] = [MyColor(name: "Red", color: .red),
                             MyColor(name: "Orange", color: .orange),
                             MyColor(name: "Yellow", color: .yellow),
                             MyColor(name: "Blue", color: .blue),
                             MyColor(name: "Cyan", color: .cyan),
                             MyColor(name: "Purple", color: .purple)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source
//cannot create a table without these two funcs
// these are the 2 required Data Source Methods!! Must have!!
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return colors.count
    }                                                               // (section, row)
                                                                    // in this instance the max is (0, 7)
    // What data is in each cell                                    //address to section and row number (0, 1)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        //creating a dynamic color. using subscipt syntax to get the names of colors above.
        //indexPath iterates the color array for us.
        let color = colors[indexPath.row]
        cell.textLabel?.text = color.name //calling the variable color which is of type MyColor hence .name

        return cell
    }
    
    
    // MARK: - Navigation
    // using the segue 
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        if segue.identifier == "ShowColorSegue" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                //need an instance of ColorViewController to inherent the colors
            let colorDetailVC = segue.destination as? ColorDetailViewController else { return }
            
            let cellColor = colors[indexPath.row]
            //view controller that naee .instance of ColorViewController
            colorDetailVC.cellColor = cellColor
        }
        // Pass the selected object to the new view controller.
    }
    

}
