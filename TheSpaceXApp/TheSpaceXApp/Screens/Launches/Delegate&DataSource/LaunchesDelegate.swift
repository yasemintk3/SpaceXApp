//
//  LaunchesDelegate.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 16.06.2024.
//

import UIKit

final class LaunchesDelegate: NSObject {
    
    // MARK: Properties
    
    private var viewModel: LaunchesCellViewModel?
    
    // MARK: Funcs
    
    func update(cellViewModel: LaunchesCellViewModel) {
        self.viewModel = cellViewModel
    }
}

// MARK: Extensions

extension LaunchesDelegate: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout {
            let size = CellSize(flowLayout: flowLayout,
                                      width: UIScreen.main.bounds.size.width)
            return size.estimatedItemSize
        }
        return .zero
    }
}
