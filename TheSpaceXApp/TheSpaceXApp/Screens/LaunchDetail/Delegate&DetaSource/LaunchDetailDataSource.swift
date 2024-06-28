//
//  LaunchDetailDataSource.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 28.06.2024.
//

import UIKit

final class LaunchDetailDataSource: NSObject {
    
    // MARK: Properties
    
    private var viewModel: LaunchDetailCellViewModel?
    
    // MARK: Funcs
    
    func update(detailCellViewModel: LaunchDetailCellViewModel) {
        self.viewModel = detailCellViewModel
    }
}

// MARK: Extensions

extension LaunchDetailDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.imageCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchDetailCollectionViewCell.reuseIdentifier, for: indexPath) as? LaunchDetailCollectionViewCell,
        let viewModel = viewModel else { return UICollectionViewCell() }
        
        cell.configure(imageURL: viewModel.getImage(by: indexPath))
        
        return cell
    }
}
