//
//  MockData.swift
//  GalleryAppSUI
//
//  Created by Dmitry Volkov on 31/01/2025.
//

import Foundation

struct MockData {
    var example = Artist(
        name: "Pablo Picasso",
        bio: "Pablo Ruiz y Picasso (25 October 1881 – 8 April 1973), also known as Pablo Picasso, was a Spanish painter, sculptor, printmaker, ceramicist, stage designer, poet and playwright who spent most of his adult life in France.",
        works: [
            Work(title: "Guernica",
                 image: "Picasso1",
                 info: "Guernica is a mural-sized oil painting on canvas by Spanish artist Pablo Picasso completed by June 1937. The painting, which uses a palette of gray, black, and white, is regarded by many art critics as one of the most moving and powerful anti-war paintings in history. Standing at 3.49 metres (11 ft 5 in) tall and 7.76 metres (25 ft 6 in) wide, the large mural shows the suffering of people, animals, and buildings wrenched by violence and chaos."),
            Work(title: "The Weeping Woman",
                 image: "Picasso2",
                 info: "The Weeping Woman, (60 х 49 cm, 23 ⅝ х 19 ¼ inches) is an oil on canvas painted by Pablo Picasso in France in 1937. Picasso was intrigued with the subject, and revisited the theme numerous times that year. This painting was the final and most elaborate of the series. It has been in the collection of the Tate in London since 1987, and is on exhibition at the Tate Modern, London.")
        ])
}
