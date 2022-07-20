//
//  InicioDetailViewControler.swift
//  1147-ep02
//
//  Created by Elizabeth Silvia Pumacota Quispe on 11/06/22.
//

import UIKit

class InicioDetailViewControler: UIViewController {
    
    @IBOutlet weak var customButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      customButton.layer.borderWidth = 1
        customButton.layer.borderColor = #colorLiteral(red: 0.06412941962, green: 0.06311170757, blue: 0.06933446229, alpha: 0.8470588235)
        customButton.layer.cornerRadius = 20
        customButton.layer.masksToBounds = true
    }
    
}
