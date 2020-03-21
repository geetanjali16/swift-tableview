//
//  ChecklistItem.swift
//  todolistapp
//
//  Created by Ashok Mishra on 21/05/19.
//  Copyright © 2019 Ashok Mishra. All rights reserved.
//

import Foundation


class CheckListItem{
    var text = ""
    var checkMark = false
    
    
    func toggleCheckMark(){
        checkMark = !checkMark
    }
    

}
