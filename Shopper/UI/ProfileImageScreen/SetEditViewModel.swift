//
//  SetEditViewModel.swift
//  Shopper
//
//  Created by 쌩 on 7/10/24.
//

import Foundation

class SetEditProfieImageViewModel {
    
    var inputSelectedIndex: Observable<Int?> = Observable(nil)
    var outputProfile = Observable("")
    
    init () {
        inputSelectedIndex.bind { _ in
            self.setMyProfile()
        }
        outputProfile.value = UserManager.userProfile
    }
    
    func getTitle() -> String {
        let title = UserManager.isUser ? "EDIT PROFILE" :  "PROFILE SETTING"
        return title
    }
    
    func setMyProfile() {
        if let value = inputSelectedIndex.value {
            self.outputProfile.value = Resource.Image.ImageList.allCases[0].list[value]
            UserManager.userProfile = self.outputProfile.value
        }
    }
}

