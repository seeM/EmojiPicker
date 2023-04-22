//
//  CustomTextView.swift
//  EmojiPicker
//
//  Created by Wasim Lorgat on 2023/04/22.
//

import Cocoa

protocol CustomTextViewDelegate: AnyObject {
    func showPicker(_ textView: NSTextView)
}

class CustomTextView: NSTextView {
    weak var customDelegate: CustomTextViewDelegate?
    var shouldResignFirstResponder = true
    
    override func keyDown(with event: NSEvent) {
        super.keyDown(with: event)
        if event.keyCode == 41 && event.modifierFlags.intersection(.deviceIndependentFlagsMask) == .shift {
            shouldResignFirstResponder = false
            customDelegate?.showPicker(self)
            shouldResignFirstResponder = true
        }
    }
    
    override func resignFirstResponder() -> Bool {
        shouldResignFirstResponder && super.resignFirstResponder()
    }
}
