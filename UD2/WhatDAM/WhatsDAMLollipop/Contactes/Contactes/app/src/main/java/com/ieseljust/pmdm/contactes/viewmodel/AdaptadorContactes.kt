package com.ieseljust.pmdm.contactes.viewmodel

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.ieseljust.pmdm.contactes.R
import com.ieseljust.pmdm.contactes.model.Contacte
import com.ieseljust.pmdm.contactes.repository.ContacteRepository

class AdaptadorContactes(
    val context:Context,
    val eventListener: (Contacte, View) -> Boolean)
    :RecyclerView.Adapter<RecyclerView.ViewHolder>(){

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int): RecyclerView.ViewHolder {
        // S'invoca quan es crea un nou viewholder
        val inflater = LayoutInflater.from(parent.context)
        val vista=inflater.inflate(
            R.layout.contacte_layout,
            parent,false);
        return ContacteViewHolder(vista,context)
    }

    override fun onBindViewHolder(
        holder: RecyclerView.ViewHolder,
        position: Int) {
        (holder as ContacteViewHolder).bind(
            //Contactes.contactes[position],
            ContacteRepository.getInstance().getContactes()[position],
            eventListener)
    }

    override fun getItemCount(): Int {
        //return Contactes.contactes.size
        return ContacteRepository.getInstance().getNumContactes()
    }
}