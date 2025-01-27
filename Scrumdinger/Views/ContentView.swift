//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Mehmet Alp Sönmez on 15/01/2025.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @Binding var scrum: DailyScrum
    @State var scrumTimer = ScrumTimer()
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer}
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                VStack {
                    MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                      secondsRemaining: scrumTimer.secondsRemaining,
                                      theme: scrum.theme)
                    Circle()
                        .strokeBorder(lineWidth: 24)
                    MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
                }
            }
            .padding()
            .foregroundColor(scrum.theme.accentColour)
            .onAppear {
                startScrum()
            }
            .onDisappear {
                endScrum()
                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            player.seek(to: .zero)
            player.play()
        }
        scrumTimer.startScrum()
    }
    
    private func  endScrum() {
        scrumTimer.stopScrum()
        let newHistory = History(attendees: scrum.attendees)
        scrum.history.insert(newHistory, at: 0)
    }
}

#Preview {
    ContentView(scrum: .constant(DailyScrum.sampleData[0]))
}
