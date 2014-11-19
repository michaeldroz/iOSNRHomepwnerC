//
//  ImageStore.swift
//
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ImageStore: NSObject {
    
    var imageDictionary = [String:UIImage]()
    
    func imagePathForKey(key: String) -> String {
        let documentsDirectories =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = documentsDirectories.first as String
        
        return documentDirectory.stringByAppendingPathComponent(key)
    }
    
    func setImage(image: UIImage, forKey key: String) {
        imageDictionary[key] = image
    }
    
    func imageForKey(key: String) -> UIImage? {
        return imageDictionary[key]
    }
    
    func deleteImageForKey(key: String) {
        imageDictionary.removeValueForKey(key)
    }
}
