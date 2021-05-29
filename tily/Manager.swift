//
//  Manager.swift
//  tily
//
//  Created by évelyne on 2021-05-23.
//

import Foundation

final class Manager {
    static var shared = Manager()
    
    func getPath() -> [String]? {
        let pathsData = FileManager.default.contents(atPath: "/etc/paths") ?? Data()
        if var pathsData = String(data: pathsData, encoding: .utf8) {
            pathsData = pathsData.trimmingCharacters(in: .newlines)
            return pathsData.components(separatedBy: "\n")
        }
        return []
    }
    func findBinary(bin: String, withPath: [String]?) -> String {
        var retPath: String = ""
        print("[*] passing through /etc/paths to find \(bin)")
        for path in withPath ?? [] {
            let binaryPath = path.appending("/\(bin)")
            if FileManager.default.fileExists(atPath: binaryPath) {
                print("[+] found binary in", path)
                retPath = binaryPath
            }
        }
        return retPath
    }
    
    func startyabai(withConfig: URL?) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: findBinary(bin: "yabai", withPath: getPath()))
        task.launch()
        print("[+] started yabai")
    }
    func stop_process(process: String) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/bin/killall")
        task.arguments = [process]
        do {
            try task.run()
            print("[*] stopped \(process). ")
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
            print("[-] could not open file \(String(describing: path)). (\(error.localizedDescription)")
        }
        return true
    }
}
