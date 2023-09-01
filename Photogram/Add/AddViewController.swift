//
//  AddViewController.swift
//  Photogram
//
//  Created by 서동운 on 8/28/23.
//

import UIKit
import PhotosUI

class AddViewController: BaseViewController {
    
    let mainView = AddView()
    
    var delegate: UIViewController?
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func searchButtonDidTapped() {
        
        presentActionSheet(
            fetchFromGallery: {
                self.fetchFromGallery()
            }, searchWeb: {
                self.searchWeb()
            })
        
//        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
//            switch status {
//            case .notDetermined:
//                // The user hasn't determined this app's access.
//            case .restricted:
//                // The system restricted this app's access.
//            case .denied:
//                // The user explicitly denied this app's access.
//            case .authorized:
//                // The user authorized this app to access Photos data.
//            case .limited:
//                // The user authorized this app for limited Photos access.
//            @unknown default:
//                fatalError()
//            }
            
            
//        }
//
//        var configuration = PHPickerConfiguration(photoLibrary: .shared())
//        configuration.selectionLimit = 1
//        configuration.selection
//
//        let picker = PHPickerViewController(configuration: configuration)
//        picker.delegate = self
//        present(picker, animated: true)
        ///
//        PHPhotoLibrary.shared().presentLimitedLibraryPicker(from: self)
//        PHPhotoLibrary.shared().presentLimitedLibraryPicker(from: self) { identifiers in
//            for newlySelectedAssetIdentifier in identifiers {
//                // Stage asset for app interaction.
//            }
//        }
        
//        var newFilter = PHPickerFilter.any(of: [.livePhotos, .videos])

    }
    
    func fetchFromGallery() {

    }
    
    func searchWeb() {
        let vc = SearchViewController()
        let nav = UINavigationController(rootViewController: vc)
        vc.delegate = self
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    override func configureViews() {
        super.configureViews()
        
        mainView.searchButton.addTarget(self, action: #selector(searchButtonDidTapped), for: .touchUpInside)
    }
}

extension AddViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//        let results = results.map { }
//
//        NSItemProvider
    }
}

extension AddViewController: ImageReceivable {
    func receive(_ data: UIImage?) {
        mainView.imageView.image = data
        self.dismiss(animated: true)
    }
}

extension AddViewController {
    
    func presentActionSheet(fetchFromGallery: @escaping () -> Void, searchWeb: @escaping () -> Void) {
        let sheet = UIAlertController(title: "사진 가져오기", message: nil, preferredStyle: .actionSheet)
        let fetchFromGallery = UIAlertAction(title: "갤러리에서 가져오기", style: .default) { _ in
            fetchFromGallery()
        }
        let searchWeb = UIAlertAction(title: "웹에서 검색하기", style: .default) { _ in
            searchWeb()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        sheet.addAction(fetchFromGallery)
        sheet.addAction(searchWeb)
        sheet.addAction(cancel)
        
        present(sheet, animated: true)
    }
}
