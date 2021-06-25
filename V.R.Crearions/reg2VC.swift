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
    private let lblgen : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "GENDER :: "
        lbl.textAlignment = .center
        
        return lbl
    }()
    private let dipexp : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = ""
        lbl.textAlignment = .center
        
        return lbl
    }()
    private let lblexp : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "EXPRIENCE ::"
        lbl.textAlignment = .center
        
        return lbl
    }()
    private let lblskill : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Choose Your Skill :: "
        lbl.textAlignment = .center
        
        return lbl
    }()
    //picker
    private let pick = UIPickerView()
    private let skill = ["Wooden Craft","Paper Craft","Cooking","Painting","Sketching","Stiching"]
    //... dotes to control page
    private let pgCntrl: UIPageControl = {
        let pg = UIPageControl()
        pg.numberOfPages = 3
        pg.currentPage = 1
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
    
    private let exprnc: UIStepper = {
        let ex = UIStepper()
        ex.minimumValue = 0
        ex.maximumValue = 10
        ex.addTarget(self, action: #selector(handleSteeper), for: .valueChanged)
        return ex
    }()
    @objc func handleSteeper(){
        
        dipexp.text = exprnc.value.description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(pgCntrl)
        view.addSubview(exprnc)
        view.addSubview(tab)
        view.addSubview(gender)
        view.addSubview(lblexp)
        view.addSubview(lblgen)
        view.addSubview(lblskill)
        view.addSubview(pick)
        view.addSubview(dipexp)
        //title = "Personal Information - 2"
        pick.dataSource = self
        pick.delegate = self
        pick.backgroundColor = .white
        pick.layer.cornerRadius = 25
        tab.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        lblgen.frame = CGRect(x: 40,y: 70, width: view.width - 50, height: 50)
        gender.frame = CGRect(x: 30,y: lblgen.bottom + 20, width: view.width - 60 ,height:  70)
        lblexp.frame = CGRect(x: 40,y: gender.bottom + 20, width: view.width - 80, height: 50)
        exprnc.frame = CGRect(x: 30, y: lblexp.bottom + 20,width: view.width - 50 ,height: 150)
        dipexp.frame = CGRect(x: 60, y: lblexp.bottom + 5,width: view.width - 50 ,height: 50)
        lblskill.frame = CGRect(x: 40,y: exprnc.bottom + 20, width: view.width - 50, height: 50)
        pick.frame = CGRect(x: 20, y: lblskill.bottom + 20,width: view.width - 60 ,height:  100)
        pgCntrl.frame = CGRect(x: 40,y: pick.bottom + 20, width: view.width - 80, height: 80)
        let tabheight: CGFloat = view.safeAreaInsets.bottom + 50
        tab.frame = CGRect(x: 0,y: view.height - tabheight , width: view.width , height: tabheight)
    }


}
extension reg2VC: UITabBarDelegate
{
    func tcbbar(_ tabs: UITabBar, didSelect item: UITabBarItem){
        print(item.tag)
    }
}
extension reg2VC: UIPickerViewDelegate, UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)
        -> Int
    {
            return skill.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)  -> String?
    {
        return skill[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelect row: Int, inComponent component: Int)
    {
        print(skill[row])
    }
    
}
