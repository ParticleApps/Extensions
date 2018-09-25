//
//  UIViewController+PCExtensions.swift
//  ParticleExtensions
//
//  Created by Rocco Del Priore on 9/24/18.
//  Copyright © 2018 Rocco Del Priore. All rights reserved.
//

import UIKit

extension UIViewController {
    //MARK: Actions
    func showCamera(delegate: UIImagePickerControllerDelegate, mediaTypes: [String]) {
        let viewController = UIImagePickerController()
        viewController.sourceType = .camera
        viewController.delegate = delegate as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        viewController.mediaTypes = mediaTypes
        self.present(viewController, animated: true, completion: nil)
    }
    func showPhotoLibrary(delegate: UIImagePickerControllerDelegate, mediaTypes: [String]) {
        let viewController = UIImagePickerController()
        viewController.sourceType = .photoLibrary
        viewController.delegate = delegate as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        viewController.mediaTypes = mediaTypes
        self.present(viewController, animated: true, completion: nil)
    }
    func showImageOptions(delegate: UIImagePickerControllerDelegate, mediaTypes: [String]) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.default) { (action) in
                self.showPhotoLibrary(delegate: delegate, mediaTypes: mediaTypes)
            }
            let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) { (action) in
                self.showCamera(delegate: delegate, mediaTypes: mediaTypes)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
                //Dismiss
            }
            
            actionSheetController.addAction(photoLibraryAction)
            actionSheetController.addAction(cameraAction)
            actionSheetController.addAction(cancelAction)
            self.present(actionSheetController, animated: true, completion: nil)
        }
        else {
            showPhotoLibrary(delegate: delegate, mediaTypes: mediaTypes)
        }
    }
    
    //MARK: Helpers
    private func findTopViewController(viewController: UIViewController) -> UIViewController {
        if let presentedViewController = viewController.presentedViewController {
            return findTopViewController(viewController:presentedViewController)
        }
        return viewController
    }
    
    //MARK: Accessors
    public func topPresentedViewController() -> UIViewController {
        return findTopViewController(viewController: self)
    }
}

