import marcasDeCerveza.*
import personas.*

class Carpa {
	const property personasQueAdmite = #{}
	const marcaDeLaCervezaQueVende
	var limiteDePersonasQueAdmite
	var property tieneBandaParaTocarMusicaTradicional
	var property recargo 
	
	method marcaDeLaCervezaQueVende() = marcaDeLaCervezaQueVende
	method tieneBandaParaTocarMusicaTradicional() = tieneBandaParaTocarMusicaTradicional
	method limiteDeGenteQueAdmite() = limiteDePersonasQueAdmite
	method superaLaCantidadDePersonasPermitidas() = personasQueAdmite.size() > limiteDePersonasQueAdmite
	method dejarIngresar(unaPersona){
		if(unaPersona.puedeEntrarA(self)){
			personasQueAdmite.add(unaPersona)
		}
		else {
			self.error("Alcanzo el limite de personas que admite")
		}
	}
	method leGustaLaMarcaDeCervezaA(unaPersona) = unaPersona.leGusta(self.marcaDeLaCervezaQueVende())
	method dejaIngresar(unaPersona) = not self.superaLaCantidadDePersonasPermitidas() and not unaPersona.estaEbria()
	method servirJarraDeCervezaA(unaPersona, capacidad, paisDeProcedencia){
		if(self.personasQueAdmite().contains(unaPersona)){
			unaPersona.comprarJarraDeCerveza(new JarraDeCerveza(capacidadEnLitros = capacidad, marcaDeLaJarraDeCerveza = marcaDeLaCervezaQueVende, paisDeProcedencia = paisDeProcedencia, carpa = self))
		}
		else {
			self.error("La persona no está en la carpa")
		}
	}
	method ebriosEmpedernidos() = personasQueAdmite.count({persona => persona.todasLasJarrasSonDe11LitroOMas()})
	method esPatriota(unaPersona) = unaPersona.todasLasJarrasCervezasSonDelPaisDeDondeProviene()
	method esHomogenea(nacionalidad) = personasQueAdmite.all({persona => persona.nacionalidad() == nacionalidad})
	method clientesSinServir() = personasQueAdmite.filter({persona => not persona.carpasEnLasQueTomo().contains(self)})
} 

object recargoFijo {
	method recargo(unaCarpa) = 1.30
}

object recargoPorCantidad {
	method recargo(unaCarpa) = if (unaCarpa.limiteDePersonasQueAdmite() / 2 >= unaCarpa.personasQueAdmite().size()) 1.40 
							   else 1.25
}

object recargoPorEbriedad {
	method recargo(unaCarpa){
		const cantidadDePersonasEbrias = unaCarpa.personasQueAdmite().count({persona => persona.estaEbria()})
		if (cantidadDePersonasEbrias >= unaCarpa.personasQueAdmite().size() * 0.75){
			return 1.50
		}
		else {
			return 1.20
		}
	}
}
