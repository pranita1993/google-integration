//
//  ViewController.swift
//  FBINTEGRATION
//
//  Created by Student P_08 on 10/01/20.
//  Copyright © 2020 n. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController,GIDSignInUIDelegate,GIDSignInDelegate {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btngogglesignin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btngogglesignin.addTarget(self, action: #selector(signinUserusingGoogle(_sender:)), for: .touchUpInside)
        //btngogglesignin.addTarget(self, action: #selector(signinUserusingGoogle(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  @objc  func signinUserusingGoogle(_sender:UIButton)
    {
        if btngogglesignin.title(for:.normal) == "Sign Out"{
            GIDSignIn.sharedInstance().signOut()
            lblTitle.text = ""
             btngogglesignin.setTitle("Sign in using Google ", for: .normal)
            
        }else{
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        }
        
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("we have error sign in user ==\(error.localizedDescription)")
        }
        else
        {
            if let gmailUser = user {
                lblTitle.text = "you are signed in using id\(gmailUser.profile.email!)"
                btngogglesignin.setTitle("Sign Out", for: .normal)
            }
        }
    }


}

