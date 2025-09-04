//
//  SettingPageTestTaskApp.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import SwiftUI

@main
struct SettingPageTestTaskApp: App {
    var body: some Scene {
        WindowGroup {
            let profileService = LiveProfileService()
            let profileVM = ProfileViewModel(profileService: profileService,
                                             userName: "Test User")
            let settingsVM = SettingsViewModel()
            
            
            SettingsView(
                settingsViewModel: settingsVM,
                profileViewModel: profileVM
            )
        }
    }
}
