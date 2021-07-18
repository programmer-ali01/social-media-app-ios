//
//  TweetViewModel.swift
//  Twitter-clone-ios
//
//  Created by Alisena Mudaber on 7/18/21.
//  Copyright © 2021 Alisena Mudaber. All rights reserved.
//

import UIKit

// ViewModel : using models to do computations for us that involve that goes into our user interface

struct TweetViewModel {
    let tweet: Tweet
    let user: User
    
    var profileImageUrl: URL? {
        return tweet.user.profileImageUrl
    }
    
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: tweet.timestamp, to: now) ?? "2m"
    }
    
    var userInfoText: NSAttributedString {
        let title = NSMutableAttributedString(string: user.fullname, attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        title.append(NSAttributedString(string: " @\(user.username)", attributes: [.font: UIFont.boldSystemFont(ofSize: 14),
                                                                                   .foregroundColor: UIColor.lightGray
        ]))
        // go to emojis and bullets and stars to get the bullet point below
        title.append(NSAttributedString(string: " ・ \(timestamp)", attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        return title
    }

    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
}
