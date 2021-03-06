//
//  Message.swift
//  FoodForFolks
//
//  Created by Cory L. Rooker on 5/3/19.
//  Copyright © 2019 Cory L. Rooker. All rights reserved.
//

import Foundation
import UIKit
import MessageKit

struct Member {
    let name: String
    let color: UIColor
}

struct Message {
    let member: Member
    let text: String
    let messageId: String
    let sendDate2:String
}

extension Message: MessageType {
    var sender: SenderType {
        return Sender(id: member.name, displayName: member.name)
    }
    
    var sentDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss ZZZZ"
        let new = dateFormatter.date(from: sendDate2)
        return new ?? Date()
    }
    
    var kind: MessageKind {
        return .text(text)
    }
}
