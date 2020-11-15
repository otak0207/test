//
//  FormController.swift
//  test
//
//  Created by Katsu on 2020/11/15.
//  Copyright © 2020 atrasc. All rights reserved.
//

import UIKit

class FormController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var clubList: UITextField!
    @IBOutlet weak var pointSelect: UISegmentedControl!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var comment: UITextView!
    
    var club = ClubData() //クラブ情報
    var clubPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //クラブ情報
        club.setClubInfo()
        //picker情報
        clubPicker.delegate = self
        clubPicker.dataSource = self
        clubList.inputView = clubPicker
        
        //入力例
        phoneNumber.placeholder = "ハイフン無し電話番号"
        //クリアボタンボタン
        clubList.clearButtonMode = UITextField.ViewMode.never //表示させない
        phoneNumber.clearButtonMode = UITextField.ViewMode.whileEditing //編集時表示
        //入力タイプ
        phoneNumber.keyboardType = UIKeyboardType.phonePad
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return club.data.count
    }

    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return club.data[row].name
    }

    //UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        clubList.text = club.data[row].name
        clubList.endEditing(true)
    }
}
