//
//  ViewController.swift
//  MagicArkera
//
//  Created by Thecafremo on 6/3/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties.
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
        
    private var randomImageViewModel = RandomImageViewModel()
    
    
    //MARK: - LifeCycle's.
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.configureGradient()
        self.startRetrievingImages()
    }
    
    
    //MARK: - Private Methods.
    
    private func configureGradient() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [NSNumber.init(value: 0), NSNumber.init(value: 0.85), NSNumber.init(value: 1)]
        
        self.imageView.layer.addSublayer(gradientLayer)
    }
    
    private func startRetrievingImages() {
        
        self.randomImageViewModel.retrieve { [unowned self] in
            
            UIView.transition(with: self.label, duration: animationDuration, options: .transitionCrossDissolve, animations: {
                self.label.text = self.randomImageViewModel.appropriateText()
            }, completion: nil)

            UIView.transition(with: self.imageView, duration: animationDuration, options: .transitionCrossDissolve, animations: {
                self.imageView.image = self.randomImageViewModel.appropriateImage()
            }, completion: nil)
        }
    }
}

