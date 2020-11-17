//
//  FormCheckController.swift
//  test
//
//  Created by Katsu on 2020/11/17.
//  Copyright © 2020 atrasc. All rights reserved.
//

import UIKit

class FormCheckController: UIViewController {

    @IBOutlet weak var checkClubName: UILabel!
    @IBOutlet weak var checkPoint: UILabel!
    @IBOutlet weak var checkPhoneNumber: UILabel!
    @IBOutlet weak var checkFree: UITextView!
    
    var clubName : String?
    var point : String?
    var phoneNumber : String?
    var freeSpace : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //引き継ぎの表示
        checkClubName.text = clubName
        checkPoint.text = point
        checkPhoneNumber.text = phoneNumber
        checkFree.text = freeSpace
        
        //TextViewの編集不可
        checkFree.isEditable = false
    }

    //キャンセルボタン押下時
    @IBAction func closeModal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //OKボタン押下(通知後ホームへ遷移)
}
