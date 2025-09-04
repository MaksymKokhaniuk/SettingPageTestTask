//
//  SettingsView.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import SwiftUI

struct SettingsView: View {
    @State var settingsViewModel: SettingsViewModel
    @State var profileViewModel: ProfileViewModel
    
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
        // MARK: - Sheets
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
        // MARK: - Full screen cover (Paywall)
        .fullScreenCover(isPresented: paywallBinding) {
            PaywallView {
                settingsViewModel.closePaywall()
            }
        }
        // MARK: - Restore alert
        .alert("Restore Purchase", isPresented: restorePurchasesBinding) {
            restoreAlertButtons
        } message: {
            restoreAlertMessage
        }

    }
                
    // MARK: - Private Component Views
    
    /// Background image for settings screen
    private var background: some View {
        Image("settings_bg")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    
    /// Subscription button
    private var subscriptionButton: some View {
        SubscriptionButton(onTap: { settingsViewModel.showPaywall(true) })
    }
    
    /// User information avatar and name
    private var userInformation: some View {
        VStack(spacing: SettingsLayout.spacingBetweenUserInformation) {
            userAvatar
            
            Text(profileViewModel.userName)
        }
        .padding(.top, SettingsLayout.topPadding)
    }
    
    /// Editable circular user avatar
    private var userAvatar: some View {
        EditableCircularProfileImage(profileViewModel: profileViewModel)
    }
    
    /// Settings options list
    private var optionCell: some View {
        VStack(spacing: SettingsLayout.defaultSpacing) {
            ForEach(settingsViewModel.cells.indices, id: \.self) { cell in
                SettingCellView(model: settingsViewModel.cells[cell])
                Divider()
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Private Bindings
    
    /// Paywall binding
    private var paywallBinding: Binding<Bool> {
        Binding(
            get: { settingsViewModel.isPaywallShows },
            set: { settingsViewModel.showPaywall($0) }
        )
    }
    
    // Restore alert binding
    private var restorePurchasesBinding: Binding<Bool> {
        Binding(
            get: { settingsViewModel.isRestoreAlertShows },
            set: { settingsViewModel.showRestoreAlert($0) }
        )
    }
    
    /// Restore alert buttons
    @ViewBuilder
    private var restoreAlertButtons: some View {
        Button("Ok", role: .cancel) {
            settingsViewModel.dismissRestoreAlert()
        }
    }
    
    /// Restore alert message
    @ViewBuilder
    private var restoreAlertMessage: some View {
        if let message = settingsViewModel.restoreSuccessMessage {
            Text(message)
        } else if let message = settingsViewModel.restoreFailureMessage {
            Text(message)
        }
    }
}

#Preview {
    let settingsViewModel = SettingsViewModel()
    let profileViewModel = ProfileViewModel(profileService: MockProfileService(), userName: "Unknown User")
    
    SettingsView(settingsViewModel: settingsViewModel,
                 profileViewModel: profileViewModel)
}
