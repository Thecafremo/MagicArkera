//
//  Defines.swift
//  MagicArkera
//
//  Created by Thecafremo on 6/3/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation

//MARK: - Enums.

enum Result<T> {
    
    case success(T)
    case failure(Error)
    
    var value: Any {
        
        switch self {
            case .success(let value):
                return value
            case .failure(let value):
                return value
        }
    }    
}


//MARK: - Closures.

typealias CompletionBlock = () -> Void


//MARK: - Constants.

let animationDuration = 0.3
