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

