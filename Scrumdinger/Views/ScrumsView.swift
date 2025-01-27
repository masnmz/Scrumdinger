//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Mehmet Alp Sönmez on 15/01/2025.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @State private var showingNewScrumSheet = false
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                        
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    showingNewScrumSheet = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .preferredColorScheme(.dark)
        }
        .sheet(isPresented: $showingNewScrumSheet) {
            NewScrumView(scrums: $scrums, showingNewScrumSheet: $showingNewScrumSheet)
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData))
}
