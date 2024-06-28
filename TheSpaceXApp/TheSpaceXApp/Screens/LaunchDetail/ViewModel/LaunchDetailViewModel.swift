//
//  LaunchDetailViewModel.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 28.06.2024.
//

import Foundation

enum LaunchDetailListViewModelState {
    case showLaunchDetail(LaunchDetailCellViewModel)
    case setData
    case showError(String)
}

protocol LaunchDetailViewModelOutput: AnyObject {
    func updateDetailView(_ state: LaunchDetailListViewModelState)
}

protocol LaunchDetailViewModelProtocol {
    var output: LaunchDetailViewModelOutput? { get set }
    
    func getLaunchDetail()
    func getFlightNumber() -> String
    func getMissionName() -> String
    func getLaunchYear() -> String
    func getLaunchDetails() -> String
}

final class LaunchDetailViewModel: LaunchDetailViewModelProtocol {
    
    // MARK: Properties
    
    var output: LaunchDetailViewModelOutput?
    private var id: Int
    private var httpClient: HttpClientProtocol
    private var results: LaunchDetail?
    
    // MARK: Init
    
    init(id: Int, httpClient: HttpClientProtocol) {
        self.id = id
        self.httpClient = httpClient
        
        self.getLaunchDetail()
    }
    
    // MARK: Funcs
    
    func getLaunchDetail() {
        
        httpClient.fetch(url: Constants.generateDetailURL(id: id)!, completion: { [self] (result: Result<LaunchDetail, Error>) in
            
            switch result {
            case .success(let response):
                self.results = response
                let detailCellViewModel = LaunchDetailCellViewModel(imagesResult: response)
                self.output?.updateDetailView(.showLaunchDetail(detailCellViewModel))
                self.output?.updateDetailView(.setData)
            case .failure(let error):
                self.output?.updateDetailView(.showError(error.localizedDescription))
            }
        })
    }
    
    func getFlightNumber() -> String {
        let number = results?.flightNumber
        return "Flight Number: \(number ?? 0)"
    }
    
    func getMissionName() -> String {
        let name = results?.missionName
        return "Mission Name: \(name ?? "")"
    }
    
    func getLaunchYear() -> String {
        let year = results?.launchYear
        return "Launch Year: \(year ?? "")"
    }
    
    func getLaunchDetails() -> String {
        let details = results?.details
        return "Launch Details: \(details ?? "")"
    }
}
