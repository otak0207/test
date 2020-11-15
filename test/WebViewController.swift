//
//  WebViewController.swift
//  test
//
//  Created by Katsu on 2020/11/08.
//  Copyright © 2020 atrasc. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var profile: WKWebView!
    
    var getUrl : String?
    var userName = UserDefaults.standard.string(forKey: "userName")
    var password = UserDefaults.standard.string(forKey: "password")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: getUrl!) {
            //nilじゃない場合実行
            profile.navigationDelegate = self
            profile.load(URLRequest(url: url))
            //ロード開始
            view.addSubview(profile)
        }
    }
    
    func webView(_ profile: WKWebView, didFinish navigation: WKNavigation!) {
        let inName = "document.getElementById('ctl00_ContentPlaceHolder1_LoginCtrl1_TextBoxUserName').value = '"+userName!+"';"
        let inPassword = "document.getElementById('ctl00_ContentPlaceHolder1_LoginCtrl1_TextBoxPassword').value = '"+password!+"';"
        let scriptExe = "document.getElementById('ctl00_ContentPlaceHolder1_LoginCtrl1_ButtonLogin').click();"
        
        //テキストボックスにキーワードを入力する
        profile.evaluateJavaScript(inName, completionHandler: nil)
        profile.evaluateJavaScript(inPassword, completionHandler: nil)
        //実行する
        profile.evaluateJavaScript(scriptExe, completionHandler: nil)
    }
}
