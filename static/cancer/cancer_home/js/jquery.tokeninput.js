(function($){var DEFAULT_SETTINGS={method:"GET",queryParam:"q",searchDelay:300,minChars:1,propertyToSearch:"name",jsonContainer:null,contentType:"json",prePopulate:null,processPrePopulate:false,hintText:"Type in a search term",noResultsText:"No results",searchingText:"Searching...",deleteText:"&times;",animateDropdown:true,theme:null,zindex:999,resultsLimit:null,enableHTML:false,resultsFormatter:function(item){var string=item[this.propertyToSearch];return"<li>"+(this.enableHTML?string:_escapeHTML(string))+"</li>";},tokenFormatter:function(item){var string=item[this.propertyToSearch];return"<li><p>"+(this.enableHTML?string:_escapeHTML(string))+"</p></li>";},tokenLimit:null,tokenDelimiter:",",preventDuplicates:false,tokenValue:"id",allowFreeTagging:false,onResult:null,onCachedResult:null,onAdd:null,onFreeTaggingAdd:null,onDelete:null,onReady:null,idPrefix:"token-input-",disabled:false};var DEFAULT_CLASSES={tokenList:"token-input-list",token:"token-input-token",tokenReadOnly:"token-input-token-readonly",tokenDelete:"token-input-delete-token",selectedToken:"token-input-selected-token",highlightedToken:"token-input-highlighted-token",dropdown:"token-input-dropdown",dropdownItem:"token-input-dropdown-item",dropdownItem2:"token-input-dropdown-item2",selectedDropdownItem:"token-input-selected-dropdown-item",inputToken:"token-input-input-token",focused:"token-input-focused",disabled:"token-input-disabled"};var POSITION={BEFORE:0,AFTER:1,END:2};var KEY={BACKSPACE:8,TAB:9,ENTER:13,ESCAPE:27,SPACE:32,PAGE_UP:33,PAGE_DOWN:34,END:35,HOME:36,LEFT:37,UP:38,RIGHT:39,DOWN:40,NUMPAD_ENTER:108,COMMA:188};var HTML_ESCAPES={'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#x27;','/':'&#x2F;'};var HTML_ESCAPE_CHARS=/[&<>"'\/]/g;function coerceToString(val){return String((val===null||val===undefined)?'':val);}function _escapeHTML(text){return coerceToString(text).replace(HTML_ESCAPE_CHARS,function(match){return HTML_ESCAPES[match];});}var methods={init:function(url_or_data_or_function,options){var settings=$.extend({},DEFAULT_SETTINGS,options||{});return this.each(function(){$(this).data("settings",settings);$(this).data("tokenInputObject",new $.TokenList(this,url_or_data_or_function,settings));});},clear:function(){this.data("tokenInputObject").clear();return this;},add:function(item){this.data("tokenInputObject").add(item);return this;},remove:function(item){this.data("tokenInputObject").remove(item);return this;},get:function(){return this.data("tokenInputObject").getTokens();},toggleDisabled:function(disable){this.data("tokenInputObject").toggleDisabled(disable);return this;},setOptions:function(options){$(this).data("settings",$.extend({},$(this).data("settings"),options||{}));return this;}}
$.fn.tokenInput=function(method){if(methods[method]){return methods[method].apply(this,Array.prototype.slice.call(arguments,1));}else{return methods.init.apply(this,arguments);}};$.TokenList=function(input,url_or_data,settings){if($.type(url_or_data)==="string"||$.type(url_or_data)==="function"){$(input).data("settings").url=url_or_data;var url=computeURL();if($(input).data("settings").crossDomain===undefined&&typeof url==="string"){if(url.indexOf("://")===-1){$(input).data("settings").crossDomain=false;}else{$(input).data("settings").crossDomain=(location.href.split(/\/+/g)[1]!==url.split(/\/+/g)[1]);}}}else if(typeof(url_or_data)==="object"){$(input).data("settings").local_data=url_or_data;}if($(input).data("settings").classes){$(input).data("settings").classes=$.extend({},DEFAULT_CLASSES,$(input).data("settings").classes);}else if($(input).data("settings").theme){$(input).data("settings").classes={};$.each(DEFAULT_CLASSES,function(key,value){$(input).data("settings").classes[key]=value+"-"+$(input).data("settings").theme;});}else{$(input).data("settings").classes=DEFAULT_CLASSES;}var saved_tokens=[];var token_count=0;var cache=new $.TokenList.Cache();var timeout;var input_val;var input_box=$("<input type=\"text\"  autocomplete=\"off\">").css({outline:"none"}).attr("id",$(input).data("settings").idPrefix+input.id).focus(function(){if($(input).data("settings").disabled){return false;}else
if($(input).data("settings").tokenLimit===null||$(input).data("settings").tokenLimit!==token_count){show_dropdown_hint();}token_list.addClass($(input).data("settings").classes.focused);}).blur(function(){hide_dropdown();$(this).val("");token_list.removeClass($(input).data("settings").classes.focused);if($(input).data("settings").allowFreeTagging){add_freetagging_tokens();}else{$(this).val("");}token_list.removeClass($(input).data("settings").classes.focused);}).bind("keyup keydown blur update",resize_input).keyup(function(event){var previous_token;var next_token;switch(event.keyCode){case KEY.LEFT:case KEY.RIGHT:case KEY.UP:case KEY.DOWN:if(!$(this).val()){previous_token=input_token.prev();next_token=input_token.next();if((previous_token.length&&previous_token.get(0)===selected_token)||(next_token.length&&next_token.get(0)===selected_token)){if(event.keyCode===KEY.LEFT||event.keyCode===KEY.UP){deselect_token($(selected_token),POSITION.BEFORE);}else{deselect_token($(selected_token),POSITION.AFTER);}}else if((event.keyCode===KEY.LEFT||event.keyCode===KEY.UP)&&previous_token.length){select_token($(previous_token.get(0)));}else if((event.keyCode===KEY.RIGHT||event.keyCode===KEY.DOWN)&&next_token.length){select_token($(next_token.get(0)));}}else{var dropdown_item=null;if(event.keyCode===KEY.DOWN||event.keyCode===KEY.RIGHT){dropdown_item=$(selected_dropdown_item).next();}else{dropdown_item=$(selected_dropdown_item).prev();}if(dropdown_item.length){select_dropdown_item(dropdown_item);}}return false;break;case KEY.BACKSPACE:previous_token=input_token.prev();if(!$(this).val().length){if(selected_token){delete_token($(selected_token));hidden_input.change();}else if(previous_token.length){select_token($(previous_token.get(0)));}return false;}else if($(this).val().length===1){hide_dropdown();}else{setTimeout(function(){do_search();},5);}break;case KEY.TAB:case KEY.ENTER:case KEY.NUMPAD_ENTER:case KEY.COMMA:if(selected_dropdown_item){add_token($(selected_dropdown_item).data("tokeninput"));hidden_input.change();}else{if($(input).data("settings").allowFreeTagging){add_freetagging_tokens();}else{$(this).val("");}event.stopPropagation();event.preventDefault();}return false;case KEY.ESCAPE:hide_dropdown();return true;default:if(String.fromCharCode(event.which)){setTimeout(function(){do_search();},5);}break;}});var hidden_input=$(input).hide().val("").focus(function(){focus_with_timeout(input_box);}).blur(function(){input_box.blur();});var selected_token=null;var selected_token_index=0;var selected_dropdown_item=null;var token_list=$("<ul />").addClass($(input).data("settings").classes.tokenList).click(function(event){var li=$(event.target).closest("li");if(li&&li.get(0)&&$.data(li.get(0),"tokeninput")){toggle_select_token(li);}else{if(selected_token){deselect_token($(selected_token),POSITION.END);}focus_with_timeout(input_box);}}).mouseover(function(event){var li=$(event.target).closest("li");if(li&&selected_token!==this){li.addClass($(input).data("settings").classes.highlightedToken);}}).mouseout(function(event){var li=$(event.target).closest("li");if(li&&selected_token!==this){li.removeClass($(input).data("settings").classes.highlightedToken);}}).insertBefore(hidden_input);var input_token=$("<li />").addClass($(input).data("settings").classes.inputToken).appendTo(token_list).append(input_box);var dropdown=$("<div>").addClass($(input).data("settings").classes.dropdown).appendTo("body").hide();var input_resizer=$("<tester/>").insertAfter(input_box).css({position:"absolute",top:-9999,left:-9999,width:"auto",fontSize:input_box.css("fontSize"),fontFamily:input_box.css("fontFamily"),fontWeight:input_box.css("fontWeight"),letterSpacing:input_box.css("letterSpacing"),whiteSpace:"nowrap"});hidden_input.val("");var li_data=$(input).data("settings").prePopulate||hidden_input.data("pre");if($(input).data("settings").processPrePopulate&&$.isFunction($(input).data("settings").onResult)){li_data=$(input).data("settings").onResult.call(hidden_input,li_data);}if(li_data&&li_data.length){$.each(li_data,function(index,value){insert_token(value);checkTokenLimit();});}if($(input).data("settings").disabled){toggleDisabled(true);}if($.isFunction($(input).data("settings").onReady)){$(input).data("settings").onReady.call();}this.clear=function(){token_list.children("li").each(function(){if($(this).children("input").length===0){delete_token($(this));}});}
this.add=function(item){add_token(item);}
this.remove=function(item){token_list.children("li").each(function(){if($(this).children("input").length===0){var currToken=$(this).data("tokeninput");var match=true;for(var prop in item){if(item[prop]!==currToken[prop]){match=false;break;}}if(match){delete_token($(this));}}});}
this.getTokens=function(){return saved_tokens;}
this.toggleDisabled=function(disable){toggleDisabled(disable);}
function escapeHTML(text){return $(input).data("settings").enableHTML?text:_escapeHTML(text);}function toggleDisabled(disable){if(typeof disable==='boolean'){$(input).data("settings").disabled=disable}else{$(input).data("settings").disabled=!$(input).data("settings").disabled;}input_box.attr('disabled',$(input).data("settings").disabled);token_list.toggleClass($(input).data("settings").classes.disabled,$(input).data("settings").disabled);if(selected_token){deselect_token($(selected_token),POSITION.END);}hidden_input.attr('disabled',$(input).data("settings").disabled);}function checkTokenLimit(){if($(input).data("settings").tokenLimit!==null&&token_count>=$(input).data("settings").tokenLimit){input_box.hide();hide_dropdown();return;}}function resize_input(){if(input_val===(input_val=input_box.val())){return;}input_resizer.html(_escapeHTML(input_val));input_box.width(input_resizer.width()+30);}function is_printable_character(keycode){return((keycode>=48&&keycode<=90)||(keycode>=96&&keycode<=111)||(keycode>=186&&keycode<=192)||(keycode>=219&&keycode<=222));}function add_freetagging_tokens(){var value=$.trim(input_box.val());var tokens=value.split($(input).data("settings").tokenDelimiter);$.each(tokens,function(i,token){if(!token){return;}if($.isFunction($(input).data("settings").onFreeTaggingAdd)){token=$(input).data("settings").onFreeTaggingAdd.call(hidden_input,token);}var object={};object[$(input).data("settings").tokenValue]=object[$(input).data("settings").propertyToSearch]=token;add_token(object);});}function insert_token(item){var $this_token=$($(input).data("settings").tokenFormatter(item));var readonly=item.readonly===true?true:false;if(readonly)$this_token.addClass($(input).data("settings").classes.tokenReadOnly);$this_token.addClass($(input).data("settings").classes.token).insertBefore(input_token);if(!readonly){$("<span>"+$(input).data("settings").deleteText+"</span>").addClass($(input).data("settings").classes.tokenDelete).appendTo($this_token).click(function(){if(!$(input).data("settings").disabled){delete_token($(this).parent());hidden_input.change();return false;}});}var token_data=item;$.data($this_token.get(0),"tokeninput",item);saved_tokens=saved_tokens.slice(0,selected_token_index).concat([token_data]).concat(saved_tokens.slice(selected_token_index));selected_token_index++;update_hidden_input(saved_tokens,hidden_input);token_count+=1;if($(input).data("settings").tokenLimit!==null&&token_count>=$(input).data("settings").tokenLimit){input_box.hide();hide_dropdown();}return $this_token;}function add_token(item){var callback=$(input).data("settings").onAdd;if(token_count>0&&$(input).data("settings").preventDuplicates){var found_existing_token=null;token_list.children().each(function(){var existing_token=$(this);var existing_data=$.data(existing_token.get(0),"tokeninput");if(existing_data&&(existing_data[settings.tokenValue]===item[settings.tokenValue]||existing_data[settings.propertyToSearch]===item[settings.propertyToSearch])){found_existing_token=existing_token;return false;}});if(found_existing_token){select_token(found_existing_token);input_token.insertAfter(found_existing_token);focus_with_timeout(input_box);return;}}if($(input).data("settings").tokenLimit==null||token_count<$(input).data("settings").tokenLimit){insert_token(item);checkTokenLimit();}input_box.val("");hide_dropdown();if($.isFunction(callback)){callback.call(hidden_input,item);}}function select_token(token){if(!$(input).data("settings").disabled){token.addClass($(input).data("settings").classes.selectedToken);selected_token=token.get(0);input_box.val("");hide_dropdown();}}function deselect_token(token,position){token.removeClass($(input).data("settings").classes.selectedToken);selected_token=null;if(position===POSITION.BEFORE){input_token.insertBefore(token);selected_token_index--;}else if(position===POSITION.AFTER){input_token.insertAfter(token);selected_token_index++;}else{input_token.appendTo(token_list);selected_token_index=token_count;}focus_with_timeout(input_box);}function toggle_select_token(token){var previous_selected_token=selected_token;if(selected_token){deselect_token($(selected_token),POSITION.END);}if(previous_selected_token===token.get(0)){deselect_token(token,POSITION.END);}else{select_token(token);}}function delete_token(token){var token_data=$.data(token.get(0),"tokeninput");var callback=$(input).data("settings").onDelete;var index=token.prevAll().length;if(index>selected_token_index)index--;token.remove();selected_token=null;focus_with_timeout(input_box);saved_tokens=saved_tokens.slice(0,index).concat(saved_tokens.slice(index+1));if(index<selected_token_index)selected_token_index--;update_hidden_input(saved_tokens,hidden_input);token_count-=1;if($(input).data("settings").tokenLimit!==null){input_box.show().val("");focus_with_timeout(input_box);}if($.isFunction(callback)){callback.call(hidden_input,token_data);}}function update_hidden_input(saved_tokens,hidden_input){var token_values=$.map(saved_tokens,function(el){if(typeof $(input).data("settings").tokenValue=='function')return $(input).data("settings").tokenValue.call(this,el);return el[$(input).data("settings").tokenValue];});hidden_input.val(token_values.join($(input).data("settings").tokenDelimiter));}function hide_dropdown(){dropdown.hide().empty();selected_dropdown_item=null;}function show_dropdown(){dropdown.css({position:"absolute",top:$(token_list).offset().top+$(token_list).height(),left:$(token_list).offset().left,width:$(token_list).width(),'z-index':$(input).data("settings").zindex}).show();}function show_dropdown_searching(){if($(input).data("settings").searchingText){dropdown.html("<p>"+escapeHTML($(input).data("settings").searchingText)+"</p>");show_dropdown();}}function show_dropdown_hint(){if($(input).data("settings").hintText){dropdown.html("<p>"+escapeHTML($(input).data("settings").hintText)+"</p>");show_dropdown();}}var regexp_special_chars=new RegExp('[.\\\\+*?\\[\\^\\]$(){}=!<>|:\\-]','g');function regexp_escape(term){return term.replace(regexp_special_chars,'\\$&');}function highlight_term(value,term){return value.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)("+regexp_escape(term)+")(?![^<>]*>)(?![^&;]+;)","gi"),function(match,p1){return"<b>"+escapeHTML(p1)+"</b>";});}function find_value_and_highlight_term(template,value,term){return template.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)("+regexp_escape(value)+")(?![^<>]*>)(?![^&;]+;)","g"),highlight_term(value,term));}function populate_dropdown(query,results){if(results&&results.length){dropdown.empty();var dropdown_ul=$("<ul>").appendTo(dropdown).mouseover(function(event){select_dropdown_item($(event.target).closest("li"));}).mousedown(function(event){add_token($(event.target).closest("li").data("tokeninput"));hidden_input.change();return false;}).hide();if($(input).data("settings").resultsLimit&&results.length>$(input).data("settings").resultsLimit){results=results.slice(0,$(input).data("settings").resultsLimit);}var noResults=true;$.each(results,function(index,value){if(!settings.preventDuplicates||!isSelected(value[settings.propertyToSearch])){var this_li=$(input).data("settings").resultsFormatter(value);this_li=find_value_and_highlight_term(this_li,value[$(input).data("settings").propertyToSearch],query);this_li=$(this_li).appendTo(dropdown_ul);if(index%2){this_li.addClass($(input).data("settings").classes.dropdownItem);}else{this_li.addClass($(input).data("settings").classes.dropdownItem2);}if(noResults){select_dropdown_item(this_li);}noResults=false;$.data(this_li.get(0),"tokeninput",value);}});if(noResults){show_no_results();}else{show_dropdown();}if($(input).data("settings").animateDropdown){dropdown_ul.slideDown("fast");}else{dropdown_ul.show();}}else{show_no_results();}}function show_no_results(){if(settings.noResultsText){dropdown.html("<p>"+settings.noResultsText+"</p>");show_dropdown();}}function isSelected(name){var itemSelected=false;$.each(saved_tokens,function(saved_index,saved_value){if(saved_value[settings.propertyToSearch]==name||saved_value[settings.tokenValue]==name){return itemSelected=true;}});return itemSelected;}function select_dropdown_item(item){if(item){if(selected_dropdown_item){deselect_dropdown_item($(selected_dropdown_item));}item.addClass($(input).data("settings").classes.selectedDropdownItem);selected_dropdown_item=item.get(0);}}function deselect_dropdown_item(item){item.removeClass($(input).data("settings").classes.selectedDropdownItem);selected_dropdown_item=null;}function do_search(){var query=input_box.val();if(query&&query.length){if(selected_token){deselect_token($(selected_token),POSITION.AFTER);}if(query.length>=$(input).data("settings").minChars){show_dropdown_searching();clearTimeout(timeout);timeout=setTimeout(function(){run_search(query);},$(input).data("settings").searchDelay);}else{hide_dropdown();}}}function run_search(query){var cache_key=query+computeURL();var cached_results=cache.get(cache_key);if(cached_results){if($.isFunction($(input).data("settings").onCachedResult)){cached_results=$(input).data("settings").onCachedResult.call(hidden_input,cached_results);}populate_dropdown(query,cached_results);}else{if($(input).data("settings").url){var url=computeURL();var ajax_params={};ajax_params.data={};if(url.indexOf("?")>-1){var parts=url.split("?");ajax_params.url=parts[0];var param_array=parts[1].split("&");$.each(param_array,function(index,value){var kv=value.split("=");ajax_params.data[kv[0]]=kv[1];});}else{ajax_params.url=url;}ajax_params.data[$(input).data("settings").queryParam]=query;ajax_params.type=$(input).data("settings").method;ajax_params.dataType=$(input).data("settings").contentType;if($(input).data("settings").crossDomain){ajax_params.dataType="jsonp";}ajax_params.success=function(results){cache.add(cache_key,$(input).data("settings").jsonContainer?results[$(input).data("settings").jsonContainer]:results);if($.isFunction($(input).data("settings").onResult)){results=$(input).data("settings").onResult.call(hidden_input,results);}if(input_box.val()===query){populate_dropdown(query,$(input).data("settings").jsonContainer?results[$(input).data("settings").jsonContainer]:results);}};$.ajax(ajax_params);}else if($(input).data("settings").local_data){var results=$.grep($(input).data("settings").local_data,function(row){return row[$(input).data("settings").propertyToSearch].toLowerCase().indexOf(query.toLowerCase())>-1;});cache.add(cache_key,results);if($.isFunction($(input).data("settings").onResult)){results=$(input).data("settings").onResult.call(hidden_input,results);}populate_dropdown(query,results);}}}function computeURL(){var url=$(input).data("settings").url;if(typeof $(input).data("settings").url=='function'){url=$(input).data("settings").url.call($(input).data("settings"));}return url;}function focus_with_timeout(obj){setTimeout(function(){obj.focus();},50);}};$.TokenList.Cache=function(options){var settings=$.extend({max_size:500},options);var data={};var size=0;var flush=function(){data={};size=0;};this.add=function(query,results){if(size>settings.max_size){flush();}if(!data[query]){size+=1;}data[query]=results;};this.get=function(query){return data[query];};};}(jQuery));