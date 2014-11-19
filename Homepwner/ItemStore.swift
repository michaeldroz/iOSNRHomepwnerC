//
//  ItemStore.swift
//  Homepwner
//
//  Created by Christian Keur on 10/5/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemStore: NSObject {
    
    var allItems: [Item] = []
    
    func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
    
    func removeItem(item: Item) {
        if let index = find(allItems, item) {
            allItems.removeAtIndex(index)
        }
    }
    
    func moveItemAtIndex(fromIndex: Int, toIndex: Int) {
        if fromIndex == toIndex {
            return;
        }
        // Get pointer to object being moved so you can re-insert it
        let movedItem = allItems[fromIndex]
        // Remove item from array
        allItems.removeAtIndex(fromIndex)
        // Insert item in array at new location
        allItems.insert(movedItem, atIndex: toIndex)
    }
}