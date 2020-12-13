//
//  FormController.swift
//  test
//
//  Created by Katsu on 2020/11/15.
//  Copyright © 2020 atrasc. All rights reserved.
//

import UIKit

class FormController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var clubList: UITextField!
    @IBOutlet weak var pointSelect: UISegmentedControl!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var comment: UITextView!
    
    var club = ClubData() //クラブ情報
    var clubPicker = UIPickerView()
    var point : String?
    var selectClub : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //クラブ情報
        club.setClubInfo()
        clubCtl()
        //連絡先情報
        phoneCtl()
        //コメントエリア情報
        commentCtl()
    }
    
    func clubCtl(){
        //初期情報確認
        if selectClub == nil{
            //picker情報付与
            clubPicker.delegate = self
            clubPicker.dataSource = self
            clubList.inputView = clubPicker
        }
        else {
            //引き継ぎ情報設定と編集不可
            clubList.text = club.data[selectClub!].name
            clubList.isEnabled = false
        }

        //クリアボタン
        clubList.clearButtonMode = UITextField.ViewMode.never //表示させない
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
    
    //UISegmentedControlが選択された時
    @IBAction func tapPointSelect(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            point = "使用する"
            break
        case 1:
            point = "使用しない"
            break
        default:
            break
        }
    }
    
    //連絡先情報
    func phoneCtl(){
        // ツールバー生成
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        // スタイルを設定
        toolBar.barStyle = UIBarStyle.default
        // 画面幅に合わせてサイズを変更
        toolBar.sizeToFit()
        // 決定ボタンを右に配置するためのスペース?
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        // 決定ボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(FormController.commit))
        // スペース、決定ボタンを右側に配置
        toolBar.items = [spacer, commitButton]
        // textViewのキーボードにツールバーを設定
        phoneNumber.inputAccessoryView = toolBar
        
        //入力例
        phoneNumber.placeholder = "ハイフン無し電話番号"
        //入力タイプ
        phoneNumber.keyboardType = UIKeyboardType.phonePad
        //編集表示有無
        phoneNumber.clearButtonMode = UITextField.ViewMode.whileEditing //編集時表示
    }
    
    //コメントエリア情報
    func commentCtl(){
        // ツールバー生成
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        // スタイルを設定
        toolBar.barStyle = UIBarStyle.default
        // 画面幅に合わせてサイズを変更
        toolBar.sizeToFit()
        // 決定ボタンを右に配置するためのスペース?
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        // 決定ボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(FormController.commit))
        // スペース、決定ボタンを右側に配置
        toolBar.items = [spacer, commitButton]
        // textViewのキーボードにツールバーを設定
        comment.inputAccessoryView = toolBar
        
        //入力タイプ
        comment.keyboardType = UIKeyboardType.namePhonePad
        
        //コメント欄のレイアウト
        comment.layer.borderColor = UIColor.lightGray.cgColor
        comment.layer.borderWidth = 1.0
        comment.layer.cornerRadius = 5.0
        comment.layer.masksToBounds = true
    }
    //入力キーボードの実行押下時(コメントエリア)
    @objc func commit() {
        self.view.endEditing(true)
    }
    
    //送信ボタン押下時
    @IBAction func send(_ sender: Any) {
        // 次の画面へ移動
        performSegue(withIdentifier: "sendCheck", sender: nil)
    }
    //データの引き継ぎ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sendCheck = segue.destination as! FormCheckController
            
        sendCheck.clubName = clubList.text
        sendCheck.point = point
        sendCheck.phoneNumber = phoneNumber.text
        sendCheck.freeSpace = comment.text
    }
    
    //以下キーボードのアクション(出現時に画面をスクロール)
}
