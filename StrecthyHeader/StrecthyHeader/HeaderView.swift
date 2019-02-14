//
//  HeaderView.swift
//  StrecthyHeader
//
//  Created by Naattudurai Eswaramurthy on 13/02/19.
//  Copyright © 2019 Naattudurai Eswaramurthy. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView : UIImageView =
    {
        let iv = UIImageView(image: UIImage(named: "test"))
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubview(imageView)
        imageView.fillToSuperview()
        
        setupBlurVisualEffect()
    }
    
    var animator = UIViewPropertyAnimator()
    
    fileprivate func setupBlurVisualEffect()
    {
        animator = UIViewPropertyAnimator(duration: 2.0, curve: UIViewAnimationCurve.linear, animations: {
            [weak self] in
            
            let blurEffect = UIBlurEffect(style: .light)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.fillToSuperview()
            
        })

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
