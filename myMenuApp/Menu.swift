//
//  Menu.swift
//  myMenuApp
//
//  Created by ÖMER  on 5.09.2023.
//

import Foundation


class Menu{
    var yemekAdi:String?
    var yemekResimAdi:String?
    var yemekFiyat:Double?
    
    
    init(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Double) {
        self.yemekAdi = yemekAdi
        self.yemekResimAdi = yemekResimAdi
        self.yemekFiyat = yemekFiyat
        
    }
}
