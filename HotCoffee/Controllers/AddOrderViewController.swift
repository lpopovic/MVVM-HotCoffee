//
//  AddOrderViewController.swift
//  HotCoffee
//
//  Created by MacBook Air on 6/4/19.
//  Copyright © 2019 Riitech. All rights reserved.
//

import UIKit

class AddOrderViewController: UIViewController {
    
    private var vm = AddCoffeOrderViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    private var coffeSizesSegmentedControl: UISegmentedControl!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        
        self.coffeSizesSegmentedControl = UISegmentedControl(items: vm.sizes)
        self.coffeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.coffeSizesSegmentedControl)
        self.coffeSizesSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true
         self.coffeSizesSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    @IBAction func save() {
        
        let name = self.nameTextField.text
        let email = self.emailTextField.text
        
        let selectedSize = self.coffeSizesSegmentedControl.titleForSegment(at: self.coffeSizesSegmentedControl.selectedSegmentIndex)
        
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            fatalError("Error in selected coffee!")
        }
        
        self.vm.name = name
        self.vm.email = email
        self.vm.selectedSize = selectedSize
        self.vm.selectedType = self.vm.types[indexPath.row]
        
        WebService().load(resource: Order.create(vm: self.vm)) { (result) in
            
            switch result {
            case .success( let order):
                print(order)
            case .failure(let error):
                print(error)
            }
        }

    }
}
extension AddOrderViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeTypeTableViewCell", for: indexPath)
        
        cell.textLabel?.text = vm.types[indexPath.row]
        return cell
    }
}
extension AddOrderViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
