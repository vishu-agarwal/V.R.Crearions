//
//  PrsnlInfoVC.swift
//  V.R.Crearions
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class reg2VC: UIViewController {

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
    //picker
    private let pick = UIPickerView()
    private let skill = ["Wooden Craft","Paper Craft","Cooking","Painting","Sketching","Stiching"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
