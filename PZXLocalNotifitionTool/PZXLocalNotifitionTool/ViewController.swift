//
//  ViewController.swift
//  PZXLocalNotifitionTool
//
//  Created by pzx on 2023/2/17.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .sound , .badge]) { granted, error in
            
            
            
        }
        
    }


    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        
        
//        PZXUserNotificationCenterManager().SendNotification(title: "测试", subtitle: "测试+1", body: "222", categoryIdentifier: "category标识，操作策略", requestIdentifier: "", date: Date())
        
//        UserNotifications
        let content = UNMutableNotificationContent()
        
        content.title = "推送内容标题" //推送内容标题
        content.subtitle = "推送内容子标题" //推送内容子标题
        content.body = "推送内容body"// 推送内容body
        content.categoryIdentifier = "category标识，操作策略"  //category标识，操作策略
        
        
        if let imageURL = Bundle.main.url(forResource: "notifyImage", withExtension: "jpg") {
            do {
                let attachment = try UNNotificationAttachment(identifier: "imageAttachment", url: imageURL, options: nil)
                content.attachments = [attachment]
            } catch {
                print("The attachment was not loaded.")
            }
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let requestIdentifier = "UNUserNotificationCenter"

        
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        //将请求添加到发送中心
        UNUserNotificationCenter.current().add(request) { error in
            if error == nil {
                print("Time Interval Notification scheduled: \(requestIdentifier)")
            }
        }


       
    }
}

