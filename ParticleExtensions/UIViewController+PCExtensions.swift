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
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: UIAlertAction.Style.default) { (action) in
                self.showPhotoLibrary(delegate: delegate, mediaTypes: mediaTypes)
            }
            let cameraAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default) { (action) in
                self.showCamera(delegate: delegate, mediaTypes: mediaTypes)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { (action) in
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
    @objc public func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(self.showKeyboardResponse(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(self.hideKeyboardResponse(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: Keyboard Responders
    @objc private func showKeyboardResponse(notification: NSNotification) {
        let keyboardFrame: CGRect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let option = UIView.AnimationOptions(rawValue: UInt((notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
        let duration: TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        self.showKeyboard(keyboardHeight: keyboardFrame.height, animationDuration: duration, animationOptions: option)
    }
    @objc private func hideKeyboardResponse(notification: NSNotification) {
        let keyboardFrame: CGRect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let option = UIView.AnimationOptions(rawValue: UInt((notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
        let duration: TimeInterval = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        self.hideKeyboard(keyboardHeight: keyboardFrame.height, animationDuration: duration, animationOptions: option)
    }
    @objc open func showKeyboard(keyboardHeight: CGFloat, animationDuration: TimeInterval, animationOptions: UIView.AnimationOptions) {
        //MARK: Implement in subclas
    }
    @objc open func hideKeyboard(keyboardHeight: CGFloat, animationDuration: TimeInterval, animationOptions: UIView.AnimationOptions) {
        //MARK: Implement in subclass
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
