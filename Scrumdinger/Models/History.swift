//
//  History.swift
//  Scrumdinger
//
//  Created by Mehmet Alp Sönmez on 27/01/2025.
//

import Foundation

struct History: Identifiable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee] ) {
        self.id = id
        self.date = date
        self.attendees = attendees
        
    }
}
