//
//  ViewController.swift
//  V.R.Crearions
//
//  Created by DCS on 19/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let vr :UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "v.r.creation" )

        return img
    
        
    }()
    private let mylbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome! To V.R. Creations. "
        lbl.textAlignment = .center
        
        return lbl
    }()
    private let mybtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Register", for: .normal)
        btn.addTarget(self, action: #selector(reg), for: .touchUpInside)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 50
        return btn
    }()
    @objc func reg()
    {
        let vc = Reg1vc()
        print("clicked!")
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "V.R. creations"
        view.addSubview(vr)
        view.addSubview(mylbl)
        view.addSubview(mybtn)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        vr.frame = CGRect(x: 20,y: 200,width:view.width - 40,height: 100)
        mylbl.frame = CGRect(x:20,y: vr.bottom + 150,width:view.width - 40,height: 40)
        mybtn.frame = CGRect(x:20,y:mylbl.bottom + 20,width:view.width - 40,height: 80)
    }

}

