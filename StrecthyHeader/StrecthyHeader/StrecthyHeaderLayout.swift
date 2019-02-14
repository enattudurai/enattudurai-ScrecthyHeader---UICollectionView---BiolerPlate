//
//  StrecthyHeaderLayout.swift
//  StrecthyHeader
//
//  Created by Naattudurai Eswaramurthy on 14/02/19.
//  Copyright © 2019 Naattudurai Eswaramurthy. All rights reserved.
//

import UIKit

class StrecthyHeaderLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layout = super.layoutAttributesForElements(in: rect)
        
        layout?.forEach({ (attributes) in
            
            if attributes.representedElementKind == UICollectionElementKindSectionHeader
            {
                guard let collectionView = self.collectionView else { return }
                
                let contentOffetY = collectionView.contentOffset.y
                
                if contentOffetY > 0
                {
                    return
                }
                
                let width = collectionView.frame.width
                let height = attributes.frame.height - contentOffetY
                
                attributes.frame = CGRect(x: 0, y: contentOffetY, width: width, height: height)
                
            }
            
        })
        
        return layout
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
