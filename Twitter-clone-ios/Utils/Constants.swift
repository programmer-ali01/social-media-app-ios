//
//  Constants.swift
//  Twitter-clone-ios
//
//  Created by Alisena Mudaber on 2/6/21.
//  Copyright © 2021 Alisena Mudaber. All rights reserved.
//

import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_TWEETS = DB_REF.child("tweets")
