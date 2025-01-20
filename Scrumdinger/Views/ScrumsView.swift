//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Mehmet Alp Sönmez on 15/01/2025.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                        
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ScrumsView(scrums: DailyScrum.sampleData)
}
