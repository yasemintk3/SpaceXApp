//
//  CellSize.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 16.06.2024.
//

import UIKit

struct CellSize {
    
    private enum Constant {
        static let contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        static let collectionViewEstimatedCellHeight: CGFloat = 100
        static let detailCollectionViewEstimatedCellHeight: CGFloat = 120
        static let minimumLineSpacing: CGFloat = 8.0
        static let minimumInteritemSpacing: CGFloat = 0.0
        static let zero: CGSize = CGSize(width: UIScreen.main.bounds.width, height: 0)
    }
    
    // MARK: Properties
    
    private let flowLayout: UICollectionViewFlowLayout
    private let width: CGFloat
    private var space: CGFloat {
        return flowLayout.minimumLineSpacing +
        (flowLayout.collectionView?.contentInset.left ?? 0) +
        (flowLayout.collectionView?.contentInset.right ?? 0)
    }
    
    var contentInset: UIEdgeInsets {
        return Constant.contentInset
    }
    
    var estimatedItemSize: CGSize {
        return CGSize(width: floor((width - space) / 2),
                      height: Constant.collectionViewEstimatedCellHeight)
    }
    
    var detailEstimatedItemSize: CGSize {
        return CGSize(width: floor((width - space) / 3),
                      height: Constant.detailCollectionViewEstimatedCellHeight)
    }
    
    var zero: CGSize {
        return Constant.zero
    }
    
    // MARK: Init
    
    init(flowLayout: UICollectionViewFlowLayout, width: CGFloat) {
        self.flowLayout = flowLayout
        self.width = width
        
        setSpacing()
    }
    
    // MARK: Funcs

    private func setSpacing() {
        flowLayout.minimumLineSpacing = Constant.minimumLineSpacing
        flowLayout.minimumInteritemSpacing = Constant.minimumInteritemSpacing
    }
    
    public func getFlowLayout() -> UICollectionViewFlowLayout {
        return flowLayout
    }
}
