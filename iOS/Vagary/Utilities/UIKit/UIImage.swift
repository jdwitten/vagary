//
//  UIImage.swift
//  Vagary
//
//  Created by Jonathan Witten on 3/3/18.
//  Copyright © 2018 Jonathan Witten. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit

extension UIImage {
    static func build(with image: PostImage) -> Promise<UIImage> {
        let url = image.url
        let session = URLSession(configuration: .default)
        return Promise { fulfill, reject in
            let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
                guard error == nil, let _ = response as? HTTPURLResponse  else {
                    reject(error ?? ImageError.unknown)
                    return
                }
                if let imageData = data, let image = UIImage(data: imageData) {
                    fulfill(image)
                } else {
                    reject(ImageError.invalidData)
                }
            }
            downloadPicTask.resume()
        }
    }
}

enum ImageError: Error {
    case invalidUrl
    case invalidData
    case unknown
}
