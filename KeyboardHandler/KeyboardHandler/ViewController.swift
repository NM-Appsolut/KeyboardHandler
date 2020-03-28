//
//  ViewController.swift
//  KeyboardHandler
//
//  Created by Niroshan Maheswaran on 28.03.20.
//  Copyright © 2020 Appsolut. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KeyboardHandler {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscribeKeyboard(with: scrollView)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeKeyboard()
    }
}

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

