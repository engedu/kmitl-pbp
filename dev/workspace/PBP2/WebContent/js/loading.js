/* Open Loading Block  */

openWaiting = function(){
	$.blockUI( {
		css : {
			border : 'none',
			padding : '13px',
			backgroundColor : '#000',
			'-webkit-border-radius' : '10px',
			'-moz-border-radius' : '10px',
			opacity : .5,
			width :'25%'
		},
		message : '<font size="5" color="#ffffff">Please wait...</font>'
	});
};

function closeWaiting() {
	$.unblockUI();
}


/*-------------UTILITY--------------*/
var Utility = {
	DEBUG: false
	,escapeStr:	function (myid) {
		if(Utility.DEBUG){
			console.log("FUNC escapeStr");
			console.log(myid);
			console.log(myid.length);
		}
		var escapeData = '';
		for(var i=0; i< myid.length; i++){
	    	tempStr = myid.charAt(i); 
			if((tempStr.match(/([[])/g)!=null)
	    		||(tempStr.match(/(])/g)!=null)
	    		||(tempStr.match(/(:|\.)/g)!=null)){
	    		tempStr = '\\'+tempStr;
	    	}
	    	escapeData += tempStr;
		}
		if(Utility.DEBUG){
			console.log(escapeData);
		}
		
		return escapeData;
	}
	,setChkboxDataBoolean: function(id){
		var STATUS = {
			A: true
			,I: false
		};
		
		var targetEl = $(Utility.escapeStr('#'+id+'Temp'));
		if(Utility.DEBUG){
			console.log("FUNC setChkboxData");
			console.log("id: "+id);
			console.log("id+Temp: "+id+"Temp");
			console.log(" targetEl.attr('checked')!=null ");
			console.log(targetEl.attr('checked')!=null);
			console.log($(Utility.escapeStr('#'+id)).attr('value'));
		};
		var setStatus = STATUS.I;
		
		if(targetEl.attr('checked')!=null){
			setStatus = STATUS.A;
		}
		
		$(Utility.escapeStr('#'+id)).attr('value', setStatus);
		
		if(Utility.DEBUG){
			console.log("last Value");
			console.log($(Utility.escapeStr('#'+id)).attr('value'));
		};
	}
	,addJavascript: function(jsname,pos) {
		var th = document.getElementsByTagName(pos)[0];
		var s = document.createElement('script');
		s.setAttribute('type','text/javascript');
		s.setAttribute('src',jsname);
		th.appendChild(s);
	}
	// Example
	// addJavascript('./myApp/examDefine.js','head');
	// addJavascript('./myApp/examConfig.js','head');
};

var carlendarUtil = {
	DEBUG: false
	,isSingleDate: true 
	,setCarlendarInput: function(){
		if(carlendarUtil.DEBUG){
			console.log("setCarlenderInput-isSingleDate "+carlendarUtil.isSingleDate);
		}
		var targetEl = '#holidayDate';
		$('#durationDate-begin, #durationDate-end').hide();
		$('#singleDate').hide();
		
		if($('#yearId').attr('value').length>0){
			if(!carlendarUtil.isSingleDate){
				targetEl = '#startDate, #endDate';
				$('#durationDate-begin, #durationDate-end').show();
			}else{
				$('#singleDate').show();
			}
			
			$(targetEl).datepicker( {
				yearRange: 'c:c', 
				changeMonth: true,
				changeYear: true,
				showOn : 'both',
				buttonText : 'Choose a date',
				buttonImage : '/PAM/images/calendar.jpg',
				buttonImageOnly : true,
				showButtonPanel : true
			});
			$.datepicker.setDefaults($.datepicker.regional['th']);
			
			carlendarUtil.yearRangeAdj();
			
			$('.yearSelect').show();
		}else{
			$('.yearSelect').hide();
		}
	}
	,toggleIsSingleDate: function(){
		if(carlendarUtil.DEBUG){
			console.log(carlendarUtil.isSingleDate);
		}
		carlendarUtil.isSingleDate = !carlendarUtil.isSingleDate;
		carlendarUtil.setCarlendarInput();
	}
	,yearRangeAdj:	function (clearDate){
		var yearIdSelect = $('#yearId').attr('value');
		var targetEl = '#holidayDate';
		
		if(!carlendarUtil.isSingleDate){
			targetEl = '#startDate, #endDate';
		}
			
		if(yearIdSelect.length>0){
			if(carlendarUtil.DEBUG){
				console.log('year->:'+$('#yearId').attr('value'));
			}
			
			var targetIndex = 0;
			/* begin: find SelectIndex */
			var yearData = $('#yearId').find('option');
			
			for(var i=0; i<yearData.length; i++){
				if(carlendarUtil.DEBUG){
					console.log(i+": "+$($('#yearId').find('option')[i]).attr('value'));
				}
			    if(yearIdSelect == $($('#yearId').find('option')[i]).attr('value')){
					targetIndex = i;
					break;
				}
			}
			/* end: find SelectIndex */
			
			var yearSelected = ($($('#yearId').find('option')[targetIndex]).html().replace(/\s/g, ''));
			$(targetEl).datepicker('option', 'yearRange', yearSelected+":"+yearSelected);
			$(targetEl).datepicker( "option", "minDate", new Date(yearSelected, 1 - 1, 1) );
			$(targetEl).datepicker( "option", "maxDate", new Date(yearSelected, 12 - 1, 31) );
			
			if(clearDate!=null){
				$(targetEl).attr('value', '');
			}
		}
	}
	,startDateWasChange: function (){
		var startDate = $('#startDate').datepicker( "getDate" );
		if(startDate!=null){
			$('#endDate').datepicker( "option", "minDate", new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate()) );
		}else{
			alert('someThingHappen-startDatewasChange');
		}
	}
	,endDateWasChange: function(){
		var endDate = $('#endDate').datepicker( "getDate" );
		if(endDate){
			$('#startDate').datepicker( "option", "maxDate", new Date(endDate.getFullYear(), endDate.getMonth(), endDate.getDate()) );
		}else{
			alert('someThingHappen-endDatewasChange');
		}
	}
};
