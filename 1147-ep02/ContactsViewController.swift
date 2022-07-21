//
//  ContactsViewController.swift
//  1147-ep02
//
//  Created by Elizabeth Silvia Pumacota Quispe on 20/07/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ContactsViewController: UIViewController {
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getContacts()
    }
    
    // Get the contacts
    func getContacts(){
        db.collection("contacts").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting contacts: \(err)")
            } else {
                print("My contacts")
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
}
