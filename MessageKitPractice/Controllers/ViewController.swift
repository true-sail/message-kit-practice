//
//  ViewController.swift
//  MessageKitPractice
//
//  Created by 家田真帆 on 2019/12/02.
//  Copyright © 2019 家田真帆. All rights reserved.
//

import UIKit
// ライブラリの読み込み
import MessageKit
// 送信ボタンを使えるようにする
import InputBarAccessoryView

// MessagesViewControllerでチャット画面を作成
class ViewController: MessagesViewController {
    
    // 送信されたメッセージを受信するための箱
    var messageList: [Message] = []

    override func viewDidLoad() {
        super.viewDidLoad()
            
            // 表示するおまじない
            messagesCollectionView.messagesDataSource = self
            messagesCollectionView.messagesLayoutDelegate = self
            messagesCollectionView.messagesDisplayDelegate = self
            
            messageInputBar.delegate = self

    }


}

extension ViewController: MessagesDataSource {
    
    // 自分の情報
    func currentSender() -> SenderType {
        let id = "1234"
        let name = "true-sail"
        return ChatUser(senderId: id, displayName: name)
    }
    
    // 各メッセージの情報
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        // 今回のはrowではなくてseection
        return messageList[indexPath.section]
    }
    
    // メッセージの件数
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageList.count
    }
    
    
}

// メッセージ入力欄や送信ボタンの設定
extension ViewController: InputBarAccessoryViewDelegate {
    // 送信ボタンがクリックされた時の処理
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        // 自分の情報を取得
        let me = self.currentSender() as! ChatUser // currentSender() : 現在のログインユーザーの情報を取得
        
        // Messageのインスタンス化（引数を入れる）
        let newMessage = Message(user: me, text: text, messageId: UUID().uuidString, sentDate: Date())
        
        // 全メッセージを持っている配列、messageListに新しいメッセージを追加
        messageList.append(newMessage)
        
        // 新しいメッセージを画面に表示
        messagesCollectionView.insertSections([messageList.count - 1]) // 配列は0から始まるlから-1
        
        // 送信後、メッセージ入力欄のメッセージを消す
        inputBar.inputTextView.text = ""
        
        
    }
}

extension ViewController: MessagesDisplayDelegate {
    

}

extension ViewController: MessagesLayoutDelegate {

}
