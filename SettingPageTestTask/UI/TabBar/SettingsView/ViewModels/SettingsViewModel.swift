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
    
    enum Sheet: Identifiable {
        case termsAndConditions
        case privacyPolicy
        
        var id: String {
            switch self {
            case .termsAndConditions:
                return "termsAndConditions"
            case .privacyPolicy:
                return "privacyPolicy"
            }
        }
    }
    
    var selectedSheet: Sheet? = nil
    
    init() {
        setupCells()
    }
    
    // MARK: - Option Cells
    private func setupCells() {
        cells = [
            SettingsSection.rateAppCell {
                print("rate app")
            },
            
            SettingsSection.restorePurchasesCell {
                print("restore purchases")
            },
            
            SettingsSection.termsAndConditionsCell {
                self.present(sheet: .termsAndConditions)
            },
            
            SettingsSection.privacyPolicyCell {
                self.present(sheet: .privacyPolicy)
            }
        ]
    }
    
    // MARK: - Sheets
    func onUpdateSelectedSheet(isPresented: Bool) {
        if !isPresented {
            dismissSelectedSheet()
        }
    }
    
    func dismissSelectedSheet() {
        selectedSheet = nil
    }
    
    func present(sheet: Sheet) {
        dismissSelectedSheet()
        selectedSheet = sheet
    }
    
}
