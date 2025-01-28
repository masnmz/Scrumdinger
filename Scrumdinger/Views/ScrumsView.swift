//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Mehmet Alp Sönmez on 15/01/2025.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var showingNewScrumSheet = false
    let saveAction: () -> Void
    
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
            NewScrumView(scrums: $scrums, showingNewScrumSheet: $showingNewScrumSheet, saveAction: saveAction)
        }
        .onChange(of: scenePhase) { phase, _ in
            if phase == .inactive {saveAction()}
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
