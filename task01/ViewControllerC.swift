//
//  ViewControllerC.swift
//  task01
//
//  Created by Andrey Kotlyarov on 31.08.17.
//  Copyright © 2017 APKotl. All rights reserved.
//

import UIKit



var dataArray = ["ZAZ", "Chevrolet", "KIA", "Honda", "Nissan"]
var dataArray2 = ["1102", "Aveo", "Ceed", "Accord", "X-Trail"]



class ViewControllerC: UIViewController {

    @IBOutlet var btnD: UIButton!
    @IBOutlet var btnBack: UIButton!
    
    @IBOutlet var btnItemEditTable: UIBarButtonItem!
    @IBOutlet var tableViewC: UITableView!
    
    
    
    @IBAction func btnItemEditTable_OnTouchUp(_ sender: UIBarButtonItem)
    {
        //btnItemEditTable.title = (tableViewC.isEditing ? "Edit table" : "Done")
        
        tableViewC.setEditing(!tableViewC.isEditing, animated: true)
        btnItemEditTable.title = (tableViewC.isEditing ? "Done" : "Edit table")
    }
    
    
    
    
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
        
        tableViewC.dataSource = self
        tableViewC.delegate = self

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


extension ViewControllerC: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableViewC.dequeueReusableCell(withIdentifier: "cellC", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.row]
        cell.detailTextLabel?.text = dataArray2[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        //print(indexPath)
        
        dataArray.remove(at: indexPath.row)
        dataArray2.remove(at: indexPath.row)
        
        tableViewC.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        //print("\(sourceIndexPath) <-> \(destinationIndexPath)")
        
        let itemToMove = dataArray[sourceIndexPath.row]
        dataArray.remove(at: sourceIndexPath.row)
        dataArray.insert(itemToMove, at: destinationIndexPath.row)
        
        let itemToMove2 = dataArray2[sourceIndexPath.row]
        dataArray2.remove(at: sourceIndexPath.row)
        dataArray2.insert(itemToMove2, at: destinationIndexPath.row)
        
        print(dataArray)
        print(dataArray2)
        
    }
}

extension ViewControllerC: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableViewC.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "segueCtoD", sender: self)
        
        print(dataArray[indexPath.row])
    }
    
    
}
