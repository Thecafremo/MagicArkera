//
//  NSError+Additions.swift
//  MagicArkera
//
//  Created by Thecafremo on 6/3/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation

extension NSError {
    
    //MARK: - LifeCycle's.
    
    convenience init(with description: String) {
        self.init(domain: "uk.co.magicdealers", code: 0, userInfo: [NSLocalizedDescriptionKey: description])
    }
}
