package com.ieseljust.pmdm.contactes

import android.view.View
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class ContacteViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView){
    val img = this.itemView.findViewById(R.id.imageView) as ImageView
    val name = this.itemView.findViewById(R.id.nomContacte) as TextView

    // Enllacem les dades del contacte amb la vista
    fun bind(contacte: Contacte) {
        name.text = contacte.name
        img.setImageResource(contacte.img)
    }

}