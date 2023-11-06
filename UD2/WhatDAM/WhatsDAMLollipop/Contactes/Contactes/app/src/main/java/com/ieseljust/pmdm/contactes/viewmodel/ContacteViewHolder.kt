package com.ieseljust.pmdm.contactes.viewmodel

import android.content.Context
import android.util.Log
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView
import com.ieseljust.pmdm.contactes.R
import com.ieseljust.pmdm.contactes.model.Contacte


class ContacteViewHolder(itemView: View, val context: Context) :
    View.OnClickListener,
    RecyclerView.ViewHolder(itemView){
    val img = itemView.findViewById(R.id.imageView) as ImageView
    val name = itemView.findViewById(R.id.nomContacte) as TextView


    // Bloc d'inicialitzacio per indicar que serà la pròpia classe
    // qui implemente el mètode `onClick` de l'item

    init {
        itemView.setOnClickListener(this)
    }

    // Enllacem les dades del contacte amb la vista
    fun bind(
        contacte: Contacte,
        eventListener: (Contacte, View) -> Boolean) {
        name.text = contacte.name
        img.setImageResource(contacte.img)

        // Gestionem d'aci el click llarg
        // Click llarg
        itemView.setOnLongClickListener{
            eventListener(contacte, itemView)
        }
    }

    override fun onClick(item: View?) {
        // Codi per mostrar la notificacio
        Toast.makeText(context, "Has fet click sobre ${name.text}", Toast.LENGTH_SHORT).show()
        // De moment la mostrem al Log
        Log.d("Metode onClick", "Has fet click sobre ${name.text}")

    }

}