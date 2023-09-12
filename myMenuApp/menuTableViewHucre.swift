//
//  menuTableViewHucre.swift
//  myMenuApp
//
//  Created by ÖMER  on 5.09.2023.
//

import UIKit

protocol menuTableViewHucreProtocol{
    func siparişVerme(indexPath: IndexPath)
}

class menuTableViewHucre: UITableViewCell {

    @IBOutlet weak var yemekNameLabel: UILabel!
    @IBOutlet weak var yemekResim: UIImageView!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    
    // stepper için
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    var hucreProtocol:menuTableViewHucreProtocol?
    var indexPath:IndexPath?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func siparişVerButton(_ sender: Any) {
        hucreProtocol?.siparişVerme(indexPath: indexPath!)
        
    }
    
    
    // UIStepper değeri değiştiğinde çağrılacak yöntem
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        valueLabel.text = String(format: "%.0f", sender.value)
    }
    
    
    
    
    
}
