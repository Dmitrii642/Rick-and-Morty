//
//  UIViewController + Extensions.swift
//  RM
//
//  Created by Дмитрий Яковлев on 12.11.2023.
//


import UIKit

extension UIViewController {
    
func alertPhotoOrCamera(completionHandler: @escaping (UIImagePickerController.SourceType) -> Void) {
    
    let alertController = UIAlertController(title: "Загрузите изображение", message: nil, preferredStyle: .actionSheet)
    let camera = UIAlertAction(title: "Камера", style: .default) { _ in
        
        
        
        let camera = UIImagePickerController.SourceType.camera
        completionHandler(camera)
        
    }
    
    let photoLibrary = UIAlertAction(title: "Галерея", style: .default) { _ in
        let photoLibrary = UIImagePickerController.SourceType.photoLibrary
        completionHandler(photoLibrary)
}
    let cancel = UIAlertAction(title: "Отмена", style: .destructive)
    
    alertController.addAction(camera)
    alertController.addAction(photoLibrary)
    alertController.addAction(cancel)
    
    present(alertController, animated: true)
}
}
