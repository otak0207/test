//
//  ClubViewController.swift
//  test
//
//  Created by Katsu on 2020/10/29.
//  Copyright © 2020 atrasc. All rights reserved.
//

import UIKit

class ClubViewController: UIViewController {

    @IBOutlet weak var label:UILabel!
    @IBOutlet weak var viewTitle: UINavigationItem!
    @IBOutlet weak var profileView: UIButton!
    
    var name : String?
    var url : String?
    var targetRow : Int?
    var sendFlg : Int?
    
    //送信タイプ
    let SENDTYPE_PROFILE = 1
    let SENDTYPE_ACTION = 2
    let SENDTYPE_FORM = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //初期化
        sendFlg = 0
        //引き継ぎの表示
        label.text = name
        viewTitle.title = name
    }

    //クラブ紹介画面
    @IBAction func profileSend(_ sender: Any) {
        sendFlg = SENDTYPE_PROFILE
        // 次の画面へ移動
        performSegue(withIdentifier: "sendProfile", sender: nil)
    }
    
    @IBAction func formSend(_ sender: Any) {
        sendFlg = SENDTYPE_FORM
        // 次の画面へ移動
        performSegue(withIdentifier: "sendForm", sender: nil)
    }
    
    //データの引き継ぎ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch sendFlg {
        case SENDTYPE_PROFILE:
            //クラブ紹介画面用
            let clubProfile = segue.destination as! WebViewController
                
            clubProfile.getUrl = url
        case SENDTYPE_ACTION:
            print("活動情報")
        case SENDTYPE_FORM:
            let form = segue.destination as! FormController
                
            form.selectClub = targetRow
        default:
            print("sonomama")
        }
    }
}
