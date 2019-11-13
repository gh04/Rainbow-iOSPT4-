//
//  ColorDetailViewController.swift
//  Rainbow
//
//  Created by Gerardo Hernandez on 11/13/19.
//  Copyright © 2019 Gerardo Hernandez. All rights reserved.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var cellColor: MyColor?
    // dependent upon the table view controllor's selected color
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    
        
    }
    
    func updateViews() {
        if let cellColor = cellColor {
            title = cellColor.name
            view.backgroundColor = cellColor.color
        }
    }

}
