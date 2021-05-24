//
//  Manager.swift
//  tily
//
//  Created by évelyne on 2021-05-23.
//

import Foundation

class Manager {
    static var shared = Manager()
    func startyabai(withConfig: URL?) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/local/bin/yabai")
        do {
            try task.run()
            print("[+] started yabai")
        } catch {
            print("[-] could not start yabai. (\(error.localizedDescription)")
        }
    }
    func stop_process(process: String) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/bin/killall")
        task.arguments = [process]
        do {
            try task.run()
            print("[+] stopped \(process). ")
        } catch {
            print("[-] could not stop \(process). (\(error.localizedDescription)")
        }
    }
    func openFile(path: String?) -> Bool {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/bin/open")
        task.arguments = ["-a", (path ?? "")]
        do {
            try task.run()
            print("[+] opened file \(String(describing: task.arguments?[1])).")
        } catch {
            print("[-] could not open file \(path). (\(error.localizedDescription)")
        }
        return true
    }
}
