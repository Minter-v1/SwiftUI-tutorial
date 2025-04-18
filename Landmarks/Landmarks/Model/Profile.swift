//
//  Profile.swift
//  Landmarks
//
//  Created by 이민지 on 4/16/25.
//

import Foundation


struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date() //얜뭘까
    
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue } //이건 또 뭘까
    }
}
