//
//  Reg1vc.swift
//  V.R.Crearions
//
//  Created by DCS on 19/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Reg1vc: UIViewController {

    //profile picture
    private let profile: UIImagePickerController = {
        let prfl = UIImagePickerController()
        prfl.allowsEditing = false
        return prfl
    }()
    private let imgVieew: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
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
    
    // toolbar slect image
    private let toolbar: UIToolbar = {
        let tool = UIToolbar()
        let close = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(back))
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cam))
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(galery))
        tool.items = [close,camera,gallery]
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
    @objc func cam(){
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            profile.sourceType = .camera
            DispatchQueue.main.async {
                self.present(self.profile,animated: true)
            }
        }
        else{
            let alert = UIAlertController(title: "Warning !!", message: "camera not fount", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
            }
        }
    }
    //textview for email
    private let mytxtView:UITextView = {
        let txtView = UITextView()
        txtView.textColor = .blue
        txtView.textAlignment = .center
        
        return txtView
    }()
    //textbox for enter name
    private let mytxt:UITextField = {
        let txt = UITextField()
        txt.placeholder = "Enter UserName !"
        txt.textColor = .blue
        txt.textAlignment = .center
        txt.borderStyle = .roundedRect
        
        return txt
    }()
   //label for email
    private let lblEmail : UILabel = {
        let lbl = UILabel()
        lbl.text = "Enter your Email Id Below !"
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
    private let mylbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Select Your Profile !"
        lbl.textAlignment = .center
        lbl.textColor = .white
        return lbl
    }()
   
    @objc func nextfunc(){
        let vc = reg2VC()
        navigationController?.pushViewController(vc, animated: true)
    }
   
    //at the end put progress
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .black
        view.addSubview(mytxt)
        view.addSubview(pgCntrl)
        view.addSubview(toolbar)
        view.addSubview(mytxtView)
        
        view.addSubview(lblEmail)
        view.addSubview(mylbl)
        view.addSubview(imgVieew)
        profile.delegate = self
        title = "Personal Information"
        //profile.delegate = self
        // Do any additional setup after loading the view.
    }
    
   
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
        toolbar.frame = CGRect(x: 0,y: 63, width: view.width, height: 30)
        //let toolbar: CGFloat = view.safeAreaInsets.top + 40
        imgVieew.frame = CGRect(x: 20,y: toolbar.bottom + 20 ,width: view.width - 40, height: 200)
        mylbl.frame = CGRect(x: 20,y: imgVieew.bottom + 10, width: view.width - 40, height: 50)
        mytxt.frame = CGRect(x: 20,y: mylbl.bottom + 20, width: view.width - 40, height: 50)
        lblEmail.frame = CGRect(x: 20,y: mytxt.bottom + 20, width: view.width - 40, height: 50)
        mytxtView.frame = CGRect(x: 20,y: lblEmail.bottom + 10,width: view.width - 40, height: 50)
        
        pgCntrl.frame = CGRect(x: 40,y: mytxtView.bottom + 5, width: view.width - 80, height: 60)
       
        //let tools: CGFloat = view.safeAreaInsets.top + 40
        
    }
}
extension Reg1vc: UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker:UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let selectedImg = info[.originalImage] as? UIImage
        {
            imgVieew.image = selectedImg
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true)
        
    }
}
