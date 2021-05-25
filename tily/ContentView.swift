//
//  ContentView.swift
//  tily
//
//  Created by évelyne on 2021-05-23.
//

import SwiftUI
import Cocoa

struct ContentView: View {
    @State var status: Bool = false
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("tily ✨")
                    .font(.title)
                    .fontWeight(.bold)
                Divider()
                VStack(alignment: .leading) {
                    HStack {
                        Text("yabai controls")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        switch status {
                        case true:
                            Circle()
                                .foregroundColor(Color.green.opacity(0.75))
                                .frame(width: 10, height: 10)
                                .padding(.trailing, 5)
                        case false:
                            Circle()
                                .foregroundColor(Color.red.opacity(0.75))
                                .frame(width: 10, height: 10)
                                .padding(.trailing, 5)
                        }
                    }
                    HStack {
                        Text("start yabai")
                        Spacer()
                        Button(action: {
                            Manager.shared.startyabai(withConfig: nil)
                            status = true
                        }) {
                            Image(systemName: "macwindow")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    HStack {
                        Text("stop yabai")
                        Spacer()
                        Button(action: {
                            Manager.shared.stop_process(process: "yabai")
                            status = false
                        }) {
                            Image(systemName: "nosign")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    HStack {
                        Text("edit yabairc")
                        Spacer()
                        Button(action: {
                            _ = Manager.shared.openFile(path: "/Users/evelyn/.yabairc")
                        }) {
                            Image(systemName: "pencil.circle.fill")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                Divider()
                VStack(alignment: .leading) {
                    Text("übersicht controls")
                        .font(.title3)
                        .fontWeight(.semibold)
                    HStack {
                        Text("start übersicht")
                        Spacer()
                        Button(action: {
                            Manager.shared.openFile(path: "/Applications/Übersicht.app")
                        }) {
                            Image(systemName: "play.fill")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    HStack {
                        Text("stop übersicht")
                        Spacer()
                        Button(action: {
                            Manager.shared.stop_process(process: "Übersicht")
                        }) {
                            Image(systemName: "nosign")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                Divider()
                VStack(alignment: .leading) {
                    Text("debugging")
                        .font(.title3)
                        .fontWeight(.semibold)
                    HStack {
                        Text("restart dock")
                        Spacer()
                        Button(action: {
                            Manager.shared.stop_process(process: "Dock")
                        }) {
                            Image(systemName: "nosign")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    HStack {
                        Text("exit tily")
                        Spacer()
                        Button(action: {
                            NSApplication.shared.terminate(self)
                        }) {
                            Image(systemName: "xmark.circle.fill")
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                Divider()
            }
            Text("made by evelyn with 🤍")
                .font(.subheadline)
                .foregroundColor(Color.secondary)
        }
        .padding()
        .frame(width: 250, height: 250)
    }
}
