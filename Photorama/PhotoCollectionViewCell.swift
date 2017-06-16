//
//  PhotoCollectionViewCell.swift
//  Photorama
//
//  Created by Menachem Barber on 6/15/17.
//  Copyright © 2017 Menachem Barber. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    
    func update(with image: UIImage?) {
        if let imageToDisplay = image {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
        } else {
            spinner.startAnimating()
            imageView.image = nil
        }
    }
    
    // new
    override func awakeFromNib() {
        super.awakeFromNib()
        
        update(with: nil)
    
        print("im from nib")
    }
    
    // reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        
        update(with: nil)
        print("im from reuse")
    }
    
    
    
    
    
    
    
    
    
}
