import UIKit
import CoreData


var arr_select = [false,false,false,false,false,false,false,false]


protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex_menu(_ index : Int32)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    /**
     *  Array to display menu options
     */
    
    //    @IBOutlet var tblMenuOptions : UITableView!
    
    /**
     *  Transparent button to hide menu
     */
    
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    @IBOutlet var tbl_menu:UITableView!
    
    /**
     *  Array containing menu options
     */
    
    var arrayMenuOptions = ["Home","My Chat","My Orders","Notification","Settings","Sign Out"]
    var arrayMenu_icons = ["homeMenu.png","chatMenu.png","orderMenu.png","notificationMenu.png","settingMenu.png","singOutMenu.png"]
    
    /**
     *  Menu button which was tapped to display the menu
     */
    
    var btnMenu : UIButton!
    
    /**
     *  Delegate of the MenuVC
     */
    
    var delegate : SlideMenuDelegate?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateArrayMenuOptions()
    }
    
    
    
    func updateArrayMenuOptions() {
        //        tblMenuOptions.reloadData()
    }
    
    @IBAction func btnProfile(_ button:UIButton!) {
        button.tag = 100
        self.onCloseMenuClick(button)
        
        NotificationCenter.default.post(name:NSNotification.Name(rawValue:"sidemenu"), object:100)
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!) {
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex_menu(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
            //                self.removeFromParent()
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let lblTitle : UILabel = cell.contentView.viewWithTag(100) as! UILabel
        let imgIcon : UIImageView = cell.contentView.viewWithTag(101) as! UIImageView
        let view_containter = cell.contentView.viewWithTag(1) as! UIView
                
        view_containter.isHidden = !arr_select[indexPath.row]
        
        lblTitle.text = arrayMenuOptions[indexPath.row]
        imgIcon.image = UIImage (named: arrayMenu_icons[indexPath.row])
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at:indexPath, animated:false)
        
        let btn = UIButton (type: UIButton.ButtonType.custom)
        btn.tag = indexPath.row
        self.onCloseMenuClick(btn)
        
        NotificationCenter.default.post(name:NSNotification.Name(rawValue:"sidemenu"), object:indexPath.row)
                
        for i in 0..<arrayMenuOptions.count {
            if i == indexPath.row {
                arr_select[i] = true
            } else {
                arr_select[i] = false
            }
        }
        tbl_menu.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
        
}



import UIKit

extension UIViewController:SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex_menu(_ index: Int32) {
        //        let topViewController : UIViewController = self.navigationController!.topViewController!
        //        print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
        case 0:
            print("Home\n", terminator: "")
            break
        case 1:
            print("Play\n", terminator: "")
            break
        default:
            print("default\n", terminator: "")
        }
    }
    
    func openViewControllerBasedOnIdentifier_menu(_ strIdentifier:String){
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        
        let topViewController : UIViewController = self.navigationController!.topViewController!
        
        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
            print("Same VC")
        } else {
            self.navigationController!.pushViewController(destViewController, animated: true)
        }
    }
    
    func defaultMenuImage_menu() -> UIImage {
        var defaultMenuImage_menu = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)
        
        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
        
        UIColor.white.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
        
        defaultMenuImage_menu = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return defaultMenuImage_menu;
    }
    
    @objc func onSlideMenuButtonPressed(_ sender : UIButton){
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex_menu(-1);
            
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.view.bringSubviewToFront(self.view)
        self.tabBarController?.tabBar.isHidden = true
        //        self.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
    }
}


extension CALayer {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: thickness)
            
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.bounds.height - thickness,  width: UIScreen.main.bounds.width, height: thickness)
            
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0,  width: thickness, height: self.bounds.height)
            
        case UIRectEdge.right:
            border.frame = CGRect(x: self.bounds.width - thickness, y: 0,  width: thickness, height: self.bounds.height)
        default:
            print("nothing")
        }
        
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
    
}

extension UIViewController {
    func sameVC(_ storyboardName:String,_ identifier:String) -> Bool {
        let storyBoard = UIStoryboard(name:storyboardName, bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: identifier)
        
        let class_name = "\(viewController.classForCoder)"
        let class_name_now = "\(UIApplication.topViewController()!.classForCoder)"
        
        if class_name == class_name_now {
            return true
        } else {
            return false
        }
        
    }

}

extension UIApplication {
    
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            
            if let top = moreNavigationController.topViewController, top.view.window != nil {
                return topViewController(base: top)
            } else if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}



