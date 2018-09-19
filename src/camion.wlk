import cosas.*

object camion {

	const property cosas = []
	var peso_camion = 1000

	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}

	method pesoTotal() {
		return peso_camion += (cosas.sum({ unaCosa => unaCosa.peso() }))
	}
	
	method excedidoDePeso() {
		return self.pesoTotal() > 2500  
	}
	
	method objetosPeligrosos(nivel) {
		return cosas.filter({unaCosa=>unaCosa.nivelPeligrosidad()>nivel})
	}
	
	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({unaCosa=>unaCosa.nivelPeligrosidad() > (cosa.nivelPeligrosidad())})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not cosas.any({unaCosa=>unaCosa.nivelPeligrosidad()> nivelMaximoPeligrosidad})
	}
	
	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({unaCosa=>(min > unaCosa.peso() < max)})
	}
	
	method cosaMasPesada() {
		return cosas.max({unaCosa=>unaCosa.peso()})
	}
	
	method totalBultos() {
		return cosas.sum({unaCosa=>unaCosa.bulto()})
	}
	
	method pesos() {
		return cosas.map({unaCosa=>unaCosa.peso()})
	}
	

}



