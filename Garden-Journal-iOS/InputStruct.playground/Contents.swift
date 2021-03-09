import UIKit

enum InputType {
    case ScrollWheel
    case Image
    case Text
}

struct NewPlantInput {
    var inputType: InputType
    var placeholderText: String?
    var instructionText: String
}

let input0 = NewPlantInput(inputType: .Text, placeholderText: "Name your plant", instructionText: "Does your plant have a nickname? Put it here! If not, a species name or anything that will help you identify it in the app.")

let input1 = NewPlantInput(inputType: .ScrollWheel, placeholderText: "Date of adoption", instructionText: "When did this plant come into your life? Perhaps when it was gifted to you. Maybe it was the day you planted its seeds in the soil!")

let input2 = NewPlantInput(inputType: .Text, placeholderText: "Location", instructionText: "Where is this plant currently residing? Choose from your other locations or add a new one!")

let input3 = NewPlantInput(inputType: .Image, placeholderText: nil, instructionText: "Show us a picture! Add one from your photos, take a new one, or add one later on your Plant's Profile.")

let inputList = [input0, input1, input2, input3]
