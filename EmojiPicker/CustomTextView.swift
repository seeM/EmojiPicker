//
//  CustomTextView.swift
//  EmojiPicker
//
//  Created by Wasim Lorgat on 2023/04/22.
//

import Cocoa

protocol CustomTextViewDelegate: AnyObject {
    func textViewDidReceiveRightClick(_ textView: NSTextView)
}

class CustomTextView: NSTextView {
    weak var customDelegate: CustomTextViewDelegate?

    override func menu(for event: NSEvent) -> NSMenu? {
        if event.type == .rightMouseDown {
            customDelegate?.textViewDidReceiveRightClick(self)
            return nil
        }
        return super.menu(for: event)
    }
}

