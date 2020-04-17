//
//  UICollectionView+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 10/7/17.
//  Copyright © 2017 Rocco Del Priore. All rights reserved.
//

import Foundation

extension UIView {
    public func gridCollectionViewLayout(numberOfColumns: Int,
                                         cellHeight: CGFloat = 50.0,
                                         horizontalSpacing: CGFloat = 5.0,
                                         verticalSpacing: CGFloat = 5.0,
                                         scrollDirection: UICollectionView.ScrollDirection = .vertical) -> UICollectionViewLayout {
        let columns: CGFloat = CGFloat(numberOfColumns)
        let collectionLayout = UICollectionViewFlowLayout()
        let cellWidth = (self.bounds.size.width-((columns+1)*horizontalSpacing))/columns
        
        collectionLayout.scrollDirection         = scrollDirection
        collectionLayout.itemSize                = CGSize(width: cellWidth, height: cellHeight)
        collectionLayout.minimumInteritemSpacing = horizontalSpacing
        collectionLayout.minimumLineSpacing      = verticalSpacing
        collectionLayout.sectionInset            = UIEdgeInsets(top: verticalSpacing,
                                                                left: horizontalSpacing,
                                                                bottom: verticalSpacing,
                                                                right: horizontalSpacing)
        
        return collectionLayout
    }
    
    public func gridCollectionViewLayout(numberOfRows: Int,
                                         cellWidth: CGFloat = 50.0,
                                         horizontalSpacing: CGFloat = 5.0,
                                         verticalSpacing: CGFloat = 5.0,
                                         scrollDirection: UICollectionView.ScrollDirection = .horizontal) -> UICollectionViewLayout {
        let rows: CGFloat = CGFloat(numberOfRows)
        let collectionLayout = UICollectionViewFlowLayout()
        let cellHeight = (self.bounds.size.height-((rows+1)*verticalSpacing))/rows
        
        collectionLayout.scrollDirection         = scrollDirection
        collectionLayout.itemSize                = CGSize(width: cellWidth, height: cellHeight)
        collectionLayout.minimumInteritemSpacing = horizontalSpacing
        collectionLayout.minimumLineSpacing      = verticalSpacing
        collectionLayout.sectionInset            = UIEdgeInsets(top: verticalSpacing,
                                                                left: horizontalSpacing,
                                                                bottom: verticalSpacing,
                                                                right: horizontalSpacing)
        
        return collectionLayout
    }
}

extension UICollectionViewLayout {
    public class func standardGrid(horizontalSpacing: CGFloat = 5.0,
                                   verticalSpacing: CGFloat = 5.0,
                                   cellHeight: CGFloat = 50.0,
                                   cellWidth: CGFloat = 50.0,
                                   scrollDirection: UICollectionView.ScrollDirection = .vertical) -> UICollectionViewLayout {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.scrollDirection         = scrollDirection
        collectionLayout.sectionInset            = UIEdgeInsets(top: verticalSpacing,
                                                                left: horizontalSpacing,
                                                                bottom: verticalSpacing,
                                                                right: horizontalSpacing)
        collectionLayout.itemSize                = CGSize(width: cellWidth, height: cellHeight)
        collectionLayout.minimumInteritemSpacing = horizontalSpacing
        collectionLayout.minimumLineSpacing      = verticalSpacing
        return collectionLayout
    }
}

extension UICollectionView {
    public func registerClass(anyClass: AnyClass, cellType: Int) {
        self.register(anyClass, forCellWithReuseIdentifier: String(format: "%li", cellType))
    }
}
