//
//  UIViewController+Extension.swift
//  Shopper
//
//  Created by 쌩 on 6/24/24.
//

import UIKit


extension UIViewController {
    
    func showAlert(title: String, messeage: String, completion: @escaping (UIAlertAction) -> ()) {
        let alert = UIAlertController(title: title, message: messeage, preferredStyle: .alert)
        //2. action 선언 필요시 handler 사용.
        let cancel = UIAlertAction(title: "취소", style: .default)
        let ok = UIAlertAction(title: "확인", style: .destructive, handler: completion)
        //3. alert에 action 등록
        alert.addAction(cancel)
        alert.addAction(ok)
        //4. 띄우기
        present(alert, animated: true)
    }
}
