//
//  reg3Vc.swift
//  V.R.Crearions
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class reg3Vc: UIViewController {

    private let dob:UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.timeZone = TimeZone(secondsFromGMT: 0)
        return date
    }()
    
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
    //rating
    private let rating : UISlider = {
        let slide = UISlider()
        slide.maximumValue = 10
        slide.minimumValue = 1
        slide.addTarget(self, action: #selector(rate), for: .valueChanged)
        return slide
    }()
    @objc func rate(){
        let res = Int(rating.value)
        disprate.text = String(res)
        
    }
    private let disprate : UILabel = {
        let disp = UILabel()
        disp.font = UIFont.systemFont(ofSize: 15.0)
        disp.textColor = .white
        disp.textAlignment = .center
        return disp
    }()
    private let mybtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("NEXT", for: .normal)
        btn.addTarget(self, action: #selector(nextfunc), for: .touchUpInside)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        return btn
    }()
    //end
    //toggle notification add label for it
    private let notify : UISwitch = {
        let bell = UISwitch()
        return bell
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        pgCntrl.frame = CGRect(x: 40,y: mytxtView.bottom + 5, width: view.width - 80, height: 60)
    }

}
