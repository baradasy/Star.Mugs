//
//  AppDelegate.swift
//  MugCollector
//
//  Created by Sergey Timoshpolskiy on 16/08/2017.
//  Copyright © 2017 SJ Dvs. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    var window: UIWindow?

    override init() {
        super.init()
        
        // Firebase initialization
        FirebaseApp.configure()

    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        // Firebase Cloud Messaging delefate
        Messaging.messaging().delegate = self
        
        // Notifications user permission
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        // APNs: register for remote notifications
        application.registerForRemoteNotifications()
        
        return true
    }

    
    // MARK: - Firebase Messaging
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
 
        print("_ Received FCM Token: \(fcmToken)")


    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        var readableToken: String = ""
        for i in 0..<deviceToken.count {
            readableToken += String(format: "%02.2hhx", deviceToken[i] as CVarArg)
        }
        print("_ Received an APNs device token: \(readableToken)")
        
        if let fcmToken = Messaging.messaging().fcmToken {
            print("_ FCM token at this time: \(fcmToken)")
        }
        
        // Uncomment this line to manualy set APNs to FCM token
        // mapping when FCM swizzling is disabled or does not work correctly
        // Messaging.messaging().apnsToken = deviceToken
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Unable to register for remote notifications: \(error.localizedDescription)")
    }
    


}

