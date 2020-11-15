//
//  ViewController.swift
//  test
//
//  Created by Katsu on 2020/10/15.
//  Copyright © 2020 atrasc. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var club = ClubData() //クラブ情報
    var selectName : String? //選択結果 クラブ名
    var selectUrl : String? //選択結果 クラブURL

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //クラブ情報取得
        club.setClubInfo()
    }
        
    //一覧セルの数取得
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return club.data.count
    }
    
    //一覧制御
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let clubCell = tableView.dequeueReusableCell(withIdentifier: "ClubTable", for: indexPath)
            
        // セルに表示する値を設定する
        clubCell.textLabel?.text = club.data[indexPath.row].name
            
        return clubCell
    }
    
    //セル上にカーソル
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        //カーソル上の情報を取得
        selectName = club.data[indexPath.row].name
        selectUrl = club.data[indexPath.row].url
    }
    
    //セル選択時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: false)
        //tableView.scrollToRow(at: IndexPath(row: club.count - 1, section: 0), at: UITableView.ScrollPosition.bottom, animated: true)
            
        // 次の画面へ移動
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    //データの引き継ぎ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let clubSub = segue.destination as! ClubViewController
            
        clubSub.name = selectName
        clubSub.url = selectUrl
    }
}
