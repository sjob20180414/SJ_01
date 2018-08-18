//
//  NoticeViewContrller.swift
//  SJ01
//
//  Created by Yudai Terashita on 2018/08/17.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import UIKit

class NoticeViewController: SuperViewController,UITableViewDelegate,UITableViewDataSource{
   
    

    
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var confirmationButtonView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "お知らせ"
        setNavigationButton(vc: self, type: .notice)
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tappedLeftBarButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeDetailCell") as! NoticeDetailCell
        return cell
    }
    
    
    func getTestData() -> Array<Notice> {
        var data: Array<Notice> = []
        let notice1 = Notice()
        let notice2 = Notice()
        
        notice1.id = ""
        notice1.important = 1
        notice1.date = "12月4日"
        notice1.message = "重要なメッセージ"
        
        notice2.id = ""
        notice2.important = 0
        notice2.date = "12月3日"
        notice2.message = "普通のメッセージ"
        
        data.append(notice1)
        data.append(notice2)
        
        return data
    }
    

}

class NoticeDetailCell: UITableViewCell {
//        @IBOutlet weak var dateLabel: UILabel!
//        @IBOutlet weak var messageLabel: UILabel!
    
        override func awakeFromNib() {
            super.awakeFromNib()
        }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
