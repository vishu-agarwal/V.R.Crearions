//
//  reg3Vc.swift
//  V.R.Crearions
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class reg3Vc: UIViewController {
    private let mylbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Choose Date To Attend Seminar :: "
        lbl.textAlignment = .center
        lbl.textColor = .white
        
        return lbl
    }()
    private let lblprfl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Keep Profile Public ::  "
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    private let semDate:UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.timeZone = TimeZone(secondsFromGMT: 0)
        //date.textcolor = .white
        date.backgroundColor = .white
        return date
    }()
    
    //... dotes to control page
    private let pgCntrl: UIPageControl = {
        let pg = UIPageControl()
        pg.numberOfPages = 3
        pg.currentPage = 2
        //pg.backgroundColor = .gray
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
        DispatchQueue.main.async {
            self.loader.isHidden = !self.loader.isHidden
            self.loader.isHidden ? self.loader.stopAnimating() : self.loader.startAnimating()
        }
        
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
    @objc func nextfunc()
    {
        let vc = reg41vc()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    //end
    private let loader: UIActivityIndicatorView = {
        let load = UIActivityIndicatorView()
        
        load.color = .white
       // btn.addTarget(self, action: #selector(nextfunc), for: .touchUpInside)
        load.startAnimating()
        return load
    }()
    //toggle notification add label for it
    private let notify : UISwitch = {
        let bell = UISwitch()
        return bell
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mybtn)
        view.addSubview(loader)
        view.addSubview(pgCntrl)
        view.addSubview(rating)
        //view.addSubview(semDate)
        view.addSubview(notify)
        view.addSubview(mylbl)
        view.backgroundColor = .black
        //title = "Basic Information"
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidLayoutSubviews() {
        mylbl.frame = CGRect(x: 35,y:100, width: view.width - 40, height: 30)
       // semDate.frame = CGRect(x: 20,y: mylbl.bottom + 10, width: view.width - 40, height: 70)
        lblprfl.frame = CGRect(x: 30,y: mylbl.bottom + 20, width: view.width - 40, height: 30)
        //notify.frame = CGRect(x: 40,y: semDate.bottom + 15, width: view.width - 80, height: 50)
        //rating.frame = CGRect(x: 20,y: lblprfl.bottom + 10, width: view.width - 70, height: 50)
        //loader.frame = CGRect(x: 40,y: rating.bottom + 10, width:  view.width - 30, height: 50)
        //mybtn.frame = CGRect(x: 30, y: loader.bottom + 10,width: view.width - 20, height: 70)
        pgCntrl.frame = CGRect(x: 40,y: mybtn.bottom + 30, width: view.width - 10, height: 30)
    }

}
