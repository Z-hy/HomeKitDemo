//
//  MyHomeKit.swift
//  HomeKitDemo
//
//  Created by user on 2017/4/6.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import HomeKit

class MyHomeKit: NSObject,HMHomeManagerDelegate,HMHomeDelegate {
    
    var homeManager: HMHomeManager?
    
    func initMyHomeKit() {
        homeManager = HMHomeManager()
        homeManager?.delegate = self
    }
    
    //添加home
    func addHome(homeName: String) {
        homeManager?.addHome(withName: homeName, completionHandler: { (home, error) in
            
        })
    }
    
    //移除home
    func removeHome(home: HMHome) {
        homeManager?.removeHome(home, completionHandler: { (error) in
            
        })
    }
    
    // MARK: - HMHomeManagerDelegate
    func homeManager(_ manager: HMHomeManager, didAdd home: HMHome) {
        print("已经添加了home\(home)")
    }
    
    func homeManager(_ manager: HMHomeManager, didRemove home: HMHome) {
        print("已经移除了home\(home)")
    }
    
    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        print("已经获取到homes数据\(manager.homes)")
        NotificationCenter.default.post(name: Notification.Name("getHome"), object: nil, userInfo: nil)
    }
    
    func homeManagerDidUpdatePrimaryHome(_ manager: HMHomeManager) {
        print("已经更新了primaryhomes数据\(manager.primaryHome)")
    }

}
