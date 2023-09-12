//
//  ViewController.swift
//  myMenuApp
//
//  Created by ÖMER  on 5.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var menuListesi = [Menu]()
    var aramaSonucuMenuListesi = [Menu]()
    
    var aramaYapiliyorMu = false
    
    // UIStepper değerlerini saklamak için kullanılacaktır.
    var stepperValues = [Double]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
        
        searchBar.delegate = self
        
        let y1 = Menu(yemekAdi: "Ayran", yemekResimAdi: "ayran", yemekFiyat: 3.0)
        let y2 = Menu(yemekAdi: "Baklava", yemekResimAdi: "baklava", yemekFiyat: 20.0)
        let y3 = Menu(yemekAdi: "Fanta", yemekResimAdi: "fanta", yemekFiyat: 5.0)
        let y4 = Menu(yemekAdi: "Izgara Somon", yemekResimAdi: "izgarasomon", yemekFiyat: 25.0)
        let y5 = Menu(yemekAdi: "Izgara Tavuk", yemekResimAdi: "izgaratavuk", yemekFiyat: 15.0)
        let y6 = Menu(yemekAdi: "Kadayıf", yemekResimAdi: "kadayif", yemekFiyat: 16.0)
        let y7 = Menu(yemekAdi: "Kahve", yemekResimAdi: "kahve", yemekFiyat: 6.0)
        let y8 = Menu(yemekAdi: "Köfte", yemekResimAdi: "kofte", yemekFiyat: 15.0)
        let y9 = Menu(yemekAdi: "Lazanya", yemekResimAdi: "lazanya", yemekFiyat: 21.0)
        let y10 = Menu(yemekAdi: "Makarna", yemekResimAdi: "makarna", yemekFiyat: 13.0)
        let y11 = Menu(yemekAdi: "Pizza", yemekResimAdi: "pizza", yemekFiyat: 18.0)
        let y12 = Menu(yemekAdi: "Su", yemekResimAdi: "su", yemekFiyat: 1.0)
        let y13 = Menu(yemekAdi: "Sütlaç", yemekResimAdi: "sutlac", yemekFiyat: 10.0)
        let y14 = Menu(yemekAdi: "Tiramisu", yemekResimAdi: "tiramisu", yemekFiyat: 16.0)
        
        //Verilerin Listeye Eklenmesi
        menuListesi.append(y1)
        menuListesi.append(y2)
        menuListesi.append(y3)
        menuListesi.append(y4)
        menuListesi.append(y5)
        menuListesi.append(y6)
        menuListesi.append(y7)
        menuListesi.append(y8)
        menuListesi.append(y9)
        menuListesi.append(y10)
        menuListesi.append(y11)
        menuListesi.append(y12)
        menuListesi.append(y13)
        menuListesi.append(y14)
        
        // Stepper değerlerini başlatın
        stepperValues = Array(repeating: 0.0, count: menuListesi.count)
        
        
        
        
        
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource,menuTableViewHucreProtocol{
    
    func resetStepper(at indexPath: IndexPath) {
        if indexPath.row < stepperValues.count {
            stepperValues[indexPath.row] = 0.0 // UIStepper değerini sıfırla
            
            // TableView'i güncelle, bu nedenle hücrelerdeki değerler değişir
            menuTableView.reloadData()
        }
    }

    
    func siparişVerme(indexPath: IndexPath) {
        /*
         
         if indexPath.row < stepperValues.count{
             let urunAdet = stepperValues[indexPath.row]
             
             let gelenMenu = menuListesi[indexPath.row]
             
             print("Sipariş Verildi: \(gelenMenu.yemekAdi!) ve \(String(format: "%.0f", urunAdet)) adet ve fiyat : \(gelenMenu.yemekFiyat! * urunAdet) TL")
         }else{
             let urunAdet = 0
             
             let gelenMenu = menuListesi[indexPath.row]
             
             print("Sipariş Verildi: \(gelenMenu.yemekAdi!) ve \(String(format: "%.0f", urunAdet)) adet")
         }
         
         */
        
        
        
        // gelen menüyü almak
        if indexPath.row < stepperValues.count {
                let urunAdet = stepperValues[indexPath.row]
            
                // gelen menü buluyoruz , arama yapılıyormu true ise arama sonucu olan menüyü aldık false ise menu listesini aldık
                let gelenMenu = aramaYapiliyorMu ? aramaSonucuMenuListesi[indexPath.row] : menuListesi[indexPath.row]
                
                if let fiyat = gelenMenu.yemekFiyat {
                    let toplamFiyat = fiyat * urunAdet
                    print("Sipariş Verildi: \(gelenMenu.yemekAdi!) ve \(String(format: "%.0f", urunAdet)) adet ve fiyat : \(toplamFiyat) TL")
                } else {
                    print("Hata: Yemek fiyatı eksik!")
                }
            } else {
                let urunAdet = 0
                let gelenMenu = aramaYapiliyorMu ? aramaSonucuMenuListesi[indexPath.row] : menuListesi[indexPath.row]
                print("Sipariş Verildi: \(gelenMenu.yemekAdi!) ve \(String(format: "%.0f", urunAdet)) adet")
            }
        
        
        // UIStepper'ı sıfırla
            resetStepper(at: indexPath)
        
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if aramaYapiliyorMu{
            return aramaSonucuMenuListesi.count
        }else{
            return menuListesi.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let gelenMenu = menuListesi[indexPath.row]
        
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "menuCell",for: indexPath) as! menuTableViewHucre
        
        
        
        if aramaYapiliyorMu{
            cell.yemekNameLabel.text = aramaSonucuMenuListesi[indexPath.row].yemekAdi
            cell.yemekFiyatLabel.text = "\(aramaSonucuMenuListesi[indexPath.row].yemekFiyat ?? 0) TL"
            cell.yemekResim.image = UIImage(named: aramaSonucuMenuListesi[indexPath.row].yemekResimAdi!)
            cell.selectionStyle = .none // boşluğa basmayı kapattık
        }else{
            cell.yemekNameLabel.text = gelenMenu.yemekAdi
            cell.yemekFiyatLabel.text = "\(gelenMenu.yemekFiyat!) TL"
            cell.yemekResim.image = UIImage(named: gelenMenu.yemekResimAdi!)
            cell.selectionStyle = .none // boşluğa basmayı kapattık
        }
        
        
        
        
        
        
        
        // her hücreyi oluşturduğunuzda, bu hücrenin UIStepper değerini diziye ekleyin:
        
        // Verileri hücreye yerleştirme işlemi
        if indexPath.row < stepperValues.count {
                
                cell.valueLabel.text = "\(stepperValues[indexPath.row])" // UIStepper değeri

                // UIStepper'ın değerini ViewController'daki diziden alarak ayarla
                cell.stepper.value = stepperValues[indexPath.row]

                // UIStepper değeri değiştiğinde ViewController'daki diziyi güncelle
                cell.stepper.tag = indexPath.row
                cell.stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
            } else {
                
                cell.valueLabel.text = ""
                cell.stepper.value = 0 // Varsayılan değer veya istediğiniz bir değer
                cell.stepper.tag = 0 // İndeks sınırları dışındaki hücreler için uygun bir değer
            }
        
        
        // UIStepper değeri değiştiğinde ViewController'daki diziyi güncelle
        cell.stepper.tag = indexPath.row  // tag: Varsayılan değer 0'dır. Bu etiketin değerini ayarlayabilir ve bu değeri daha sonra görünümü tanımlamak için kullanabilirsiniz.
        cell.stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        
        
        
        cell.hucreProtocol = self
        cell.indexPath = indexPath
    
        return cell
        
    }
    
    // ViewController sınıfınızda, UIStepper değeri değiştiğinde çağrılacak bir işlev ekleyin:
    @objc func stepperValueChanged(_ sender: UIStepper){
        let rowIndex = sender.tag
            
        // Dizinin boyutunu kontrol et
            if rowIndex >= 0 && rowIndex < stepperValues.count {
                stepperValues[rowIndex] = sender.value
                // UIStepper değeri değiştiğinde yapılacak işlemleri burada yapabilirsiniz
                
                // UIStepper değerini güncelleyin
                if let cell = menuTableView.cellForRow(at: IndexPath(row: rowIndex, section: 0)) as? menuTableViewHucre {
                    cell.valueLabel.text = String(format: "%.0f", sender.value)
                }
            }
        
    }
    
    /*
     Bu işlev, UIStepper'ın değeri değiştiğinde çağrılacak ve seçilen hücrenin dizisindeki değerini güncelleyecektir.
    
    Bu şekilde, UIStepper değerlerini ViewController'da kullanabilirsiniz. Her UIStepper'ın değeri değiştiğinde, değeri güncellemek ve işlem yapmak için bu işlevi kullanabilirsiniz.
    */
    
    
    
    
    
}

extension ViewController: UISearchBarDelegate{
    
    // arama yapılcağı zaman
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        
        if searchText == ""{ // arama yapılmıyor
            aramaYapiliyorMu = false
        }else{
            aramaYapiliyorMu = true
            aramaSonucuMenuListesi = menuListesi.filter({$0.yemekAdi!.lowercased().contains(searchText.lowercased())})
            
        }
        // table view hücrelerin yenilenmesi
        menuTableView.reloadData()
    }
}


