//
//  SettingsViewModel.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import Foundation

@Observable
class SettingsViewModel {
    
    private(set) var cells: [SettingCellModel] = []
    
    init() {
        setupCells()
    }
    
    private func setupCells() {
        cells = [
            SettingsSection.rateAppCell {
                print("rate app")
            },
            
            SettingsSection.restorePurchasesCell {
                print("restore purchases")
            },
            
            SettingsSection.termsAndConditionsCell {
                print("terms and conditions")
            },
            
            SettingsSection.privacyPolicyCell {
                print("privacy policy")
            }
        ]
    }
}
