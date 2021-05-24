//
//  AppDelegate.swift
//  tily
//
//  Created by évelyne on 2021-05-23.
//

import SwiftUI

@main
struct tilyPopover: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusBarItem: NSStatusItem?

    func applicationDidFinishLaunching(_ notification: Notification) {
        
        let contentView = ContentView()

        popover.behavior = .transient
        popover.animates = false
        popover.contentViewController = NSViewController()
        popover.contentViewController?.view = NSHostingView(rootView: contentView)
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = self.statusBarItem?.button {
             button.image = NSImage(systemSymbolName: "sparkles", accessibilityDescription: "tily")
             button.action = #selector(togglePopover(_:))
        }
        statusBarItem?.button?.action = #selector(AppDelegate.togglePopover(_:))
        Manager.shared.stop_process(process: "yabai")
        Manager.shared.stop_process(process: "Übersicht")
    }
    @objc func showPopover(_ sender: AnyObject?) {
        if let button = statusBarItem?.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    @objc func closePopover(_ sender: AnyObject?) {
        popover.performClose(sender)
    }
    @objc func togglePopover(_ sender: AnyObject?) {
        if popover.isShown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
    func applicationWillTerminate(_ notification: Notification) {
        Manager.shared.stop_process(process: "yabai")
        Manager.shared.stop_process(process: "Übersicht")
        applicationWillTerminate(notification)
    }
}


