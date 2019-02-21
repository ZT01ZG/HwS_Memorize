//
//  MemorizeTableViewController.swift
//  Memorize
//
//  Created by Zachary Hagman on 2/12/19.
//  Copyright © 2019 Rogue Spork, LLC. All rights reserved.
//

import UIKit

class MemorizeTableViewController: UITableViewController {
    
    let memoryDataSource = MemoryTableViewDataSource()
    
    let cellID: String = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = memoryDataSource
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "MemorizeViewController") as? MemorizeViewController else {
            fatalError("Unable to instantiate memory view controller.")
        }
        
        let item = memoryDataSource.item(at: indexPath.row)
        vc.memoryItem = item
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
