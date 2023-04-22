//
//  PopoverViewController.swift
//  EmojiPicker
//
//  Created by Wasim Lorgat on 2023/04/22.
//

import Cocoa

class PopoverViewController: NSViewController {
    @IBOutlet var tableView: NSTableView!
    
    let items = ["ask1", "ask2", "ask3", "ask4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension PopoverViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        items.count
    }
}

extension PopoverViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let view = tableView.makeView(withIdentifier: .init("popoverEmoji"), owner: self) as! NSTableCellView
        view.textField?.stringValue = items[row]
        return view
    }
}
