//
//  SettingCellModel.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import Foundation

/// A model representing a single SettingCell
struct SettingCellModel {
    /// image of the setting cell
    let image: String
    /// title of the setting cell
    let title: String
    /// action to perform when the cell is tapped
    let action: () -> Void
    
    init(image: String,
         title: String,
         action: @escaping () -> Void) {
        self.image = image
        self.title = title
        self.action = action
    }
}
