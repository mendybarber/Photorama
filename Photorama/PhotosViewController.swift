//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Menachem Barber on 6/8/17.
//  Copyright © 2017 Menachem Barber. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    
    
    var store: PhotoStore!
    
    let photoDataSource = PhotoDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        
        store.fetchInterestingPhotos {
            (photosResult) -> Void in
            switch photosResult {
            case let .success(photos):
                print("successfully found \(photos.count) photos")
                self.photoDataSource.photos = photos
            case let .failure(error):
                print("error finding interesting photos \(error)")
                self.photoDataSource.photos.removeAll()
            }
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
