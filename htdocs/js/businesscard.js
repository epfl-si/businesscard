var show_alert = '';

function toggleTypeCV(card_type, mail) {
console.log ('toggleTypeCV : card_type='+card_type);
	if ( card_type == 'adresse') {
		if (mail) document.getElementById('display_people').style.display='none';
		document.getElementById('display_web').style.display='none';
		document.getElementById('display_adresse').style.display='block';
	} else if ( card_type == 'people') {
		if (mail) document.getElementById('display_people').style.display='block';
		document.getElementById('display_web').style.display='none';
		document.getElementById('display_adresse').style.display='none';
	} else if ( card_type == 'web') {
		if (mail) document.getElementById('display_people').style.display='none';
		document.getElementById('display_web').style.display='block';
		document.getElementById('display_adresse').style.display='none';
	} 
}

function togglePathShow (id) {
	var elem 	 = document.getElementById(id+'_hide');
	var elem_img = document.getElementById(id+'_img');
console.log ('toggleVis : '+ id + ', value=' + elem.value);
	if (elem.value == '' || elem.value == ' ') {
		elem.value='Y';
		elem_img.src = '../images/eye-off.png?ts=' + new Date().getTime();
	} else {
		elem.value='';
		elem_img.src = '../images/eye.png?ts=' + new Date().getTime();
	}
}

// ---
function toggleVis (id) {
	var elem 	 = document.getElementById(id+'_hide');
	var elem_img = document.getElementById(id+'_img');
console.log ('toggleVis : '+ id);
	if (elem.value == '' || elem.value == ' ') {
		elem.value='N';
		elem_img.src = '../images/eye-off.png?ts=' + new Date().getTime();
	} else {
		elem.value='';
		elem_img.src = '../images/eye.png?ts=' + new Date().getTime();
	}
}

function toggleShow (id) {
	var elem_style 	 = document.getElementById(id).style;
	if (elem_style.display == 'block') {
		elem_style.display = 'none'
	} else {
		elem_style.display = 'block'
	}
	return false;
}

function showButton (fund, id) {
	var elem_style 	 = document.getElementById(id).style;
	
	if (fund == '') {
		alert ('Please select a fund')
	} else {
		if (elem_style.display == 'block') {
			elem_style.display = 'none'
		} else {
			elem_style.display = 'block'
		}
	}
	return false;
}

function chkFields () {
	for (var i = 0; i < card.elements.length; i++) {
		var field = card.elements[i];

console.log ('chkFields field=' + field.name + ', value=' + field.value);
		
		if (field.name && field.name == 'fond' && field.value.length == 0) {
			alert ('Veuillez sélectionner un fond');
			show_alert = '';
			return false;
		}
				
		if (!field.name || field.name == 'fond' || field.type === 'submit' || field.type === 'button') continue;
		
		var MAXSIZE;
		if (field.name == 'adresse') {
			MAXSIZE=43;
		} else {
			MAXSIZE=40;
		}
		
		if (field.value.length > MAXSIZE) {
console.log ('chkFields : field=' + field.name);
			field.style = 'background-color: #f4e841'
			show_alert  = field.name
		} else {
			field.style = ''			
		}
	}
console.log ('chkFields 1 : show_alert=' + show_alert);
	if (show_alert != '') {
		alert ('Taille des paramètres trop grande');
		show_alert = '';
		return false;
	} else {
		return true;
	}
}

//	- 
function setAllBoxes(dest) {
  checkboxes = document.getElementsByName(dest);
  for(var i=0, n=checkboxes.length;i<n;i++) {
	checkboxes[i].checked = true;
  }
}	
function resetAllBoxes(dest) {
  checkboxes = document.getElementsByName(dest);
  for(var i=0, n=checkboxes.length;i<n;i++) {
	checkboxes[i].checked = false;
  }
}	
//
function setBGColor (id, color) {
	document.getElementById(id).style.backgroundColor=color;
}
