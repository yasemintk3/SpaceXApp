//
//  LaunchesCellViewModel.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 16.06.2024.
//

import Foundation
import UIKit

class LaunchesCellViewModel {
    
    // MARK: Properties
    
    private var result: [Launch]
    
    // MARK: Init
    
    init(result: [Launch]) {
        self.result = result
    }
    
    var listCount: Int {
        result.count
    }
    
    func getFlightNumber(by indexPath: IndexPath) -> Int {
        result[indexPath.row].flightNumber ?? 0
    }
    
    func getMissionName(by indexPath: IndexPath) -> String {
        result[indexPath.row].missionName ?? ""
    }
    
    func getUpcomingSituation(by indexPath: IndexPath) -> Bool {
        result[indexPath.row].upcoming ?? true
    }
}
