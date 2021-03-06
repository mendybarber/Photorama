//
//  PhotoStore.swift
//  Photorama
//
//  Created by Menachem Barber on 6/8/17.
//  Copyright © 2017 Menachem Barber. All rights reserved.
//

import UIKit

enum ImageResult {
    case success(UIImage)
    case failure(Error)
}

enum PhotoError: Error {
    case imageCreationError
}


enum PhotosResult {
    case success([Photo])
    case failure(Error)
}

class PhotoStore {
  
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func fetchInterestingPhotos(completion: @escaping (PhotosResult) -> Void ) {
        let url = FlickerAPI.interestingPhotosURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            let result = self.prossessPhotoRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
    }
        task.resume()
    }
    func fetchImage(for photo: Photo, completion: @escaping (ImageResult) -> Void) {
        let photoURL = photo.remoteURL
        let request = URLRequest(url: photoURL)
        
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            if error == nil && data != nil {
                if let resp = response as? HTTPURLResponse {
                    let status = resp.statusCode
                    print(status)
                    let header = resp.allHeaderFields
                    print(header)
//                    if status == 200 {
//                        let content = String(data: data!, encoding: String.Encoding.ascii)
//                        print(content)
//                    } else {
//                        print("Error")
//                    }
                }
                
            }
            let result = self.processImageRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
    private func processImageRequest(data: Data?, error: Error?) -> ImageResult {
        guard
        let imageData = data,
            let image = UIImage(data: imageData) else {
                if data == nil {
                    return .failure(error!)
                } else {
                    return .failure(PhotoError.imageCreationError)
                }
        }
        return .success(image)
    }
    
    
  private func prossessPhotoRequest(data: Data?, error: Error?) -> PhotosResult {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return FlickerAPI.photos(fromJSON: jsonData)
    }
    
    
    
    
    
    
}
