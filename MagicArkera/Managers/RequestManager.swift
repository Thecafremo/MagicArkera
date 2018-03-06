//
//  RequestManager.swift
//  MagicArkera
//
//  Created by Thecafremo on 6/3/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation
import UIKit

class RequestManager: RequestManageable {
    
    //MARK: - Methods.
    
    func retrieveImage(from urlString: String, requestCompletionBlock: @escaping (Result<UIImage>) -> Void) {
        
        guard let url = URL.init(string: urlString) else {
            
            requestCompletionBlock(.failure(NSError.init(with: "Invalid URL.")))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data: Data?, urlResponse: URLResponse?, error: Error?) in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    requestCompletionBlock(.failure(error))
                    return
                }
                
                guard let data = data, let image = UIImage.init(data: data) else {
                    requestCompletionBlock(.failure(NSError.init(with: "No Data.")))
                    return
                }
                
                requestCompletionBlock(.success(image))
            }
        }
        
        dataTask.resume()
    }
}
