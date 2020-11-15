//
//  ClubData.swift
//  test
//
//  Created by Katsu on 2020/11/09.
//  Copyright © 2020 atrasc. All rights reserved.
//

import UIKit

class ClubData: NSObject {

    //構造体定義
    struct Club {
        var name:String
        var url:String
        
        init(name: String, url: String){
            self.name = name
            self.url = url
        }
    }
    
    var data:[Club] = []
    
    func setClubInfo(){
        data.append(Club(name: "野球", url: "https://www.google.co.jp"))
        data.append(Club(name: "ゴルフ", url: ""))
        data.append(Club(name: "テニス", url: ""))
        data.append(Club(name: "ボウリング", url: ""))
        data.append(Club(name: "スキー・スノーボード", url: ""))
        data.append(Club(name: "サッカー・フットサル", url: "https://www.comm.atrasc.co.jp/cbnote/LoginForm.aspx?docid=2033&pageid=12267&normdoc=true&uname=66636653A4294C308C00403800300031"))
        data.append(Club(name: "ランニング", url: ""))
        data.append(Club(name: "ウォータースポーツ", url: ""))
        data.append(Club(name: "バスケットボール", url: ""))
        data.append(Club(name: "バドミントン", url: ""))
        data.append(Club(name: "釣り", url: ""))
        data.append(Club(name: "カート", url: ""))
        data.append(Club(name: "ビリヤード・ダーツ", url: ""))
        data.append(Club(name: "馬術", url: ""))
        data.append(Club(name: "鉄道愛好会", url: ""))
        data.append(Club(name: "旅行", url: ""))
        data.append(Club(name: "映画鑑賞", url: ""))
        data.append(Club(name: "音楽鑑賞", url: ""))
        data.append(Club(name: "芸術鑑賞", url: ""))
        data.append(Club(name: "写真", url: ""))
        data.append(Club(name: "料理", url: ""))
        data.append(Club(name: "工芸", url: ""))
        data.append(Club(name: "軽音", url: ""))
        data.append(Club(name: "卓球", url: ""))
        data.append(Club(name: "プログラミング", url: ""))
        data.append(Club(name: "新潟", url: ""))
        data.append(Club(name: "大阪", url: ""))
        data.append(Club(name: "福岡", url: ""))
        data.append(Club(name: "小山", url: ""))
        data.append(Club(name: "ATRASCE", url: ""))
        data.append(Club(name: "名古屋", url: ""))
    }
}
