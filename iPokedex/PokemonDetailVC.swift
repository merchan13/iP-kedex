//
//  PokemonDetailVC.swift
//  iPokedex
//
//  Created by Javier Merchán on 5/20/17.
//  Copyright © 2017 Merchan. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

	var pokemon: Pokemon!

	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var mainImage: UIImageView!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var typeLabel: UILabel!
	@IBOutlet weak var defenseLabel: UILabel!
	@IBOutlet weak var heightLabel: UILabel!
	@IBOutlet weak var idLabel: UILabel!
	@IBOutlet weak var weightLabel: UILabel!
	@IBOutlet weak var baseAttackLabel: UILabel!
	@IBOutlet weak var currentEvolutionImage: UIImageView!
	@IBOutlet weak var nextEvolutionImage: UIImageView!
	@IBOutlet weak var nextEvolutionLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		nameLabel.text = pokemon.name.capitalized
		
		let img = UIImage(named: "\(pokemon.pokedexId)")
		
		mainImage.image = img
		currentEvolutionImage.image = img
		
		idLabel.text = "\(pokemon.pokedexId)"
		
		pokemon.downloadPokemonDetails {
			self.updateUI()
		}
		
    }
	
	func updateUI() {
		
		baseAttackLabel.text = pokemon.attack
		defenseLabel.text = pokemon.defense
		heightLabel.text = pokemon.height
		weightLabel.text = pokemon.weight
		typeLabel.text = pokemon.type
		descriptionLabel.text = pokemon.description
		
		if pokemon.nextEvolutionId == "" {
		
			nextEvolutionLabel.text = "No Evolutions"
			nextEvolutionImage.isHidden = true
			
		} else {
		
			nextEvolutionImage.isHidden = false
			nextEvolutionImage.image = UIImage(named: pokemon.nextEvolutionId)
			let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
			nextEvolutionLabel.text = str
			
		}
		
	}
	
	@IBAction func backButtonTapped(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}

}
