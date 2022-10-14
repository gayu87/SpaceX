//
//  SpaceXData.swift
//  SpaceX
//
//  Created by Gayatriben Patel on 10/11/22.
//

import Foundation

struct launch: Codable {
    var flightNumber: Int
    var missioName: String?
    var rocket: Rocket
    var details: String?
    var launchSite: LaunchSite
    var launchDateLocal: String?
    let links: Links

    enum CodingKeys: String, CodingKey {
        case flightNumber = "flight_number"
        case missioName = "mission_name"
        case rocket , links
        case launchSite = "launch_site"
        case details = "details"
        case launchDateLocal = "launch_date_local"
        
    }
}

struct Rocket: Codable {
   let rocketName: String?
    enum CodingKeys: String, CodingKey {
           case rocketName = "rocket_name"
        }
    
}

// MARK: - LaunchSite
struct LaunchSite: Codable {
    let siteName: String?

    enum CodingKeys: String, CodingKey {
       case siteName = "site_name"
    }
}

// MARK: - Links
struct Links: Codable {
    let missionPatch, missionPatchSmall: String?
    

    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
    }
}
