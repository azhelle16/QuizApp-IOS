//
//  AdminHomeViewController.swift
//  QuizApp-IOS
//
//  Created by Christopher Medina on 3/25/22.
//

import UIKit

class AdminHomeViewController: UITabBarController {

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

    @IBAction func SignOut(_ sender: Any)
    {
        self.dismiss(animated: true)
    }
}
