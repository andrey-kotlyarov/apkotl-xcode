//
//  ViewControllerC.swift
//  task01
//
//  Created by Andrey Kotlyarov on 31.08.17.
//  Copyright © 2017 APKotl. All rights reserved.
//

import UIKit

class ViewControllerC: UIViewController {

    @IBOutlet var btnD: UIButton!
    @IBOutlet var btnBack: UIButton!
    
    @IBAction func btnD_OnTouchUp(_ sender: UIButton)
    {
        performSegue(withIdentifier: "segueCtoD", sender: self)
        
    }
    
    @IBAction func btnBack_OnTouchUp(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueCtoD"
        {
            let vcD = segue.destination as! ViewControllerD
            vcD.showBackButton = false
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
