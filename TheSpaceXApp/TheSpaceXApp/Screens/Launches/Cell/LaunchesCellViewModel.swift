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

    // MARK: Funcs
    
    func getFlightNumber(by indexPath: IndexPath) -> String {
        let number = result[indexPath.row].flightNumber
        return "\(number ?? 0)"
    }
    
    func getMissionName(by indexPath: IndexPath) -> String {
        result[indexPath.row].missionName ?? ""
    }
    
    func getUpcomingSituation(by indexPath: IndexPath) -> String {
        let situation = result[indexPath.row].upcoming
        return "\(situation ?? false)"
    }
    
    func getID(indexPath: IndexPath) -> Int {
        guard let id = result[indexPath.row].flightNumber else { return 0 }
        return id
    }
}
