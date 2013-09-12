
$(document).ready(function(){
	if( $('#newse_text_ua').length>0) {
		new nicEditor({
			fullPanel : true,
			uploadURI : location.protocol + "//" + location.host+'/images/store'
		}).panelInstance('newse_text_ua',{hasPanel : true});

		new nicEditor({
			fullPanel : true,
			uploadURI : location.protocol + "//" + location.host+'/images/store'
		}).panelInstance('newse_text_en',{hasPanel : true});

		new nicEditor({
			fullPanel : true,
			uploadURI : location.protocol + "//" + location.host+'/images/store'
		}).panelInstance('newse_text_ru',{hasPanel : true});
	}
});