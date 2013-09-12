
$(document).ready(function(){
	if( $('#service_text_ua').length>0) {
		new nicEditor({
			fullPanel : true,
			uploadURI : location.protocol + "//" + location.host+'/images/store'
		}).panelInstance('service_text_ua',{hasPanel : true});

		new nicEditor({
			fullPanel : true,
			uploadURI : location.protocol + "//" + location.host+'/images/store'
		}).panelInstance('service_text_en',{hasPanel : true});

		new nicEditor({
			fullPanel : true,
			uploadURI : location.protocol + "//" + location.host+'/images/store'
		}).panelInstance('service_text_ru',{hasPanel : true});
	}
});