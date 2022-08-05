
var IsSideNavOpen = false;
//alert('aaa');

function openSideNav() {
	//alert('ddd');
    document.getElementById("mySidenav").style.width = "280px";
	//alert('eee');
	var sidenavLinks = document.getElementsByClassName("sidenavLink");
	var iRow;
	for (iRow = 0; iRow < sidenavLinks.length; iRow++) {
		var opensidenav = sidenavLinks[iRow];
		if (opensidenav.classList.contains('aDead')) {
			opensidenav.classList.remove('aDead');
	  }   
	}
	IsSideNavOpen = true;
}

function closeSideNav() {
    document.getElementById("mySidenav").style.width = "0";
	var sidenavLinks = document.getElementsByClassName("sidenavLink");
	var iRow;
	for (iRow = 0; iRow < sidenavLinks.length; iRow++) {
		var opensidenav = sidenavLinks[iRow];
		if (!opensidenav.classList.contains('aDead')) {
			opensidenav.classList.add('aDead');
	  }   
	}
	IsSideNavOpen = false;
	
}


function SideNavToggle() {
	//alert('bbb');
	if (IsSideNavOpen) {
		closeSideNav();
	}
	else {
		//alert('ccc');
		openSideNav();
	}
}




$(document).ready(function(){
/* 
	Close the SideNav menu if the user clicks outside of it.
*/

$('body').click(function(event) {
    //alert('targ class = '+ $(event.target).attr('class'));
    //alert('ancestor class = '+ $(event.target).closest(".sidenavLangbtn").attr('class'));
	var IsClickSideNav = typeof $(event.target).closest('.sidenav').attr('class') !== "undefined";
	IsClickSideNavBtn = typeof $(event.target).closest('.sidenavbtn').attr('class') !== "undefined";
	if ((!IsClickSideNav) && !IsClickSideNavBtn) {
		closeSideNav();
	}
	
});	//$('body').click()




}); /*document.ready*/