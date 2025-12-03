//
//  EventCreationViewModel.swift
//  Sioree
//
//  Created by Emil Volvovsky on 12/2/25.
//


import SwiftUI

class EventCreationViewModel: ObservableObject {
    @Published var step: EventCreationStep = .details
    @Published var title = ""
    @Published var city = ""
    @Published var selectedAddOns: [AddOnOption] = []
}
