//
//  SettingsViewModel.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import Foundation
import StoreKit

@Observable
@MainActor
class SettingsViewModel {
    
    // MARK: - Properties
    
    /// Array of available setting cells
    private(set) var cells: [SettingCellModel] = []
    
    /// The different sheets that can be presented
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
    /// Currently selected sheet
    var selectedSheet: Sheet? = nil
    
    var isPaywallShows: Bool = false
    var isRestoreAlertShows: Bool = false
    /// Message displayed on successful restore
    var restoreSuccessMessage: String?
    /// Message displayed on failed restore
    var restoreFailureMessage: String?
    
    init() {
        setupCells()
    }
    
    // MARK: - Option Cells
    /// Configures the setting cells
    private func setupCells() {
        cells = [
            SettingsSection.rateAppCell {
                self.requestReview()
            },
            
            SettingsSection.restorePurchasesCell {
                self.restorePurchases()
            },
            
            SettingsSection.termsAndConditionsCell {
                self.present(sheet: .termsAndConditions)
            },
            
            SettingsSection.privacyPolicyCell {
                self.present(sheet: .privacyPolicy)
            }
        ]
    }
    
    // MARK: - Paywall
    
    func showPaywall(_ value: Bool) {
        isPaywallShows = value
    }
    
    func closePaywall() {
        isPaywallShows = false
    }
    
    // MARK: - Requset Review
    
    func requestReview() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            AppStore.requestReview(in: scene)
        }
    }
    
    // MARK: - Restore Purchases
    
    func showRestoreAlert(_ value: Bool) {
        isRestoreAlertShows = value
    }
    
    func dismissRestoreAlert() {
        isRestoreAlertShows = false
    }
    
    /// Restores previously purchased subscriptions
    func restorePurchases() {
        Task {
            do {
                try await AppStore.sync()
                isRestoreAlertShows = true
                restoreSuccessMessage = "Restore completed successfully"
            } catch {
                isRestoreAlertShows = true
                restoreFailureMessage = "Restore failed. \(error.localizedDescription)"
            }
        }
    }
    
    // MARK: - Sheets
    
    /// Dismisses the currently selected sheet
    func dismissSelectedSheet() {
        selectedSheet = nil
    }
    
    /// Presents a specific sheet
    func present(sheet: Sheet) {
        selectedSheet = sheet
    }
    
}
