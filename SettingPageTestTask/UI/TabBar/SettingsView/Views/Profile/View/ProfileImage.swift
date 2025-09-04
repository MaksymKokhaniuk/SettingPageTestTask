//
//  ProfileImage.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import SwiftUI
import PhotosUI

/// A reusable view that displays a profile image depending on its loading state
struct ProfileImage: View {
    let imageState: ImageState
    
    var body: some View {
        switch imageState {
        case .empty:
            // Default placeholder when no image is set
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFit()
        case .loading:
            // Progress indicator while image is loading
            ProgressView()
        case .loaded(let image):
            // Successfully loaded image
            image
                .resizable()
                .scaledToFill()
        case .failed:
            // Error icon when loading fails
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
        }
    }
}

/// A circular wrapper for the profile image
struct CircularProfileImage: View {
    let imageState: ImageState
    
    var body: some View {
        ProfileImage(imageState: imageState)
            .frame(width: SettingsLayout.defaultAvatarSize,
                   height: SettingsLayout.defaultAvatarSize)
            .clipShape(Circle())
    }
}

/// A circular profile image that can be edited by selecting a new photo
struct EditableCircularProfileImage: View {
    @State var profileViewModel: ProfileViewModel
    
    var body: some View {
        PhotosPicker(selection: $profileViewModel.imageSelection,
                     matching: .images,
                     photoLibrary: .shared()) {
            CircularProfileImage(imageState: profileViewModel.imageState)
        }
    }
}
