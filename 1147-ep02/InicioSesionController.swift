//
//  InicioSesionController.swift
//  1147-ep02
//
//  Created by rhodas agapito angeles on 16/05/22.
//

import UIKit

class InicioSesionController: UIViewController {
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var anchorContentCenterY: NSLayoutConstraint!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var customFieldUsuario: UITextField!
    @IBOutlet weak var customFielPassword: UITextField!
    @IBOutlet weak var customButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customFieldUsuario.layer.borderWidth = 1
        customFieldUsuario.layer.borderColor = #colorLiteral(red: 0.06412941962, green: 0.06311170757, blue: 0.06933446229, alpha: 0.8470588235)
        customFieldUsuario.layer.cornerRadius = 20
        customFieldUsuario.layer.masksToBounds = true
        
        customFielPassword.layer.borderWidth = 1
        customFielPassword.layer.borderColor = #colorLiteral(red: 0.06412941962, green: 0.06311170757, blue: 0.06933446229, alpha: 0.8470588235)
        customFielPassword.layer.cornerRadius = 20
        customFielPassword.layer.masksToBounds = true
        
        customButton.layer.borderWidth = 1
        customButton.layer.borderColor = #colorLiteral(red: 0.06412941962, green: 0.06311170757, blue: 0.06933446229, alpha: 0.8470588235)
        customButton.layer.cornerRadius = 20
        customButton.layer.masksToBounds = true
    }
    
    
    @IBAction private func tapToCloseKeyboard(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction private func swipeToCloseKeyboard(_ sender: UISwipeGestureRecognizer) {
        self.view.endEditing(true)
        
    }
    
    @IBAction private func swipeToOpenKeyboard(_ sender: UISwipeGestureRecognizer) {
        self.txtUser.becomeFirstResponder()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotification()
    }
    
    
}

//MARK: - Keyboard events
extension InicioSesionController {
    private func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func unregisterKeyboardNotification(){
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc private func keyboardWillShow(_ notification: Notification){
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        if keyboardFrame.origin.y < self.viewContent.frame.maxY {
            UIView.animate(withDuration: animationDuration) {
                self.anchorContentCenterY.constant = keyboardFrame.origin.y - self.viewContent.frame.maxY
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification){
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        UIView.animate(withDuration: animationDuration) {
            self.anchorContentCenterY.constant = 0
            self.view.layoutIfNeeded()
            
        }
            
    }
}
