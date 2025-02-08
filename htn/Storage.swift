//
//  Storage.swift
//  htn
//
//  Created by Akshayan on 2024-09-14.
//

import SwiftUI
import Firebase

class Storage: ObservableObject {
    @Published var discounts: [Objects] = []
    @Published var extras: [Objects2] = []
    
    init() {
        getData()
        getData2()
    }
    
    func getData() {
        discounts.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Discounts")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let specificDiscount = data["specificDiscount"] as? String ?? ""
                    let dstion = data["dstion"] as? String ?? ""
                    let link = URL(string: data["Link"] as? String ?? "")
                    let photoUrl = data["photoUrl"] as? String ?? ""
                    
                    let discounts = Objects(id: id, specificDiscount: specificDiscount, dstion: dstion, Link: link!, photoUrl: photoUrl )
                    self.discounts.append(discounts)
                }
            }
        }
    }
    func getData2() {
        extras.removeAll()
        let db1 = Firestore.firestore()
        let ref1 = db1.collection("Extras")
        ref1.getDocuments { snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    let detion = data["detion"] as? String ?? ""
                    let linkUrl = URL(string: data["linkUrl"] as? String ?? "")
                    let photo = data["photo"] as? String ?? ""
                    
                    let extras = Objects2(id: id, name: name, detion: detion, linkUrl: linkUrl!, photo: photo)
                    self.extras.append(extras)
                }
            }
        }
    }
    
    
    
}
