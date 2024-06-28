//
//  LaunchDetail.swift
//  TheSpaceXApp
//
//  Created by Yasemin TOK on 28.06.2024.
//

import Foundation

// MARK: - LaunchDetail
struct LaunchDetail: Codable {
    let flightNumber: Int?
    let missionName: String?
    let missionID: [String]?
    let launchYear: String?
    let launchDateUnix: Int?
    let launchDateUTC: String?
    let launchDateLocal: String?
    let isTentative: Bool?
    let tentativeMaxPrecision: String?
    let tbd: Bool?
    let launchWindow: Int?
    let rocket: Rocket?
    let ships: [String]?
    let telemetry: Telemetry?
    let launchSite: LaunchSite?
    let launchSuccess: Bool?
    let links: Links?
    let details: String?
    let upcoming: Bool?
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let timeline: [String: Int]?

    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missionName = "mission_name"
        case missionID = "mission_id"
        case launchYear = "launch_year"
        case launchDateUnix = "launch_date_unix"
        case launchDateUTC = "launch_date_utc"
        case launchDateLocal = "launch_date_local"
        case isTentative = "is_tentative"
        case tentativeMaxPrecision = "tentative_max_precision"
        case tbd
        case launchWindow = "launch_window"
        case rocket, ships, telemetry
        case launchSite = "launch_site"
        case launchSuccess = "launch_success"
        case links, details, upcoming
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case timeline
    }
}
