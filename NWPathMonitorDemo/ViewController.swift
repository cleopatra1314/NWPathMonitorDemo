//
//  ViewController.swift
//  NWPathMonitorDemo
//
//  Created by cleopatra on 2023/12/29.
//

import UIKit
import Network

class ViewController: UIViewController {
    
    let monitor = NWPathMonitor()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkInternet()
        print("網路連線狀態", monitor.currentPath.status)
    }

    func checkInternet() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("⭕️ internet connected successfully.")
                
                if path.usesInterfaceType(.wifi) {
                    print("⭕️ Wifi connected successfully.")
                } else if path.usesInterfaceType(.cellular) {
                    print("⭕️ Cellular connected.")
                } else if path.usesInterfaceType(.wiredEthernet) {
                    print("⭕️ WiredEthernet connected.")
                } else {
                    print("⭕️ Other internet connected.")
                }
                print("網路連線狀態", self.monitor.currentPath.status)
                
            } else {
                print("❌ no internet connected.")
            }
        }
        monitor.start(queue: DispatchQueue.global())
    }

}

