//
//  NewScrumView.swift
//  Scrumdinger
//
//  Created by Mehmet Alp Sönmez on 27/01/2025.
//

import SwiftUI

struct NewScrumView: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var showingNewScrumSheet: Bool
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            showingNewScrumSheet = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            showingNewScrumSheet = false
                        }
                    }
                }
        }
        
    }
}

#Preview {
    NewScrumView(scrums: .constant(DailyScrum.sampleData),
                  showingNewScrumSheet: .constant(true))
}
