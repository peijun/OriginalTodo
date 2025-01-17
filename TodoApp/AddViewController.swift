//
//  AddViewController.swift
//  OriginalTodoApp
//
//  Created by 長崎茉優 on 2022/09/05.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController , UITextFieldDelegate {
    
    let realm = try! Realm()
    
    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var detailTextField: UITextField!
    @IBOutlet var datePickerView: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()

//        let memo: Memo? = read()
        
        todoTextField.delegate = self
        detailTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func read() -> Memo? {
        return realm.objects(Memo.self).first
    }
    
    @IBAction func save(){
        let todo: String = todoTextField.text!
        let detail: String = detailTextField.text!
        
        let newMemo = Memo()
        newMemo.todo = todo
        newMemo.detail = detail
            
        try! realm.write {
            realm.add(newMemo)
        }
        let alert: UIAlertController = UIAlertController(title: "成功",message: "保存しました",preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK", style: .default) { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }
        )
        
        present(alert, animated: true, completion: nil)
        print(todo)
        print(detail)
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "TodoSegue" {
//            let ViewController = segue.destination as? ViewController
//            ViewController?.todoArray.append("\(memo?.todo)") = self.todoArray.append(\(memo?.todo))
//
//            let preNC = self.navigationController!
//            let preVC = preNC.viewControllers[preNC.viewControllers.count - 2] as! ViewController
//            preVC.todo = self.todo
//            preVC.detail = self.detail        }
//    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



