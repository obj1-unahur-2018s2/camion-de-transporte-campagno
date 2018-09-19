import camion.*

object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() { return 1 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bulto() { return 2 }
}

object paqueteDeLadrillos {
	var cantidad_ladrillos = 0
	
	
	method peso() { return 2* cantidad_ladrillos}
	method nivelPeligrosidad() { return 2 }
	method setCantidad(cantidad) { cantidad_ladrillos += cantidad }
	method bulto() {
		if (cantidad_ladrillos < 100) { return 1 }
		if (100 < cantidad_ladrillos < 301 ) { return 2 }
		else { return 3 }
	}
}

object arenaAGranel {
	var peso = 0 
	
	method peso() { return peso }
	method setPeso(cantidad) { peso += cantidad }
	method nivelPeligrosidad() { return 1 }
	method bulto() { return 1 }
}

object bateriaAntiaerea {
	var conMisiles = true
	
	method peso() { return if (conMisiles) {300} else {200} }
	method sinMisiles() { conMisiles = not conMisiles }
	method nivelPeligrosidad() { return if (conMisiles) {100} else {0} }
	method bulto() { 
		if (conMisiles) { return 2 }
		else { return 1 }
	}
}

object contenedorPortuario {
	const property contenido = []
	
	method agregar(unaCosa) { contenido.add(unaCosa)}
	method quitar(unaCosa) { contenido.remove(unaCosa)}
	method peso() { return 100 + contenido.sum({unaCosa=>unaCosa.peso()})}
	method nivelPeligrosidad() { 
		if (not contenido.isEmpty()) {
			return (contenido.max({unaCosa=>unaCosa.nivelPeligrosidad()})).nivelPeligrosidad()
			}
			else { return 0 }
			}
	method bulto() { return 1 + contenido.sum({unaCosa=>unaCosa.bulto()}) }
}
			
object residuosRadioactivos {
	var peso = 0
	
	method peso()  { return peso }
	method setPeso(kilos) { peso += kilos } 
	method nivelPeligrosidad() { return 200 }
	method bulto() { return 1 }
	
}

object embalajeSeguridad {
	var elemento = null
	
	method embalar(unaCosa) { elemento = unaCosa }
	method peso() { return elemento.peso() }
	method nivelPeligrosidad() { return (elemento.nivelPeligrosidad()/2)}
	method bulto() { return 2 }
	
}







