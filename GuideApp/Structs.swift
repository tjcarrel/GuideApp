//
//  Guide.swift
//  GuideApp
//
//  Created by Theodore Carrel on 1/27/19.
//  Copyright © 2019 Theodore Carrel. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Venue: Codable {

    let city: String?
    let state: String?
    
}

struct Guide: Codable {

    let startDate: String
    let objType: String
    let endDate: String
    let name: String
    let loginRequired: Bool
    let url: String
    let venue: Venue
    let icon: String

}

struct GuideData: Codable {

    let total: String
    let data: [Guide]

}

struct DateSection: Comparable {
    
    var startDate: Date
    var guides: [Guide]
    
    static func < (lhs: DateSection, rhs: DateSection) -> Bool {
        return lhs.startDate < rhs.startDate
    }
    
    static func == (lhs: DateSection, rhs: DateSection) -> Bool {
        return lhs.startDate == rhs.startDate
    }
    
    static func group(guides: [Guide]) -> [DateSection] {
        
        let groups = Dictionary(grouping: guides) { (guide) -> Date in
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy"
            return dateFormatter.date(from: guide.startDate)!
            
        }
        
        return groups.map(DateSection.init(startDate:guides:)).sorted()
    }
    
}

