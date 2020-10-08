//
//  TestAppApp.swift
//  TestApp
//
//  Created by Roman on 08.10.2020.
//

import SwiftUI

@main
struct TestAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}