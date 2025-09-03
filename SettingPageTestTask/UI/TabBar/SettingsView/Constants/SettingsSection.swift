//
//  SettingsSection.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import Foundation

enum SettingsSection {
    
    static func rateAppCell(
        rateAction: @escaping () -> Void
    ) -> SettingCellModel {
        return .init(
            image: "star",
            title: "Rate Application",
            action: rateAction
        )
    }
    
    static func restorePurchasesCell(
        restorePurchasesAction: @escaping () -> Void
    ) -> SettingCellModel {
        return .init(
            image: "arrow.clockwise",
            title: "Restore",
            action: restorePurchasesAction
        )
    }
    
    static func termsAndConditionsCell(
        termsAndConditionsAction: @escaping () -> Void
    ) -> SettingCellModel {
        return .init(
            image: "document",
            title: "Terms and Conditions",
            action: termsAndConditionsAction
        )
    }
    
    static func privacyPolicyCell(
        privacyPolicyAction: @escaping () -> Void
    ) -> SettingCellModel {
        return .init(
            image: "info.circle",
            title: "Privacy Policy",
            action: privacyPolicyAction
        )
    }
}
