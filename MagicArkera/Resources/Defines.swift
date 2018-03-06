//
//  Defines.swift
//  MagicArkera
//
//  Created by Thecafremo on 6/3/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Any)
}
