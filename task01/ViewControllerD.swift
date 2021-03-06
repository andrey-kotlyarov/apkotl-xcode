//
//  ViewControllerD.swift
//  task01
//
//  Created by Andrey Kotlyarov on 31.08.17.
//  Copyright © 2017 APKotl. All rights reserved.
//

import UIKit

class ViewControllerD: UIViewController
{
    public var showBackButton: Bool = false
    static var counter: Int = 0
    
    @IBOutlet var lblTitle: UILabel!
    

    @IBOutlet var btnBack: UIButton!
    
    @IBAction func btnBack_OnTouchUp(_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if showBackButton
        {
            btnBack.setTitle("Back", for: UIControlState.normal)
        }
        else
        {
            btnBack.setTitle("---", for: UIControlState.normal)
        }
        
        
        ViewControllerD.counter += 1
        lblTitle.text = "Controller D - counter: \(ViewControllerD.counter)"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
