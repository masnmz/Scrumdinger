//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Mehmet Alp Sönmez on 15/01/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack {
                ProgressView(value: 5, total: 15)
                HStack {
                    VStack {
                        Text("Second Elapsed")
                        Label("300", systemImage: "hourglass.tophalf.fill")
                    }
                    VStack {
                        Text("Seconds Remaining")
                        Label("600", systemImage: "hourglass.bottomhalf.fill")
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
