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
        progress.progressTintColor = .blue
        return progress
    }()
    private let mylbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Thank You ! "
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mylbl)
        view.addSubview(progressing)
        view.backgroundColor = .black
        title = "Submitted ! "
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 10.0)
        {
            self.progressing.setProgress(1.0, animated: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        progressing.frame = CGRect(x: 20, y: 100, width: view.width - 40, height: 60)
        mylbl.frame = CGRect(x: 30,y: 200, width: view.width - 40, height: 50)
        
        
    }
    
}
