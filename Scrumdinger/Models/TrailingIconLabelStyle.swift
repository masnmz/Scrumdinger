//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Mehmet Alp Sönmez on 15/01/2025.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
