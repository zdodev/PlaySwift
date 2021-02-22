protocol AdvanedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvanedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct Paramedic: AdvanedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }
}

class Doctor: AdvanedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }
    
    func useStethescope() {
        print("Listening for heart sounds.")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees.")
    }
    
    func useEletricDrill() {
        print("Whirr...")
    }
}

let emilio = EmergencyCallHandler()
//let pete = Paramedic(handler: emilio)
let anglea = Surgeon(handler: emilio)

//emilio.assessSituation()
//emilio.medicalEmergency()

class Mom {
    var level: Int?
    var delegate: Askable?
    
    func askToSunCleanTheRoom() {
        delegate?.cleanTheRoom()
        delegate?.feedToDog()
        level = delegate?.bow()
    }
}

protocol Askable {
    func cleanTheRoom()
    func feedToDog()
    func bow() -> Int
}

class Sun: Askable {
//    var mom: Mom?
//
    init (mom: Mom) {
        mom.delegate = self
    }
    
    func cleanTheRoom() {
        print("Sun: OK! I'm cleaning...")
    }
    
    func feedToDog() {
        print("Sun: OK! I'm feed to dog...")
    }
    
    func bow() -> Int {
        3
    }
}

let mom = Mom()
let sun = Sun(mom: mom)
mom.askToSunCleanTheRoom()
print(mom.level)
