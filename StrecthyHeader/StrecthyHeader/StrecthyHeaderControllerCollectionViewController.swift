//
//  StrecthyHeaderControllerCollectionViewController.swift
//  StrecthyHeader
//
//  Created by Naattudurai Eswaramurthy on 13/02/19.
//  Copyright © 2019 Naattudurai Eswaramurthy. All rights reserved.
//

import UIKit

fileprivate let reuseIdentifier = "Cell"
fileprivate let headerIdentifier = "headerView"
fileprivate let elementIdentifier = "elementId"


class StrecthyHeaderControllerCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    fileprivate let padding : CGFloat = 16.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupCollectionView()
       
    }
    
    fileprivate func setupCollectionView() {
        self.collectionView?.backgroundColor = .white
        self.collectionView?.contentInsetAdjustmentBehavior = .automatic
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
    }
    
    fileprivate func setupLayout() {
        
        if let layout  = collectionViewLayout as? UICollectionViewFlowLayout
        {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        cell.backgroundColor = .black
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width : view.frame.width - 2 * padding, height : 100)
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = scrollView.contentOffset.y
        print(contentOffsetY)
        
        if contentOffsetY  > -21   // Need to check the constraint issue to get rid off this hard code value
        {
            headerView?.animator.fractionComplete = 0
            return
        }
        headerView?.animator.fractionComplete = abs(contentOffsetY) / 100
        
    }
    
    
    var headerView : HeaderView?
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as? HeaderView
        
        return headerView!
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: self.view.frame.width - 2 * padding, height: 300)
    }
   
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
