//
//  Reg1vc.swift
//  V.R.Crearions
//
//  Created by DCS on 19/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Reg1vc: UIViewController {

    private let profile:UIImagePickerController = {
        let prfl = UIImagePickerController()
        prfl.allowsEditing = false
        return prfl
    }()
    private let mytxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter UserName !"
        txt.textColor = .blue
        txt.textAlignment = .center
        txt.borderStyle = .roundedRect
        
        return txt
    }()
    private let mylbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter Email-Address Below !"
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    private let mytxtView:UITextView = {
        let txtView = UITextView()
        txtView.textColor = .blue
        txtView.textAlignment = .center
        
        return txtView
    }()
    private let dob:UIDatePicker = {
        let date = UIDatePicker()
        date.datePickerMode = .date
        date.timeZone = TimeZone(secondsFromGMT: 0)
        return date
    }()
    private let gender: UISegmentedControl = {
        let gen = UISegmentedControl()
        gen.insertSegment(withTitle:"Female",at:0,animated:true)
        gen.insertSegment(withTitle:"Male",at:1,animated:true)
        return gen
    }()
    private let loader: UIActivityIndicatorView = {
        let load = UIActivityIndicatorView()
        //load.style = .larger
        load.color = .white
        load.startAnimating()
        return load
    }()
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
    //end
    //toggle notification add label for it
    private let notify : UISwitch = {
        let bell = UISwitch()
        return bell
    }()
    //picker
    private let pick = UIPickerView()
    private let skill = ["Wooden Craft","Paper Craft","Cooking","Painting","Sketching","Stiching"]
    //at the end put progress
    private let progressing: UIProgressView = {
        let progress = UIProgressView()
        progress.setProgress(0.0, animated: true)
        progress.progressTintColor = .white
        return progress
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mytxt)
        view.addSubview(mylbl)
        view.addSubview(mytxtView)
        title = "Personal Imformation"
        //profile.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        mytxt.frame = CGRect(x:20,y:100,width:view.width - 40,height: 50)
        mylbl.frame = CGRect(x:20,y:mytxt.bottom + 10,width:view.width - 40,height: 50)
        mytxtView.frame = CGRect(x:20,y:mylbl.bottom + 5,width:view.width - 70,height: 50)
        
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
