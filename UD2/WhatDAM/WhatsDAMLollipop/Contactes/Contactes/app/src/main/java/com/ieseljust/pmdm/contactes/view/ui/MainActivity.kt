package com.ieseljust.pmdm.contactes.view.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import com.ieseljust.pmdm.contactes.databinding.ActivityMainBinding
import com.ieseljust.pmdm.contactes.viewmodel.ContactesViewModel

class MainActivity : AppCompatActivity() {

    // Creem un objecte binding amb la classe de vinculacio
    private lateinit var binding: ActivityMainBinding

    // Adaptació a MVVM: Definim una instància del ViewModel com a lateinit
    private lateinit var viewModel: ContactesViewModel

    // Metodes del cicle de vida
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Instanciem la classe de vinculacio
        binding = ActivityMainBinding.inflate(layoutInflater)

        // Establim el contingut de la vista
        setContentView(binding.root)

        // Instanciem el ViewModel mitjançant ViewModelProvider
        viewModel =
            ViewModelProvider(this)[ContactesViewModel::class.java]

        // Establim un Layout Manager per al RecyclerView
        binding.ContactesRecyclerView.layoutManager= LinearLayoutManager(this)
        // Indiquem que les targetes son de grandaria fixa
        binding.ContactesRecyclerView.setHasFixedSize(true)


        // Creeem un observador i el subscrivim al LiveData adaptador
        // definit al ViewModel. Així, quan es produisquen canvis al ViewModel,
        // es reflexaran en l'adaptador del RecyclerView

        viewModel.adaptador.observe(this) {
            binding.ContactesRecyclerView.adapter = it
        }

        // Associem un escoltador d'esdeveniments al clic sobre
        // el boto d'accio flotant per afegir un element nou a la llista
        binding.fabAdd.setOnClickListener{
            viewModel.add()
        }
    }
}
