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
    
    // MARK: Funcs
    
    func update(cellViewModel: LaunchesCellViewModel) {
        self.viewModel = cellViewModel
    }
}

// MARK: Extensions

extension LaunchesDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.listCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LaunchesCollectionViewCell.reuseIdentifier, for: indexPath) as? LaunchesCollectionViewCell,
        let viewModel = viewModel else { return UICollectionViewCell() }
        
        cell.configure(flightNumber: viewModel.getFlightNumber(by: indexPath),
                       missionName: viewModel.getMissionName(by: indexPath),
                       upcomingSituation: viewModel.getUpcomingSituation(by: indexPath))
        
        return cell
    }
}
