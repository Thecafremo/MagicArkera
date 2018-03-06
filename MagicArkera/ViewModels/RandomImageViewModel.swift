//
//  RandomImageViewModel.swift
//  MagicArkera
//
//  Created by Thecafremo on 6/3/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation
import UIKit

private let secondsInterval: Double = 5
private let numberOfRequestBeforeError = 4

class RandomImageViewModel {
    
    //MARK: - Properties.
    
    private var image: UIImage?
    private var error: Error?
    private var isRetrievingData: Bool = false
    private var requestCount: Int = 0
    private var endRequestDate: Date?
    private var timer: Timer?
    
    private lazy var dateFormatter: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
       return dateFormatter
    }()
    
    
    //MARK: - LifeCycle's.
    
    deinit {
        self.resetTimer()
    }
    
    
    //MARK: - Private Methods.
    
    private func resetTimer() {
        
        self.timer?.invalidate()
        self.timer = nil
    }
    
    private func populate(with result: Result<UIImage>?, completionBlock: @escaping CompletionBlock) {
        
        self.image = result?.value as? UIImage
        self.error = result?.value as? Error
        
        completionBlock()
    }
    
    
    //MARK: - Methods.
    
    func retrieve(completionBlock: @escaping CompletionBlock) {
        
        if (self.timer == nil) {
        
            self.timer = Timer.scheduledTimer(withTimeInterval: secondsInterval, repeats: true, block: { [weak self] (timer: Timer) in
                self?.retrieve(completionBlock: completionBlock)
            })
        }
        
        if (self.requestCount > numberOfRequestBeforeError) {
            
            self.requestCount = 0
            self.error = NSError.init(with: "Oh noooo...")
            
            completionBlock()
            
            return
        }
        
        self.isRetrievingData = true
        self.populate(with: nil, completionBlock: completionBlock)

        ImageAPI.retrieveRandomImage(resultCompletionBlock: { (result: Result<UIImage>) in
            
            self.isRetrievingData = false
            
            self.requestCount = self.requestCount + 1
            self.endRequestDate = Date()

            self.populate(with: result, completionBlock: completionBlock)
        })
    }

    func appropriateText() -> String? {
        
        if (self.isRetrievingData) {
            return "Loading..."
        }
        
        if let error = self.error {
            return error.localizedDescription
        }
        
        if let date = self.endRequestDate {
            return self.dateFormatter.string(from: date)
        }
        
        return nil
    }
    
    func appropriateImage() -> UIImage? {
        
        if (error != nil) {
            return UIImage.init(named: "failureImage")
        }
        
        return self.image
    }
}
