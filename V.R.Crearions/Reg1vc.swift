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
        pg.currentPage = 1
        pg.addTarget(self, action: #selector(handlePgCntrl), for: .valueChanged)
        return pg
    }()
    @objc func handlePgCntrl (){
        print(pgCntrl.currentPage)
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
        view.addSubview(pgCntrl)
        view.addSubview(toolbar)
        
        view.addSubview(mybtn)
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
        //let toolbar: CGFloat = view.safeAreaInsets.top + 40
        imgVieew.frame = CGRect(x: 20,y: 100,width: view.width - 40, height: 200)
        mytxt.frame = CGRect(x: 20,y: imgVieew.bottom + 30, width: view.width - 40, height: 50)
        
        
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
