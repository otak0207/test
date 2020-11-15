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
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //引き継ぎの表示
        label.text = name
        viewTitle.title = name
    }

    //データの引き継ぎ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let clubProfile = segue.destination as! WebViewController
            
        clubProfile.getUrl = url
    }
}
