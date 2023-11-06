package com.ieseljust.pmdm.contactes.viewmodel

import android.app.Application
import android.view.View
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.MutableLiveData
import com.ieseljust.pmdm.contactes.model.Contacte
import com.ieseljust.pmdm.contactes.repository.ContacteRepository

class ContactesViewModel(application: Application): AndroidViewModel(application) {
     /* Propietats del ViewModel */

    // LiveData per a l'adaptador, mitjançant un atribut de suport privat:
    // L'adaptador del RecyclerView serà un LiveData per a poder ser
    // observat des de la vista.

    private val _adaptador = MutableLiveData<AdaptadorContactes>().apply({
        // Mitjançant value (setValue), establim el valor que contindrà el MutableLiveData
        // de tipus AdaptadorContactes. Aci també proporcionarem els callbacks que
        // s'han d'invocar quan es produisquen els clicks.

        value= AdaptadorContactes(
            // Proporcionem el context
            getApplication<Application>().applicationContext, // Açò ho podem fer gràcies a derivar d'AndroidViewModel
            // I  el callback per al click llarg
            {contacte: Contacte, v: View -> ContacteLongClickedManager(contacte, v)}
        )
    })

    // Definim una propietat per tal de poder accedir a l'adaptador
    // des de la vista (_adapter és un atribut de suport privat)
    val adaptador:MutableLiveData<AdaptadorContactes> =_adaptador

    /* Definició de mètodes */

    // Definim les funcions per a la gestió d'events
    // Els esdeveniments son capturats per la vista, i fan us dels
    // metodes proporcionats pel ViewModel per actualitzar aquest.

    // Metode pe afegir un contacte
    public fun add(){
        // Invoquem al metode add del repositori. Aquest
        // retornara cert si el contacte s'ha afegit
        if (ContacteRepository.getInstance().add()){
            // si ha afegit un element, notifica a l'adaptador que
            // s'ha inserit un element al final.
            // Recordeu que adaptador es un LiveData, i per accedir
            // al seu valor (l'adaptador en si), fem us de value?.
            adaptador.value?.notifyItemInserted(ContacteRepository.getInstance().getNumContactes()-1)
            // I com que la vista esta "observant" aquest adaptador,
            // El recyclerView s'actualitzara automaticament
        }
    }

    // Callback per a quan es fa un click llarg sobre un contacte
    private fun ContacteLongClickedManager(contacte:Contacte, v: View):Boolean {
        // Invoquem el metode remove del contacte, que ens retornara
        // la posicio eliminada, i indicarem a l'adaptador que
        // s'ha eliminat l'element en dita posicio
        val index= ContacteRepository.getInstance().remove(contacte)
        adaptador.value?.notifyItemRemoved(index)
        // Retornem cert per a que ature la propagacio d'events
        // (i per tant no invoque el gestor d'events del click simple)
        return true
    }
}