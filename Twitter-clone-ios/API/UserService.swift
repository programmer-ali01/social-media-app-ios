//
//  UserService.swift
//  Twitter-clone-ios
//
//  Created by Alisena Mudaber on 2/8/21.
//  Copyright © 2021 Alisena Mudaber. All rights reserved.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        // get current user
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            
            let user = User(uid: uid, dictionary: dictionary)
            
            completion(user)
        }
    }
}
