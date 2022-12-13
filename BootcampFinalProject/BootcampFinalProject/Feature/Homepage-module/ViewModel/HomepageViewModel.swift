//
//  HomepageViewModel.swift
//  BootcampFinalProject
//
//  Created by Tolga Kağan Aysu on 13.12.2022.
//

import Foundation

protocol HomepageViewModelDelegate {
    var view: HomepageViewControllerDelegate? { get set}
    
    func viewDidLoad()
}


final class HomepageViewModel: HomepageViewModelDelegate {
    //MARK: - Property
    weak var view: HomepageViewControllerDelegate?
    
    
    //MARK: - Lifecycle
    func viewDidLoad() {
        
    }
    
}
