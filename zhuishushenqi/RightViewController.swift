//
//  RightViewController.swift
//  zhuishushenqi
//
//  Created by caonongyun on 16/9/16.
//  Copyright © 2016年 CNY. All rights reserved.
//

import UIKit

class RightViewController: UITableViewController {

    var titles:[String]?
    
    var images:[String]?

    override init(style: UITableViewStyle) {
        super.init(style: style)
        let scale = SideViewController.sharedInstance.leftOffSetXScale
        self.tableView.frame = CGRectMake(ScreenWidth*scale + 20, 0, ScreenWidth*(1-scale) - 20, ScreenHeight)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titles = ["搜索","排行榜","主题书单","分类","听书专区","随机看书"]
        images = ["rsm_icon_0","rsm_icon_3","rsm_icon_4","rsm_icon_5","rsm_icon_6","rsm_icon_7"]
        tableView.backgroundColor  = UIColor(red: 0.211, green: 0.211, blue: 0.211, alpha: 1.00)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        automaticallyAdjustsScrollViewInsets = false
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIden:String = "cellIden"
        var cell:RightTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIden) as? RightTableViewCell
        if cell == nil{
            cell = RightTableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: cellIden)
            cell?.selectionStyle = .None
        }
        
        cell?.backgroundColor = UIColor ( red: 0.16, green: 0.16, blue: 0.16, alpha: 1.0 )
        cell?.imageView?.image = UIImage(named: images![indexPath.row])
        cell?.textLabel?.text = titles![indexPath.row]
        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == 0 {//搜索
            
        }else if indexPath.row == 1 {//排行榜
            let rankVC = RankingViewController()
            self.navigationItem.backBarButtonItem?.tintColor = UIColor ( red: 0.7235, green: 0.0, blue: 0.1146, alpha: 1.0 )
            SideViewController.sharedInstance.navigationController?.pushViewController(rankVC, animated: true)
        }
    }
}


