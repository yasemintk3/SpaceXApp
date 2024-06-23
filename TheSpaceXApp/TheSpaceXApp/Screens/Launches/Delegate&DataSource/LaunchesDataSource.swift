//
//  LaunchesDataSource.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 16.06.2024.
//

import UIKit

final class LaunchesDataSource: NSObject {
    
    // MARK: Properties
    
    private var viewModel: LaunchesCellViewModel?
    
}

// MARK: Extensions

extension LaunchesDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchesCollectionViewCell.reuseIdentifier, for: indexPath) as? LaunchesCollectionViewCell
        else { return UICollectionViewCell() }
        
        return cell
    }
}
