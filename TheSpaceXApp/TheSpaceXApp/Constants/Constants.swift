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
    
    static let emptyImageURL: URL = URL(string: "https://www.swift-inc.com/public/images/images-empty.png")!
}

extension Constants {
    
    static func generateLaunchesURL() -> URL? {
        URL(string: BASE_URL + QUERY_URL)
    }
    
    static func generateDetailURL(id: Int) -> URL? {
        URL(string: BASE_URL + QUERY_URL + "/" + String(id))
    }
}
