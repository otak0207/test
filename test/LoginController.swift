//
//  LoginController.swift
//  test
//
//  Created by Katsu on 2020/11/10.
//  Copyright © 2020 atrasc. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    //ログイン押下アクション
    @IBAction func login(_ sender: Any) {
        if (userInput.text != "") && (passwordInput.text != "") {
            //入力情報をUDに保存
            let ud = UserDefaults.standard
            ud.set(userInput.text, forKey: "userName")
            ud.set(passwordInput.text, forKey: "password")
            
            //保存後初期化
            passwordInput.text = ""
            
            //ホーム画面へ
            performSegue(withIdentifier: "goHome", sender: nil)
                
        //もしtextFieldに何も入力されてなければ
        }else {
            //アラート
            let alert = UIAlertController(title: "ユーザー名とパスワードの入力は必須です", message: "", preferredStyle: .alert)
            //アクション
            let action = UIAlertAction(title: "OK", style: .cancel)
            //アラートにアクションを追加する
            alert.addAction(action)
            //アラートを表示
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //入力例
        userInput.placeholder = "社員番号"
        passwordInput.placeholder = "コラボノートと同様"
        
        //クリアボタン 編集時表示
        userInput.clearButtonMode = UITextField.ViewMode.whileEditing
        passwordInput.clearButtonMode = UITextField.ViewMode.whileEditing
        
        //入力タイプ
        userInput.keyboardType = UIKeyboardType.numberPad
        passwordInput.keyboardType = UIKeyboardType.alphabet
        
        //実行タイプ
        passwordInput.returnKeyType = UIReturnKeyType.done
        
        //デリゲートをTextFieldに適用
        userInput.delegate = self
        passwordInput.delegate = self
        
    }
    
    //入力キーボードの実行押下
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        self.login(true)
        return true
    }
}
