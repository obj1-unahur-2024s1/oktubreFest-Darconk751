import marcasDeCerveza.*
import carpas.*

class Persona {
	const property jarrasDeCervezasCompradas = #{}
	var property peso 
	var property leGustaLaMusicaTradicional 
	var property nivelDeAguante /*es un numero */
	const property nacionalidad
	
	method comprarJarraDeCerveza(unaJarra){
		jarrasDeCervezasCompradas.add(unaJarra)
	}
	method totalDeAlcohol() = jarrasDeCervezasCompradas.sum({jarra => jarra.contenidoDeAlcohol()})
	method estaEbria() = self.totalDeAlcohol() * self.peso() > self.nivelDeAguante()
	method leGusta(unaMarcaDeCerveza) 
	method quiereEntrarA(unaCarpa) = unaCarpa.leGustaLaMarcaDeCervezaA(self) and self.leGustaLaMusicaTradicional() == unaCarpa.tieneBandaParaTocarMusicaTradicional()
	method puedeEntrarA(unaCarpa) = self.quiereEntrarA(unaCarpa) and unaCarpa.dejaIngresar(self)
	method todasLasJarrasSonDe11LitroOMas() = jarrasDeCervezasCompradas.all({jarra => jarra.capacidadEnLitros() >= 1})
	method todasLasJarrasCervezasSonDelPaisDeDondeProviene() = jarrasDeCervezasCompradas.all({jarra => jarra.paisDeProcedencia() == self.nacionalidad()})
	method marcasDeJarrasCompradas() = jarrasDeCervezasCompradas.map({jarra => jarra.marcaDeLaJarraDeCerveza()}).asSet()
	method esCompatibleCon(unaPersona) = self.lasJarrasCompradasDeUno(unaPersona) / self.lasJarrasCompradasDeOtro(unaPersona) <= 2
	method lasJarrasCompradasDeUno(unaPersona) = self.marcasDeJarrasCompradas().size()
	method lasJarrasCompradasDeOtro(unaPersona) = self.marcasDeJarrasCompradas().intersection(unaPersona.marcasDeJarrasCompradas()).size()
	method carpasEnLasQueTomo() = jarrasDeCervezasCompradas.map({jarra => jarra.carpaEnLaQueSeSirvio()})
	method capacidadesDeLitrosDeJarrasCompradas() = jarrasDeCervezasCompradas.map({jarra => jarra.capacidadEnLitros()})
	method estaEntrandoEnElVicio() = 
	if (self.capacidadesDeLitrosDeJarrasCompradas().size() == 0 or self.capacidadesDeLitrosDeJarrasCompradas().size() == 1) false 
	else 
		self.capacidadesDeLitrosDeJarrasCompradas().get(self.capacidadesDeLitrosDeJarrasCompradas().size() - 2) <= self.capacidadesDeLitrosDeJarrasCompradas().last()
}

class Belga inherits Persona {
	override method leGusta(unaMarcaDeCerveza) = unaMarcaDeCerveza.contenidoDeLupulo() > 4
}

class Checo inherits Persona {
	override method leGusta(unaMarcaDeCerveza) = unaMarcaDeCerveza.graduacionDeAlcohol() > 0.08
}

class Aleman inherits Persona {
	override method leGusta(unaMarcaDeCerveza) = true 
	override method quiereEntrarA(unaCarpa) = super(unaCarpa) and unaCarpa.personasQueAdmite().size().even()
}