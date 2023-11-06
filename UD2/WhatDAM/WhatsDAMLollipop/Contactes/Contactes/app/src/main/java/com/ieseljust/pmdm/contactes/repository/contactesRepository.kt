package com.ieseljust.pmdm.contactes.repository

import com.ieseljust.pmdm.contactes.model.Contacte
import com.ieseljust.pmdm.contactes.model.Contactes

class ContacteRepository private constructor() {
    // El constructor primari serà privat,
    // de manera que només es podrà
    // invocar des de la pròpia classe.

    // Aci ve la màgia del singleton:
    // Creem un objecte complementari (companion/estàtic) que continga la
    // instància única de la classe, i el mètode getInstance, per
    // tal d'obtenir aquesta.
    // Si és la primera vegada que s'invoca (i per tant la instància
    // de la classe no existeix), es crea aquesta instància.
    // Si no és la primera vegada que s'invoca (i per tant la instància
    // sí que existeix), el que fem, simplement és retornar-la.

    companion object {
        // Referencia a la propia instancia de la classe
        private var INSTANCE: ContacteRepository? = null

        // Metode per obtenir la referencia a aquesta instancia
        fun getInstance(): ContacteRepository {
            if (INSTANCE == null) {
                //INSTANCE = ContacteRepository(context)
                INSTANCE = ContacteRepository()
            }
            return INSTANCE!!
        }
    }

    // Mètodes que ofereix aquest API del repositori:

    fun getContactes() = Contactes.contactes
    fun getNumContactes() = Contactes.contactes.size
    fun add() = Contactes.add()
    fun remove(c: Contacte) = Contactes.remove(c)

}