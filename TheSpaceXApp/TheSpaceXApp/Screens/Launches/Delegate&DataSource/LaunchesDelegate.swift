//
//  LaunchesDelegate.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 16.06.2024.
//

import UIKit

protocol LaunchesDelegateOutput: AnyObject {
    func didSelectItem(id: Int)
}

final class LaunchesDelegate: NSObject {
    
    // MARK: Properties
    
    private var viewModel: LaunchesCellViewModel?
    private weak var output: LaunchesDelegateOutput?
    
    // MARK: Funcs
    
    func update(cellViewModel: LaunchesCellViewModel, output: LaunchesDelegateOutput) {
        self.viewModel = cellViewModel
        self.output = output
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel else {return}
        output?.didSelectItem(id: viewModel.getID(indexPath: indexPath))
    }
}
