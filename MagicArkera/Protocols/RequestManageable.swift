//
//  RequestManageable.swift
//  MagicArkera
//
//  Created by Thecafremo on 6/3/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation
import UIKit

protocol RequestManageable {
    func retrieveImage(from urlString: String, resultCompletionBlock: @escaping (Result<UIImage>) -> Void)
}
