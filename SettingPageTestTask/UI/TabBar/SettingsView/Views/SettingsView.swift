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
            
            VStack(spacing: SettingsLayout.spacingBetweenContent) {
                userInformation
                
                optionCell
                Spacer()
            }
        }
        .foregroundColor(.white)
        .sheet(item: $settingsViewModel.selectedSheet) {
            settingsViewModel.dismissSelectedSheet()
        } content: { sheet in
            switch  sheet {
            case .privacyPolicy:
                Text("Privacy Policy")
            case .termsAndConditions:
                Text("Terms and Conditions")
            }
            
        }

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
        VStack(spacing: SettingsLayout.spacingBetweenUserInformation) {
            userAvatar
            Text("Maksym Kokhaniuk")
        }
        .padding(.top, SettingsLayout.topPadding)
    }
    
    private var userAvatar: some View {
        Circle()
            .frame(width: SettingsLayout.defaultAvatarSize,
                   height: SettingsLayout.defaultAvatarSize)
    }
    
    private var optionCell: some View {
        VStack(spacing: SettingsLayout.defaultSpacing) {
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
