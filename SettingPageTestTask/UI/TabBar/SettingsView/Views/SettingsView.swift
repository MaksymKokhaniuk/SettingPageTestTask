//
//  SettingsView.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import SwiftUI

struct SettingsView: View {
    @State var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        ZStack {
            background
            
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        subscriptionButton
                            .padding(.horizontal)
                        Spacer()
                    }
                }
            }
            
            VStack(spacing: 48) {
                userInformation
                
                optionCell
                Spacer()
            }
        }
        .foregroundColor(.white)
    }
                
    // MARK: - Private Component Views
    private var background: some View {
        Image("settings_bg")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    
    private var subscriptionButton: some View {
        SubscriptionButton(onTap: { print("Subscription completed") })
    }
    
    private var userInformation: some View {
        VStack(spacing: 24) {
            userAvatar
            Text("Maksym Kokhaniuk")
        }
        .padding(.top, 36)
    }
    
    private var userAvatar: some View {
        Circle()
            .frame(width: 72, height: 72)
    }
    
    private var optionCell: some View {
        VStack(spacing: 12) {
            ForEach(settingsViewModel.cells.indices, id: \.self) { cell in
                SettingCellView(model: settingsViewModel.cells[cell])
                Divider()
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    SettingsView()
}
