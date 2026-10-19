class Packs {
    const precioBase
    const duracion
    const coordinadorACargo
    const beneficios 
    method valorFinal(){
        return precioBase + beneficios.sum({b=>b.costo()})

    }
    method esPremium()
    

    
}

class PacksNacionales inherits Packs{
    const provinciaDeDestino
    const actividadesIncluidas =[]
    method provinciaDeDestino(){
        return provinciaDeDestino
        
    }
    override method esPremium(){
        return duracion > 10 and coordinadorACargo.esAltamenteCalificado()
    }

    
}

class PacksProvinciales inherits PacksNacionales {
    const cantidadDeCiudadesAVisitar
    override method esPremium(){
        return actividadesIncluidas.size()>=4 and cantidadDeCiudadesAVisitar > 5 beneficios.filter({b=>b.estaVigente()}).size() > 3

    }
    override method valorFinal(){
        return super() + 1.05
        
    }   

}

class PacksInternacionales inherits Packs{
    const paisDeDestino
    const escalasQueSeHaran
    const esLugarDeInteres
     method paisDeDestino(){
        return paisDeDestino
        
    }
    override method valorFinal(){
        return super() * 1.20
    }
    override method esPremium(){
        return duracion > 20 and duracion >20 and escalasQueSeHaran == 0
    }
    

}

class Coordinador {
    var cantidadDeViajesQueHizo
    var estaMotivado
    var añosDeExperiencia
    var rol
    const roles= ["Guia","Asistente logistico" , "Acompañante"]
    method cambiarDeRol(rolACambiar) {
    if (!roles.any({ r => r == rolACambiar })) {
        self.error("El rol " + rolACambiar + " no existe")
    }
    rol = rolACambiar
}
method esAltamenteCalificado() {
    return cantidadDeViajesQueHizo > 20 and (
        (rol == "Guia" and estaMotivado) or
        (rol == "Asistente logistico" and añosDeExperiencia >= 3) or
        rol == "Acompañante"
    )
}
}



class Beneficios {
    const tipo
    const costo
    var estaVigente
    method costo(){
        return costo
    }
    method estaVigente(){
        return estaVigente
    }
}

