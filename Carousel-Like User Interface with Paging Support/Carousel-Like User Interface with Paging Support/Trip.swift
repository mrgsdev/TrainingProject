//
//  Trip.swift
//  Carousel-Like User Interface with Paging Support
//
//  Created by MRGS on 19.07.2022.
//


import UIKit

struct Trip: Hashable {
    var tripId: String = ""
    var city: String = ""
    var country: String = ""
    var featuredImage: UIImage?
    var price: Int = 0
    var totalDays: Int = 0
    var isLiked: Bool = false
}
