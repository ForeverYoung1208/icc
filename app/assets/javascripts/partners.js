$(document).ready(function(){
	if( $('#partner_text').length>0) {
		new nicEditor({
			fullPanel : true,
			uploadURI : location.protocol + "//" + location.host+'/images/store'
		}).panelInstance('partner_text',{hasPanel : true});
	}
});