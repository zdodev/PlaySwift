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

emilio.assessSituation()
emilio.medicalEmergency()
