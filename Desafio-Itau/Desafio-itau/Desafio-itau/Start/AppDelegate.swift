//
//  AppDelegate.swift
//  Desafio-itau
//
//  Created by Kleiton Mendes on 11/08/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return start()
    }

}

extension AppDelegate {
    func start() -> Bool {
        
        window = UIWindow(frame: UIScreen.main.coordinateSpace.bounds)
        window?.makeKeyAndVisible()
        
        let navigation = UINavigationController(rootViewController: ReceiptFactory.make())
        window?.rootViewController = navigation
        return true
    }
}

