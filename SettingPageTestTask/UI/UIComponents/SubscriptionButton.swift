//
//  SubscriptionButton.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import SwiftUI

/// A button used to open paywall
struct SubscriptionButton: View {
    
    // MARK: - Properties
    
    /// The action to perform when the button is tapped
    var onTap: () -> ()
    
    // MARK: - Body
    
    var body: some View {
        Button {
            onTap()
        } label: {
            Image("subscription_icon")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
        }
    }
}

#Preview {
    SubscriptionButton(onTap: { print("paywall is open") })
}
