//
//  WeeklyReportViewController.swift
//  SJ01
//
//  Created by 松井康太郎 on 2018/08/04.
//  Copyright © 2018年 松井康太郎. All rights reserved.
//
import Foundation
import UIKit

class WeeklyReportViewController: SuperViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    @IBOutlet weak var weeklyReportTableView: UITableView!
    @IBOutlet weak var confirmationButtonView: UIView!
    var testData: Array<WeeklyReportItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "週報編集"
        self.testData = testWeeklyReportItem()
        
        self.weeklyReportTableView.delegate = self
        self.weeklyReportTableView.rowHeight = UITableViewAutomaticDimension
        self.weeklyReportTableView.estimatedRowHeight = 10000
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(tapped(_:)))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        
        self.configureObserver()
        
        setNavigationButton(vc: self, type: .weeklyReport)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tappedLeftBarButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func configureObserver() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func removeObserver() {
        let notification = NotificationCenter.default
        notification.removeObserver(self)
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: Notification?) {
        guard let userInfo = notification?.userInfo as? [String: Any] else {
            return
        }
        guard let keyboardInfo = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        guard let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        let keyboardSize = keyboardInfo.cgRectValue.size
        UIView.animate(withDuration: duration, animations: {
            let height = keyboardSize.height - self.confirmationButtonView.frame.height
            self.viewConstraint.constant = height
        })
    }
    
    @objc func keyboardWillHide(notification: Notification?) {
        let duration: TimeInterval? = notification?.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? Double
        UIView.animate(withDuration: duration!, animations: { () in
            self.viewConstraint.constant = 0
        })
    }
    
    func textViewDidChange(_ textView: UITextView) {
        UIView.performWithoutAnimation {
            self.weeklyReportTableView.beginUpdates()
            self.weeklyReportTableView.endUpdates()
            if let str = textView.text {
                self.testData![textView.tag].text = str
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.testData!.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weeklyItem = self.testData![indexPath.row]
        
        switch weeklyItem.inputType {
        case InputType.titleOmly.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyReportTitleOnlyTypeCell") as! WeeklyReportTitleOnlyTypeCell
            cell.title.text = "【" + weeklyItem.title + "】"
            return cell
        case InputType.titleAndText.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyReportTitleAndTextTypeCell") as! WeeklyReportTitleAndTextTypeCell
            cell.title.text = "【" + weeklyItem.title + "】"
            cell.textView.delegate = self
            cell.textView.tag = indexPath.row
            cell.textView.text = weeklyItem.text
            return cell
        case InputType.text.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyReportTextTypeCell") as! WeeklyReportTextTypeCell
            cell.itemLabel.text = weeklyItem.title
            cell.textView.delegate = self
            cell.textView.tag = indexPath.row
            cell.textView.text = weeklyItem.text
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func testWeeklyReportItem() -> Array<WeeklyReportItem> {
        var data: Array<WeeklyReportItem> = []
        let weeklyItem1 = WeeklyReportItem()
        weeklyItem1.id = "a"
        weeklyItem1.order = 0
        weeklyItem1.title = "作業現場"
        weeklyItem1.inputType = InputType.titleOmly.rawValue
        data.append(weeklyItem1)
        
        let weeklyItem2 = WeeklyReportItem()
        weeklyItem2.id = "b"
        weeklyItem2.order = 1
        weeklyItem2.title = "場所"
        weeklyItem2.inputType = InputType.text.rawValue
        data.append(weeklyItem2)
        
        let weeklyItem3 = WeeklyReportItem()
        weeklyItem3.id = "c"
        weeklyItem3.order = 2
        weeklyItem3.title = "最寄り駅"
        weeklyItem3.inputType = InputType.text.rawValue
        data.append(weeklyItem3)

        let weeklyItem4 = WeeklyReportItem()
        weeklyItem4.id = "d"
        weeklyItem4.order = 3
        weeklyItem4.title = "会社"
        weeklyItem4.inputType = InputType.text.rawValue
        data.append(weeklyItem4)
        
        let weeklyItem5 = WeeklyReportItem()
        weeklyItem5.id = "e"
        weeklyItem5.order = 4
        weeklyItem5.title = "担当営業"
        weeklyItem5.inputType = InputType.titleAndText.rawValue
        data.append(weeklyItem5)
        
        let weeklyItem6 = WeeklyReportItem()
        weeklyItem6.id = "f"
        weeklyItem6.order = 5
        weeklyItem6.title = "業務内容"
        weeklyItem6.inputType = InputType.titleAndText.rawValue
        data.append(weeklyItem6)
        
        let weeklyItem7 = WeeklyReportItem()
        weeklyItem7.id = "g"
        weeklyItem7.order = 6
        weeklyItem7.title = "使用スキル"
        weeklyItem7.inputType = InputType.titleOmly.rawValue
        data.append(weeklyItem7)
        
        let weeklyItem8 = WeeklyReportItem()
        weeklyItem8.id = "h"
        weeklyItem8.order = 7
        weeklyItem8.title = "OS"
        weeklyItem8.inputType = InputType.text.rawValue
        data.append(weeklyItem8)
        
        let weeklyItem9 = WeeklyReportItem()
        weeklyItem9.id = "i"
        weeklyItem9.order = 8
        weeklyItem9.title = "DB"
        weeklyItem9.inputType = InputType.text.rawValue
        data.append(weeklyItem9)
        
        let weeklyItem10 = WeeklyReportItem()
        weeklyItem10.id = "j"
        weeklyItem10.order = 9
        weeklyItem10.title = "言語"
        weeklyItem10.inputType = InputType.text.rawValue
        data.append(weeklyItem10)
        
        let weeklyItem11 = WeeklyReportItem()
        weeklyItem11.id = "k"
        weeklyItem11.order = 10
        weeklyItem11.title = "MW"
        weeklyItem11.inputType = InputType.text.rawValue
        data.append(weeklyItem11)
        
        let weeklyItem12 = WeeklyReportItem()
        weeklyItem12.id = "l"
        weeklyItem12.order = 11
        weeklyItem12.title = "ツール"
        weeklyItem12.inputType = InputType.text.rawValue
        data.append(weeklyItem12)
        
        let weeklyItem13 = WeeklyReportItem()
        weeklyItem13.id = "m"
        weeklyItem13.order = 12
        weeklyItem13.title = "チーム構成"
        weeklyItem13.inputType = InputType.titleOmly.rawValue
        data.append(weeklyItem13)
        
        let weeklyItem14 = WeeklyReportItem()
        weeklyItem14.id = "n"
        weeklyItem14.order = 14
        weeklyItem14.title = "人数"
        weeklyItem14.inputType = InputType.text.rawValue
        data.append(weeklyItem14)
        
        let weeklyItem15 = WeeklyReportItem()
        weeklyItem15.id = "o"
        weeklyItem15.order = 15
        weeklyItem15.title = "役割"
        weeklyItem15.inputType = InputType.text.rawValue
        data.append(weeklyItem15)
        
        let weeklyItem16 = WeeklyReportItem()
        weeklyItem16.id = "p"
        weeklyItem16.order = 16
        weeklyItem16.title = "今月の想定勤務時間"
        weeklyItem16.inputType = InputType.titleAndText.rawValue
        data.append(weeklyItem16)
        
        let weeklyItem18 = WeeklyReportItem()
        weeklyItem18.id = "q"
        weeklyItem18.order = 17
        weeklyItem18.title = "備考（業務に関する）"
        weeklyItem18.inputType = InputType.titleAndText.rawValue
        data.append(weeklyItem18)
        
        let weeklyItem19 = WeeklyReportItem()
        weeklyItem19.id = "r"
        weeklyItem19.order = 18
        weeklyItem19.title = "個人報告（休暇等）"
        weeklyItem19.inputType = InputType.titleAndText.rawValue
        data.append(weeklyItem19)
        
        return data
    }
}

class WeeklyReportTitleOnlyTypeCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
}

class WeeklyReportTitleAndTextTypeCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textView.layer.borderColor = UIColor.lightGray.cgColor
        self.textView.layer.borderWidth = 1
        self.textView.layer.cornerRadius = 5.0
        self.textView.layer.masksToBounds = true
    }
}

class WeeklyReportTextTypeCell: UITableViewCell {
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.textView.layer.borderColor = UIColor.lightGray.cgColor
        self.textView.layer.borderWidth = 1
        self.textView.layer.cornerRadius = 5.0
        self.textView.layer.masksToBounds = true
    }
}

class WeeklyReportNumberTypeCell: UITableViewCell {
    
}
