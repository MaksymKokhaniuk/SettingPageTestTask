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
            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.blue)
                        .frame(width: 40, height: 40)
                    Image(systemName: model.image)
                        .resizable()
                        .frame(width: 16, height: 20)
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
