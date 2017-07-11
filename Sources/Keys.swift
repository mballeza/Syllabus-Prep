class Keys : Types {
	var keyName: String?

	override init() {
		super.init()
		keyName = ""
	}
}

class KeyOfA : Keys {
	override init() {
		super.init()
		keyName = "A"
	}
}
