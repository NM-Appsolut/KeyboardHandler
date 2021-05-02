//
//  Keyboardhandler+Extension.swift
//
//  Created by Appsolut on 23.03.20.
//  Copyright © 2020 Appsolut. All rights reserved.
//

import Foundation
import UIKit

protocol KeyboardHandler {
    
    /// Subscribes to keyboard notifications.
    /// - Parameter scrollView: The scrollview, whose content insets needs to be adjusted.
    func subscribeKeyboard(with scrollView: UIScrollView)
    
    /// Removes keyboard subscriptions.
    func unsubscribeKeyboard()
}

/// This extension implements the KeyboardHandler for handling the keyboard appearance during editing mode in textfields.
extension KeyboardHandler {

    public func subscribeKeyboard(with scrollView: UIScrollView) {
        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillShowNotification,
            object: nil,
            queue: nil
        ) { [weak self] notification in
            self?.keyboardWillShow(notification, with: scrollView)
        }

        NotificationCenter.default.addObserver(
            forName: UIResponder.keyboardWillHideNotification,
            object: nil,
            queue: nil
        ) { [weak self] notification in
            self?.keyboardWillHide(notification, with: scrollView)
        }
    }

    public func unsubscribeKeyboard() {
        NotificationCenter.default.removeObserver(self)
    }

    /// Shows keyboard and adjusts the scrollview content insets.
    /// - Parameters:
    ///   - notification: Keyboard will show notification.
    ///   - scrollView: The scrollview, whose content insets needs to be adjusted.
    private func keyboardWillShow(_ notification: Notification, with scrollView: UIScrollView) {
        guard let userInfo = notification.userInfo else { return }
        guard let frame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        scrollView.contentInset = contentInset
    }

    /// Hides keyboard and adjusts the scrollview content insets.
    /// - Parameters:
    ///   - notification: Keyboard will hide notification.
    ///   - scrollView: The scrollview, whose content insets needs to be adjusted.
    private func keyboardWillHide(_ notification: Notification, with scrollView: UIScrollView) {
        scrollView.contentInset = .zero
    }
}
