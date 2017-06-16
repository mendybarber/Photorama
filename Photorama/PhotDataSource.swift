//
//  PhotDataSource.swift
//  Photorama
//
//  Created by Menachem Barber on 6/15/17.
//  Copyright © 2017 Menachem Barber. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {
   
    var photos = [Photo]()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = "PhotoCollectionViewCell"
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotoCollectionViewCell
        print("cell")
        return cell
    }
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
