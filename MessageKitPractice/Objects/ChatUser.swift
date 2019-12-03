//
//  ChatUser.swift
//  MessageKitPractice
//
//  Created by 家田真帆 on 2019/12/02.
//  Copyright © 2019 家田真帆. All rights reserved.
//

import Foundation
import MessageKit

// チャットユーザー情報の設計図
class ChatUser: SenderType {
    var senderId: String
    
    var displayName: String
    
    
    /// イニシャライザ
    /// - Parameters:
    ///   - senderId: ユーザーID
    ///   - displayName: 表示名
    init(senderId: String, displayName: String) {
        self.senderId = senderId
        self.displayName = displayName
    }
    
}
