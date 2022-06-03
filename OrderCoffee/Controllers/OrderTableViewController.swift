//
//  OrderTableViewController.swift
//  OrderCoffee
//
//  Created by hl on 5/31/22.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController{
    
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrder()
    }
    
    private func populateOrder(){
        guard let coffeeOrderURL = URL(string: "https://warp-wiry-rugby.glitch.me/orders")
        else{
            fatalError("URL was incorrect")
            return
        }
        
        let resource = Resource<[Order]>(url: coffeeOrderURL)
        Webservice().load(resource: resource){[weak self] result in // dont understand the weak self
            switch result{
            case .success(let orders):
                print(orders)
                self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init) // dont understand the OrderViewModel.init ??
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderListViewModel.ordersViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        
        cell.textLabel?.text = vm.type
        cell.detailTextLabel?.text = vm.size
        
        return cell;
    }
    
}
