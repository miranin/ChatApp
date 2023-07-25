//
//  ConversationStruct.swift
//  UITinkoffHomework
//
//  Created by Tamirlan Aubakirov on 24.07.2023.
//

import UIKit


enum ConversationSection: Hashable, CaseIterable {
    case onlineSection
    case historySection
}

struct ConversationItem: Hashable {
    var nameTitle: String?
    var lastMessageTitle: String?
    var timeTitle: String?
    var image: UIImage?
}
