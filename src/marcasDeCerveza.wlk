class MarcaDeCerveza {
	var contenidoDeLupulo
	const property paisDeDondeProvieneLaMarca
	var property precioPorLitroDeCerveza
	method contenidoDeLupulo() = contenidoDeLupulo
	method graduacionDeAlcohol()
	
}

class MarcaDeCervezaRubia inherits MarcaDeCerveza{
	var property graduacionDeAlcohol
}

class MarcaDeCervezaNegra inherits MarcaDeCerveza{
	override method graduacionDeAlcohol() = graduacionReglamentariaDeLaMarcaDeCervezaNegra.graduacionReglamentaria().min(self.contenidoDeLupulo() * 2)
}

class MarcaDeCervezaRoja inherits MarcaDeCerveza{
	override method graduacionDeAlcohol() = graduacionReglamentariaDeLaMarcaDeCervezaNegra.graduacionReglamentaria() * 1.25
}

object graduacionReglamentariaDeLaMarcaDeCervezaNegra {
	var property graduacionReglamentaria = 0.02
}

class JarraDeCerveza {
	var capacidadEnLitros 
	var marcaDeLaJarraDeCerveza
	var paisDeProcedencia
	var carpa
	
	method carpaEnLaQueSeSirvio() = carpa
	method paisDeProcedencia() = paisDeProcedencia
	method capacidadEnLitros() = capacidadEnLitros 
	method marcaDeLaJarraDeCerveza() = marcaDeLaJarraDeCerveza
	method contenidoDeAlcohol() = capacidadEnLitros * self.marcaDeLaJarraDeCerveza().graduacionDeAlcohol()
	method precioDeVenta() = capacidadEnLitros * marcaDeLaJarraDeCerveza.precioPorLitroDeCerveza() * carpa.recargo().recargo(carpa)
}