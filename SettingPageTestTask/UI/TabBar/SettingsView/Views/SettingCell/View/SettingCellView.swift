//
//  SettingCellView.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import SwiftUI

/// A single cell in the settings screen
struct SettingCellView: View {
    
    //MARK: - Properties
    
    let model: SettingCellModel
    
    // MARK: - Body
    var body: some View {
        Button {
            model.action()
        } label: {
            HStack(spacing: SettingsLayout.defaultSpacing) {
                ZStack {
                    RoundedRectangle(cornerRadius: SettingsLayout.cornerRadius)
                        .fill(Color.blue)
                        .frame(width: SettingsLayout.bgIconSize,
                               height: SettingsLayout.bgIconSize)
                    Image(systemName: model.image)
                        .resizable()
                        .frame(width: SettingsLayout.iconWidth,
                               height: SettingsLayout.iconHeight)
                        .foregroundStyle(.white)
                }
                Text(model.title)
                    .foregroundStyle(.white)
                
                Spacer()
            }
        }
    }
}

#Preview {
    VStack {
        SettingCellView(model: SettingCellModel(
            image: "star",
            title: "Rate Application",
            action: {
                print("rate app")
            }
        ))
        SettingCellView(model: SettingCellModel(
            image: "arrow.clockwise",
            title: "Restore",
            action: {
                print("restore purchases")
            }
        ))
        SettingCellView(model: SettingCellModel(
            image: "document",
            title: "Terms and Conditions",
            action: {
                print("terms")
            }
        ))
    }
    .background(Color.gray)
}
