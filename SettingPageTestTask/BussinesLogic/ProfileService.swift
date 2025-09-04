//
//  ProfileService.swift
//  SettingPageTestTask
//
//  Created by MaxK on 03.09.2025.
//

import SwiftUI
import PhotosUI

/// Represents the different loading states of a profile image
enum ImageState {
    case empty
    case loading(Progress)
    case loaded(Image)
    case failed(Error)
}

protocol ProfileServiceProtocol {
    func loadImage(from item: PhotosPickerItem?,
                   completion: @escaping (ImageState) -> Void) -> Progress?
}

class LiveProfileService: ProfileServiceProtocol {
    
    /// Errors that can occur during image transfer
    enum TransferError: Error {
        case importFailed
    }
    
    struct ProfileImage: Transferable {
        let image: Image
        
        static var transferRepresentation: some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
                guard let uiImage = UIImage(data: data) else {
                    throw TransferError.importFailed
                }
                let image = Image(uiImage: uiImage)
                return (ProfileImage(image: image))
            }
        }
    }
    
    /// Loads an image from a PhotosPickerItem
    func loadImage(from item: PhotosPickerItem?, completion: @escaping (ImageState) -> Void) -> Progress? {
        guard let item else {
            completion(.empty)
            return nil
        }
        
        let progress = item.loadTransferable(type: ProfileImage.self) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let profileImage?):
                    completion(.loaded(profileImage.image))
                case .success(nil):
                    completion(.empty)
                case .failure(let error):
                    completion(.failed(error))
                }
            }
        }
        return progress
    }
}

final class MockProfileService: ProfileServiceProtocol {
    func loadImage(from item: PhotosPickerItem?,
                   completion: @escaping (ImageState) -> Void) -> Progress? {
        completion(.loaded(Image(systemName: "person.fill")))
        return nil
    }
}
