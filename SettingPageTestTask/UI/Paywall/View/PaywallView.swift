//
//  PaywallView.swift
//  SettingPageTestTask
//
//  Created by MaxK on 04.09.2025.
//

import SwiftUI

struct PaywallView: View {
    var onCLose: () -> ()
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Paywall")
                .font(.largeTitle)
            
            Button("Close") {
                onCLose()
            }
        }
    }
}

#Preview {
    PaywallView(onCLose: { print("Paywall Clossed") })
}
