//
//  ViewController.swift
//  NotiEx
//
//  Created by sandy on 30/07/2019.
//  Copyright © 2019 kys. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge
            ], completionHandler: {didAllow, Error in
                // compeletion handler에서 ui 변경
                OperationQueue.main.addOperation {
                    self.statusLabel.text = didAllow.description
                }
        })
    }
    
    //MARK: Actions
    @IBAction func sendNotifcation(_ sender: UIButton) {
        // make a notification
        let notification = UNMutableNotificationContent()
        notification.title = "MyNotification"
        notification.body = "Notification Test Messsage"
        notification.badge = 1
        
        // make a trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        // make a request
        let request = UNNotificationRequest(identifier: "timeout", content: notification, trigger: trigger)
        
        // register the request
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}

