//
//  Constants.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 27.06.2024.
//

import Foundation

struct Constants {
    
    static let BASE_URL = "https://api.spacexdata.com/v3"
    static let QUERY_URL = "/launches"
    
}

extension Constants {
    
    static func generateLaunchesURL() -> URL? {
        URL(string: BASE_URL + QUERY_URL)
    }
}
