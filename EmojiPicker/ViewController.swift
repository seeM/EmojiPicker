//
//  ViewController.swift
//  EmojiPicker
//
//  Created by Wasim Lorgat on 2023/04/22.
//

import Cocoa

class ViewController: NSViewController, CustomTextViewDelegate {

    @IBOutlet weak var textView: CustomTextView! {
        didSet {
            textView.customDelegate = self
        }
    }

    private lazy var popover: NSPopover = {
        let popover = NSPopover()
        popover.behavior = .transient
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let popoverViewController = storyboard.instantiateController(withIdentifier: "popoverViewController") as! NSViewController
        popover.contentViewController = popoverViewController
        return popover
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func textViewDidReceiveRightClick(_ textView: NSTextView) {
        let event = NSApp.currentEvent!
        let locationInView = textView.convert(event.locationInWindow, from: nil)
        let locationInTextView = NSPoint(x: locationInView.x, y: textView.bounds.height - locationInView.y)

        if let textContainer = textView.textContainer,
           textView.layoutManager?.characterIndex(for: locationInTextView, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil) != NSNotFound {
            popover.show(relativeTo: NSZeroRect, of: textView, preferredEdge: .maxX)
        }
    }
}
