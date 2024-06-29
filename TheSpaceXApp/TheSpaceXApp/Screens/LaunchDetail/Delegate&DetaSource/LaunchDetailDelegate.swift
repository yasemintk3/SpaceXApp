//
//  LaunchDetailDelegate.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 28.06.2024.
//

import UIKit

final class LaunchDetailDelegate: NSObject {
    
    // MARK: Properties
    
    private var viewModel: LaunchDetailCellViewModel?
    
    // MARK: Funcs
    
    func update(detailCellViewModel: LaunchDetailCellViewModel) {
        self.viewModel = detailCellViewModel
    }
}

// MARK: Extensions

extension LaunchDetailDelegate: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            let size = CellSize(flowLayout: flowLayout,
                                width: UIScreen.main.bounds.size.width)
            return size.detailEstimatedItemSize
        }
        return .zero
    }
}
