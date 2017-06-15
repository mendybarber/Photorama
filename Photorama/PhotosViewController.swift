//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Menachem Barber on 6/8/17.
//  Copyright © 2017 Menachem Barber. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    
    var store: PhotoStore!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterestingPhotos {
            (photosResult) -> Void in
            switch photosResult {
            case let .success(photos):
                print("successfully found \(photos.count) photos")
                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }
            case let .failure(error):
                print("error finding interesting photos \(error)")
            }
        }
        
        
    }
    
    func updateImageView(for photo: Photo) {
        store.fetchImage(for: photo) {
            (imageResult) -> Void in
            
            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("error downloading image: \(error)")
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
