// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){ $(document).foundation(); });
    	var lang="en";
        function set_lang(){
        	//alert(lang);
            //get current lang by button image name
            var img_url= $("#btn_lang").attr("src");
            var res = img_url.split("/");
            var res_count = res.length;
            var img_name = res[res_count-1];
            var img = img_name.split(".");
            var cur_lang = img[0];
            var to_lang;  
            if (cur_lang == 'en') to_lang = 'jp';
            else to_lang = 'en'
            //alert(cur_lang);
            //update language parts
            //alert("http://vmio.e-demo.jp/cts/shop/get_gui");
            var lang_index = 'ml-';
            $.ajax({
                url: "http://vmio.e-demo.jp/cts/shop/get_gui",
                type: "POST",
                data: {language:to_lang},
                datatype: 'json',
                success: function(data){
                    //var returnedData = JSON.parse(data);
                    var items = [];
                    $.each( data, function( key, val ) {
                        //alert(key);
                        $('[id='+lang_index+key+']').html(val);//$('[id^='+obj+']').hide();//hide element start with obj
                        $('[class='+lang_index+key+']').html(val);//class begin with ml
                    });
                }
            });



            
            ///test:
            //gui['shopName'] = '店舗名';
            //var lang_index = 'ml_';
            //$('[id^='+lang_index+']').html();
            //change lang button
            $("#btn_lang").attr("src", "http://vmio.e-demo.jp/cts/img/"+to_lang+".png");
            lang = to_lang;
        }

