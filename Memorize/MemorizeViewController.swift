//
//  MemorizeViewController.swift
//  Memorize
//
//  Created by Zachary Hagman on 2/12/19.
//  Copyright © 2019 Rogue Spork, LLC. All rights reserved.
//

import UIKit

class MemorizeViewController: UIViewController {
    
    var memoryItem: MemoryItem!
    
    let titleOfSpeech: UILabel = {
       let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "AvenirNext-Medium", size: 20)
        lbl.backgroundColor = UIColor.lightGray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let textOfSpeech: UITextView = {
       let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.isEditable = false
        txt.isSelectable = false
        txt.isScrollEnabled = true
        txt.textColor = UIColor.black
        txt.font = UIFont.boldSystemFont(ofSize: 30)
        return txt
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGray
        setupDisplay()
        titleOfSpeech.text = memoryItem.title
        textOfSpeech.text = memoryItem.text
    }
    
    private func setupDisplay() {
        view.addSubview(titleOfSpeech)
        view.addSubview(textOfSpeech)
        NSLayoutConstraint.activate([
            titleOfSpeech.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleOfSpeech.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            titleOfSpeech.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 5),
            
            textOfSpeech.topAnchor.constraint(equalTo: titleOfSpeech.bottomAnchor, constant: 10),
            textOfSpeech.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            textOfSpeech.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 5),
            textOfSpeech.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10)
            ])
    }
}
