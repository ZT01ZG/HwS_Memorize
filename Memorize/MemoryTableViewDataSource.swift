//
//  MemoryTableViewDataSource.swift
//  Memorize
//
//  Created by Zachary Hagman on 2/12/19.
//  Copyright © 2019 Rogue Spork, LLC. All rights reserved.
//

import UIKit

class MemoryTableViewDataSource: NSObject, UITableViewDataSource {
    let cellID: String = "cellID"
    var items = [MemoryItem]()
    
    override init() {
        super.init()
        fetchLocalData()
    }
    
    private func fetchLocalData() {
        guard let url = Bundle.main.url(forResource: "MemoryItems", withExtension: "json") else {
            fatalError("Unable to locate JSON file...")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Unable to load JSON file...")
        }
        
        let decoder = JSONDecoder()
        
        guard let savedItems = try? decoder.decode([MemoryItem].self, from: data) else {
            fatalError("Unable to decode JSON file...")
        }
        
        items = savedItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func item(at index: Int) -> MemoryItem {
        return items[index]
    }
}
