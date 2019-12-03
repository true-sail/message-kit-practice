//
//  Message.swift
//  MessageKitPractice
//
//  Created by 家田真帆 on 2019/12/02.
//  Copyright © 2019 家田真帆. All rights reserved.
//

import Foundation
import MessageKit

class Message {
    // let 変数名: 型
    
    // 送信者
    let user: ChatUser
    
    // メッセージ
    let text: String
    
    // id
    let messageId: String
    
    // 送信日付
    let sentDate: Date
    
    init(user: ChatUser, text: String, messageId: String, sentDate: Date) {
        self.user = user
        self.text = text
        self.messageId = messageId
        self.sentDate = sentDate
    }
}

extension Message: MessageType {
    
    // メッセージの送信者を返す
    var sender: SenderType {
        return Sender(id: user.senderId, displayName: user.displayName)
    }
    
    // メッセージのタイプを返す
    // 今回はテキストのみだが、画像やURLなども設定できる
    var kind: MessageKind {
        return .text(text)
    }
        
}
