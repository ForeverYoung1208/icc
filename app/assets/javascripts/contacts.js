
$(document).ready(function(){
	if( $('#contact_text_ua').length>0) {
		new nicEditor({
			fullPanel : true
		}).panelInstance('contact_text_ua',{hasPanel : true});

		new nicEditor({
			fullPanel : true
		}).panelInstance('contact_text_en',{hasPanel : true});

		new nicEditor({
			fullPanel : true
		}).panelInstance('contact_text_ru',{hasPanel : true});
	}
});