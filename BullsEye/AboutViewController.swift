//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Vjeko on 21/09/2018.
//  Copyright © 2018 Vjeko. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
     @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
}
