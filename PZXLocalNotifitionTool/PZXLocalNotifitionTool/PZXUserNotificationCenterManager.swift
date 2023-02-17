//
//  PZXUserNotificationCenterManager.swift
//  PZXLocalNotifitionTool
//
//  Created by pzx on 2023/2/17.
//

import UIKit
import UserNotifications

class PZXUserNotificationCenterManager: NSObject {
    
    func SendNotification(title:String?,subtitle:String?,body:String,categoryIdentifier:String?,requestIdentifier:String,date:Date){
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .sound , .badge]) { granted, error in
            
            
            let content = UNMutableNotificationContent()
            
            content.title = title ?? ""//推送内容标题
            content.subtitle = subtitle ?? "" //推送内容子标题
            content.body = body// 推送内容body
            content.categoryIdentifier = categoryIdentifier ?? ""  //category标识，操作策略
            
            
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            //周三，13点触发
//            var components:DateComponents = DateComponents()
//            components.weekday = 4;//周三
//            components.hour = 13;//13点
            var calendar = Calendar.init(identifier: .gregorian)
            var DateComponents = calendar.dateComponents([.year, .month, .day], from: date)

            let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents, repeats: false)

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

}
