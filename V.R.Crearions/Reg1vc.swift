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
    private let toolbar: UIToolbar = {
        let tool = UIToolbar()
        let close = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        let space = UIBarButtonItem(systemItem: .flexibleSpace)
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(galery))
        tool.items = [close,space,gallery]
        return tool
    }()
    @objc func back(){
        
        self.dismiss(animated: true)
    }
    @objc func galery(){
        profile.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.profile, animated: true)
        }
    }
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
        lbl.text = "Select Your Profile !"
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    private let mybtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("NEXT", for: .normal)
        btn.addTarget(self, action: #selector(nextfunc), for: .touchUpInside)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 10
        return btn
    }()
    @objc func nextfunc(){
        let vc = reg2VC()
        navigationController?.pushViewController(vc, animated: true)
    }
   
    //at the end put progress
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mytxt)
        view.addSubview(toolbar)
        view.addSubview(mybtn)
        view.addSubview(mylbl)
        profile.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        title = "Personal Information"
        //profile.delegate = self
        // Do any additional setup after loading the view.
    }
    
    extension reg2VC: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
        func imagePicker
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolbar: CGFloat = view.safeAreaInsets.top + 40
        toolbar.frame = CGRect()
        mytxt.frame = CGRect(x:20,y:100,width:view.width - 40,height: 50)
        
        
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
