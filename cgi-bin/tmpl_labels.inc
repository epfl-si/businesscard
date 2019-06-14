$tmpl_labels = {
	wrong_params => {
		fr	=> qq{Paramètres non conformes},
		en	=> qq{Illegal parameters},
	},
	no_access => {
		fr	=> qq{Pas de droits d'accès},
		en	=> qq{No access rights},
	},
	no_rights => {
		fr	=> qq{Pas de droits de gestions},
		en	=> qq{No management rights},
	},
	init_templ => {
		fr	=> qq{Erreur affichage page},
		en	=> qq{Page display error},
	},

	orders_label => {
		fr	=> qq{Commandes de cartes de visite},
		en	=> qq{Businesscard orders},
	},
	prix => {
		fr	=> qq{Prix},
		en	=> qq{Price},
	},
	responsable => {
		fr	=> qq{Responsable repro},
		en	=> qq{Reprography contact},
	},	
	cards => {
		fr	=> qq{Cartes de visite},
		en	=> qq{Business cards},
	},
	card_lang_txt => {
		fr	=> qq{Langue du contenu de la carte de visite},
		en	=> qq{Businesscard Content language},
	},	
	accreds_txt => {
		fr	=> qq{Accréditations},
		en	=> qq{Accreditations},
	},	

	title1 => {
		fr	=> qq{Commande de cartes de visite},
		en	=> qq{Business cards order},
	},
	neworder => {
		fr	=> qq{Nouvelle commande},
		en	=> qq{New command},
	},
	delete_label => {
		fr	=> qq{Annuler},
		en	=> qq{Delete},
	},
	delete_confirm => {
		fr	=> qq{Annuler cette commande},
		en	=> qq{Delete this order},
	},
	dem_valid => {
		fr	=> qq{Demande de validation},
		en	=> qq{Validation request},
	},
	commander => {
		fr	=> qq{Valider et Commander},
		en	=> qq{Validate and Submit},
	},
	show => {
		fr	=> qq{Visualiser},
		en	=> qq{Preview},
	},
	del_note => {
		fr	=> qq{Commande effacée :},
		en	=> qq{Order deleted},
	},
	repro_en_cours => {
		fr	=> qq{En cours},
		en	=> qq{Start Processing},
	},
	repro_done => {
		fr	=> qq{Commande effectuée},
		en	=> qq{Processed},
	},
	db_error => {
		fr	=> qq{Erreur base de données},
		en	=> qq{Database error},
	},
	quantite_label => {
		fr	=> qq{Quantité},
		en	=> qq{Quantity},
	},
	person_not_found => {
		fr	=> qq{Personne pas trouvée ou sans droit pour commander des cartes de visite},
		en	=> qq{Person not found or no rights to order EPFL businesscards},
	},
	cmd_not_found => {
		fr	=> qq{Commande inconnue},
		en	=> qq{Order not found},
	},

	no_fund => {
		fr => qq{Numéro de fond absent},
		en => qq{Fund numer missing},
	},
	fix	=> {
		fr	=> qq{Corriger},
		en	=> qq{Modify},
	},
	done_send_note	=> {
		fr	=> qq{Commander la carte de visites ci-dessus. A partir de ce stade, plus aucune correction possible! },
		en	=> qq{
		},
	},
	label_fond	=> {
		fr	=> qq{Fond},
		en	=> qq{Fund},
	},
	label_path	=> {
		fr	=> qq{Faculté/Institut/Service/Labo},
		en	=> qq{Faculty/Institute/Service/Lab},
	},
	label_title	=> {
		fr	=> qq{Titre universitaire},
		en	=> qq{Title},
	},
	label_firstname=> {
		fr	=> qq{Prénom},
		en	=> qq{Firstname},
	},
	label_name	=> {
		fr	=> qq{Nom},
		en	=> qq{Name},
	},
	label_function	=> {
		fr	=> qq{Fonction},
		en	=> qq{Position},
	},
	label_phone	=> {
		fr	=> qq{Tél.},
		en	=> qq{Phone},
	},
	label_mail	=> {
		fr	=> qq{Mail},
		en	=> qq{Mail},
	},
	label_type	=> {
		fr	=> qq{Type cartes de visite},
		en	=> qq{Businesscard type},
	},
	main_note => {
		fr	=> qq{<b>Attention :</b>
		<ul>
		<li>Le délai de production est de maximum cinq jours ouvrés.<br>
		<li>Veuillez consulter <a href="http://www.epfl.ch/repro/"><b>les horaires d'ouverture</b></a> du Centre d'impression
		</ul>},
		en	=> qq{<b>Attention :</b>
		<ul>
		<li>Le délai de production est de maximum cinq jours ouvrés.<br>
		<li>Veuillez consulter <a href="http://www.epfl.ch/repro/"><b>les horaires d'ouverture</b></a> du Centre d'impression
		</ul>},
	},	
	repro_en_cours_note => {
		fr	=> qq{Traiter la commande},
		en	=> qq{Start command processing},
	},
	dem_valid_note => {
		fr => qq{Cette demande de carte de visite selon la présentation ci-dessus sera soumise pour approbation à		},
		en => qq{This request for businesscards order will be submitted for validation to},
	},
	dem_valid_done_note => {
		fr => qq{Cette demande de carte de visite selon la présentation ci-dessus a été soumise pour approbation à },
		en => qq{This request for businesscards order has been submitted for validation to },
	},
	mod_note => {
		fr => qq{Vous pouvez modifier le contenu et/ou la présentation et suivre de nouveau le processus de validation et soumission tant que la commande n'ait pas été mise en traitement par la Repro},
		en => qq{You can modify this businesscard and re-activate the validation process as long as the order has not been processed},
	},

	validate_note => {
		fr => qq{Sélectionner un fond pour Valider et soumettre la commande de cartes de visite},
		en => qq{Select a fund to Validate and Submit businesscards order},
	},
	queue_note => {
		fr => qq{La commande ci-dessus a été transmise à la Reprographie pour impression.<br>},
		en => qq{This Businesscards order has been submitted for processing to the Printing Service},
	},
	done_note => {
		fr => qq{Cette commande est terminée },
		en => qq{This order has been processed },
	},
	
};