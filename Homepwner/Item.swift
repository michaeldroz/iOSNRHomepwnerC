//
//  Item.swift
//  Hypnosister
//
//  Created by Christian Keur on 7/28/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

import UIKit

class Item: NSObject {
    
    var name: String
    var valueInDollars: Int?
    var serialNumber: String?
    let dateCreated: NSDate
    
    convenience init(random: Bool = false) {
        if random {
            let randomAdjectiveList = ["Fluffy", "Rusty", "Shiny"]
            let randomNounList = ["Bear", "Spork", "Mac"]

            let adjectiveIndex = Int(arc4random_uniform(UInt32(randomAdjectiveList.count)))
            let nounIndex = Int(arc4random_uniform(UInt32(randomNounList.count)))
            let name = "\(randomAdjectiveList[adjectiveIndex]) \(randomNounList[nounIndex])"
            
            let value = Int(arc4random_uniform(100))
            
            var serialNumber = ""
            
            // Add three letters
            let letters = ["N", "E", "R", "D"]
            for _ in 0..<4 {
                let randomIndex = Int(arc4random_uniform(UInt32(letters.count)))
                serialNumber = serialNumber + letters[randomIndex]
            }
            
            // And six numbers
            for _ in 0..<7 {
                serialNumber = serialNumber + "\(arc4random_uniform(10))"
            }
            self.init(name: name, valueInDollars: value, serialNumber: serialNumber)
        }
        else {
            self.init(name: "", valueInDollars: nil, serialNumber: nil)
        }
    }
    
    init(name: String, valueInDollars: Int?, serialNumber: String?) {
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        dateCreated = NSDate()
        
        super.init()
    }
}
