//
//  PrsnlInfoVC.swift
//  V.R.Crearions
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class reg2VC: UIViewController {
    
    private let gender: UISegmentedControl = {
        let gen = UISegmentedControl()
        gen.insertSegment(withTitle:"Female",at:0,animated:true)
        gen.insertSegment(withTitle:"Male",at:1,animated:true)
        return gen
    }()
    private let tab: UITabBar = {
        let tabview = UITabBar()
        let history = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        let dwnld = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        tabview.items = [dwnld,history]
        return tabview
    }()
    //picker
    private let pick = UIPickerView()
    private let skill = ["Wooden Craft","Paper Craft","Cooking","Painting","Sketching","Stiching"]
    //... dotes to control page
    private let pgCntrl: UIPageControl = {
        let pg = UIPageControl()
        pg.numberOfPages = 3
        pg.currentPage = 0
        pg.addTarget(self, action: #selector(handlePgCntrl), for: .valueChanged)
        return pg
    }()
    @objc func handlePgCntrl (){
        print(pgCntrl.currentPage)
        if pgCntrl.currentPage == 0
        {
            let vc = Reg1vc()
            
            navigationController?.pushViewController(vc, animated: true)
        }
        else if pgCntrl.currentPage == 1
        {
            let vc = reg2VC()
            
            navigationController?.pushViewController(vc, animated: true)
        }
        else if pgCntrl.currentPage == 2
        {
            let vc = reg3Vc()
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    private let loader: UIActivityIndicatorView = {
        let load = UIActivityIndicatorView()
        //load.style = .larger
        load.color = .white
        load.startAnimating()
        return load
    }()
    private let exprnc: UIStepper = {
        let ex = UIStepper()
        ex.minimumValue = 0
        ex.maximumValue = 10
        return ex
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(pgCntrl)
        view.addSubview(exprnc)
        view.addSubview(tab)
        view.addSubview(gender)
        tab.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        pgCntrl.frame = CGRect(x: 40,y: mytxtView.bottom + 5, width: view.width - 80, height: 60)
        let tabheight: CGFloat = view.safeAreaInsets.bottom + 40
        tab.frame = CGRect(x: 0,y: view.height - tabheight , width: view.width , height: tabheight)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension reg2VC: UITabBarDelegate{
    func tcbbar(_ tabs: UITabBar, didSelect item: UITabBarItem){
        print(item.tag)
    }
}
