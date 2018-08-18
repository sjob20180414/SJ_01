//
//  NoticeViewContrller.swift
//  SJ01
//
//  Created by Yudai Terashita on 2018/08/17.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//

import UIKit

class NoticeViewController: UIViewController {

    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    @IBOutlet weak var weeklyReportTableView: UITableView!
    @IBOutlet weak var confirmationButtonView: UIView!
    var testData: Array<WeeklyReportItem>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "お知らせ一覧"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
