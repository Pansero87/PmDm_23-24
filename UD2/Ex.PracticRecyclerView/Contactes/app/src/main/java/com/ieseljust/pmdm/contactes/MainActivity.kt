package com.ieseljust.pmdm.contactes

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.ieseljust.pmdm.contactes.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    // Creem un objecte binding amb la classe de vinculacio
    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)

        // Establim el contingut de la vista
        setContentView(binding.root)

        // Establim un Layout Manager per al RecyclerView
        binding.ContactesRecyclerView.layoutManager= LinearLayoutManager(this)
        // Indiquem que les targetes son de grandaria fixa
        binding.ContactesRecyclerView.setHasFixedSize(true)
        // Afegim l'adaptador de contactes
        binding.ContactesRecyclerView.adapter = AdaptadorContactes()

        // Associem un escoltador d'esdeveniments al clic sobre
        // el boto d'accio flotant per afegir un element nou a la llista
        binding.fabAdd.setOnClickListener{
            if (Contactes.add()) {
                // Si el contacte s'ha afegit, ho notifiquem a l'adaptador
                // per a que el RecyclerView el dibuixe
                binding.ContactesRecyclerView.adapter?.notifyItemInserted(Contactes.contactes.size - 1)
            }
        }
    }
}