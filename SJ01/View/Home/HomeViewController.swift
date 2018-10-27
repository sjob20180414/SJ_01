//
//  HomeViewController.swift
//  SJ01
//
//  Created by Yudai Terashita on 2018/05/27.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: SuperViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var noticeTableView: UITableView!
    var testData: Array<Notice>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ＨＯＭＥ"
        
        self.testData = getTestData()
        
        setNavigationButton(vc: self, type: .home)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func noticeButtonTap(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Notice",bundle:nil)
        let view = storyboard.instantiateViewController(withIdentifier: "NoticeView") as! NoticeViewController
        self.present(UINavigationController(rootViewController: view),animated: true, completion: nil)
    }
    
    @IBAction func weeklyReportButtonTap(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "WeeklyReport",bundle:nil)
        let view = storyboard.instantiateViewController(withIdentifier: "WeeklyReportView")as! WeeklyReportViewController
        self.present(UINavigationController(rootViewController: view),animated: true, completion: nil)
    }
    
    @IBAction func chatButtonTap(_ sender: UIButton) {
        testDialog(sender: sender)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testData!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let notice = self.testData![indexPath.row] as Notice
        
        if notice.important == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeCell") as! NoticeCell
            cell.dateLabel.text = notice.date
            cell.messageLabel.text = notice.message
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImportantNoticeCell") as! ImportantNoticeCell
            cell.dateLabel.text = notice.date
            cell.messageLabel.text = notice.message
            return cell
        }
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

class NoticeCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class ImportantNoticeCell: UITableViewCell {
    @IBOutlet weak var importantLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class Notice: NSObject {
    var id = ""
    var important = 0
    var date = ""
    var message = ""
}

