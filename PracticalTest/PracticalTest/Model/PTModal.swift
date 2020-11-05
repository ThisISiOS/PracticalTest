//
//  ARModal.swift
//  AtlasRTX
//
//  Created by theonetech on 01/05/20.
//  Copyright © 2020 theonetech. All rights reserved.
//

import ObjectMapper

class PTModal: Mappable {
    
    required init(){}
    
    required init?(map: Map){
        self.mapping(map: map)
    }
    func mapping(map: Map){
    }
}
