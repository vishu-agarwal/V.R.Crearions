//
//  reg3Vc.swift
//  V.R.Crearions
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class reg3Vc: UIViewController {

    
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
