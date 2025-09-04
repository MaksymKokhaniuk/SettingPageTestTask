//
//  ProfileViewModel.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import SwiftUI
import PhotosUI

@Observable
@MainActor
class ProfileViewModel {
    
    // MARK: - Dependencies
    private let profileService: ProfileServiceProtocol
    
    // MARK: - State
    var userName: String
    var imageState: ImageState = .empty
    
    var imageSelection: PhotosPickerItem? {
        didSet { loadImage() }
    }
    
    // MARK: - Init
    init(profileService: ProfileServiceProtocol,
         userName: String) {
        self.profileService = profileService
        self.userName = userName
    }
    
    private func loadImage() {
        imageState = .loading(Progress(totalUnitCount: 1))
        profileService.loadImage(from: imageSelection) { [ weak self ] state in
            self?.imageState = state
        }
    }
}
