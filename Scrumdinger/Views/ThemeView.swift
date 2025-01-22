//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Mehmet Alp Sönmez on 20/01/2025.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundStyle(theme.accentColour)
            .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    ThemeView(theme: .buttercup)
}
