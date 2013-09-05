$(document).ready(function(){
	if( $('#partner_text').length>0) {
		new nicEditor({
			fullPanel : true
		}).panelInstance('partner_text',{hasPanel : true});
	}
});