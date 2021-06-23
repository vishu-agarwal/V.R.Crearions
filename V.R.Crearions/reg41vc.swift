//
//  reg41vc.swift
//  V.R.Crearions
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class reg41vc: UIViewController {

    private let progressing: UIProgressView = {
        let progress = UIProgressView()
        progress.setProgress(0.0, animated: true)
        progress.progressTintColor = .white
        return progress
    }()
    private let mylbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Thank You ! "
        lbl.textAlignment = .center
        
        return lbl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mylbl)
        view.addSubview(progressing)
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        
    }

}
