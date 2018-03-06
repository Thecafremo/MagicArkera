//
//  ImageAPI.swift
//  MagicArkera
//
//  Created by Thecafremo on 6/3/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation
import UIKit

class ImageAPI {
    
    //MARK: - Class Methods.
    
    class func retrieveRandomImage(through requestManager: RequestManageable = RequestManager(), resultCompletionBlock: @escaping (Result<UIImage>) -> Void) {
        
        requestManager.retrieveImage(from: "https://picsum.photos/200/300/?random") { (result: Result<UIImage>) in
            
            //TODO: Implement storing mechanism - if needed.
            
            resultCompletionBlock(result)
        }
    }
}
