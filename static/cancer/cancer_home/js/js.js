   
function getGA360PageName(refUrl,isRef){
    var filename = refUrl.split("/");
    var lastName = filename[filename.length-2];
    lastName = lastName.replace(/-/g, ' ');

    var isInsuranceCompanies = refUrl.indexOf("insurance-companies");
    var isArticles = refUrl.indexOf("articles");
    var isNews = refUrl.indexOf("news");
    var isArticleListing = refUrl.indexOf("travel-insurance/articles/");
    var isNewsListing = refUrl.indexOf("travel-insurance/news/");
    var pageName = '';
    var LblCountryName = '';
    var chkCountry = [["schengen",0,"Schengen"],["-canada",210,"Canada"],["canada-",210,"Canada"],["-hong-kong",76,"Hong Kong"],["hong-kong-",76,"Hong Kong"],["-malaysia",100,"Malaysia"],["malaysia-",100,"Malaysia"],["-singapore",111,"Singapore"],["-australia",122,"Australia"],["australia-",122,"Australia"],["-germany",164,"Germany"],["germany-",164,"Germany"],["-uk",200,"United Kingdom of Great Britain(UK)"],["uk-",200,"United Kingdom of Great Britain(UK)"],["-usa",262,"United States of America (USA)"],["usa-",262,"United States of America (USA)"],["us-",262,"United States of America (USA)"],["-uae",116,"United Arab Emirates (UAE)"],["uae-",116,"United Arab Emirates (UAE)"],["-dubai",116,"United Arab Emirates (UAE)"],["dubai-",116,"United Arab Emirates (UAE)"],["-thailand",115,"Thailand"],["thailand-",115,"Thailand"],["-sri-lanka",68,"Sri Lanka"],["sri-lanka-",68,"Sri Lanka"],["japan-",81,"Japan"],["-vietnam",112,"Vietnam"],["vietnam-visa",112,"Vietnam"],["italy-visa",171,"Itely"],["spain-visa",191,"Spain"],["singapore-",111,"Singapore"]];
    for(var cnt=0;cnt<chkCountry.length;cnt++)
    {   
        if(refUrl.indexOf(chkCountry[cnt][0])>0)
        {
            LblCountryName =  chkCountry[cnt][2];
            break;
        } 
    }                 
    if(isInsuranceCompanies > -1){
        LblCountryName = refUrl.split('/');
        LblCountryName = LblCountryName[LblCountryName.length-2];
            LblCountryName = LblCountryName.replace(/-travel-insurance/g, '');
            LblCountryName = LblCountryName.toLowerCase().replace(/\b[a-z]/g, function(letter) {
                return letter.toUpperCase();
            });
        pageName = 'Trv.Content Provider - '+LblCountryName;
    }else if(isArticleListing == 31){
        pageName = 'Trv.Article listing';
    }else if(isArticles > -1){
        pageName = 'Trv.Articles';
    }else if(isNewsListing == 31){
        pageName = 'Trv.News listing';
    }else if(isNews > -1){
        pageName = 'Trv.News';
    }
    else if(refUrl.indexOf("-visa") > -1)
    {
        pageName = 'Trv.Content Visa - '+LblCountryName;
    }else if(refUrl.indexOf("dti") > -1)
    {
        pageName = 'Trv.Content Destination - '+LblCountryName;
    }else{
        if(refUrl.indexOf("-travel-insurance") > -1 || refUrl.indexOf("flight-insurance") > -1 || refUrl.indexOf("travel-insurance-contact-number") > -1 || refUrl.indexOf("visa-on-arrival-for-indians") > -1 || refUrl.indexOf("visa-free-countries-for-indians") > -1){
            LblCountryName = refUrl.split('/');
            LblCountryName = LblCountryName[LblCountryName.length-2];
            LblCountryName = LblCountryName.replace(/-travel-insurance/g, '');
            if(refUrl.indexOf("travel-insurance-contact-number") > -1)
                LblCountryName = 'Contact num';
            else if(refUrl.indexOf("flight-insurance") > -1)
            LblCountryName = 'Flight';
            else if(refUrl.indexOf("visa-on-arrival-for-indians") > -1)
            LblCountryName = 'Visa on arrival for indians';
            else if(refUrl.indexOf("visa-free-countries-for-indians") > -1)
            LblCountryName = 'Visa free countries for indians';
            LblCountryName = LblCountryName.toLowerCase().replace(/\b[a-z]/g, function(letter) {
                return letter.toUpperCase();
            });
            pageName = 'Trv.Content - BU - '+LblCountryName;
        }else if(refUrl.indexOf("travel-insurance") > -1 || refUrl.indexOf("other-insurance") > -1)
            pageName = 'Trv.Content - BU';
    }
    if(pageName=='' && isRef==true)
        pageName = lastName;
    return pageName;    
}
GApageName = getGA360PageName(window.location.href,false);
GAprevPageName = '';
if(document.referrer !=''){
 GAprevPageName = getGA360PageName(document.referrer,true);
}


dataLayer=[{
        'pageLanguage':'en',
        'pageType': 'prequote page',                 
        'lobSection1':'cancer insurance', 
        'lobSection2':'bu-seo',
        'lobSection3':'',                
                        'flowName': 'seo',
        'pageName': 'cancer insurance',
        'prevPage': '',        
                               
        'productId':'138'  
}]        

    (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    'js/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','dataLayer','GTM-PW5K');

    
var addClass = function(currentItem) {
    currentItem.classList.add('active');
    currentItem.parentElement.children[1].classList.add('slidedown');
};
var removeClass = function() {
    for (var i = 0; i < submenuopen.length; i++) {
        submenuopen[i].classList.remove('active');
        submenuopen[i].parentElement.children[1].classList.remove('slidedown');
    }
    addClass(this);
};

function openNav() {
    var mobNav = document.getElementById("mobNav");
    mobNav.style.width = "250px";
    //document.body.style.backgroundColor = "rgba(0,0,0,0.6)";
}
/* Set the width of the side navigation to 0 */
function closeNav() {
    var mobNav = document.getElementById("mobNav");
    mobNav.style.width = "0px";
    document.body.style.backgroundColor = "white";
}
var submenuopen = document.getElementsByClassName("submenu");
for (var i = 0; i < submenuopen.length; i++) {
    submenuopen[i].addEventListener('click', removeClass, false);
}
var fixed = document.getElementById('mobNav');
if (fixed) {
    try {
        fixed.addEventListener('touchmove', function(e) {
            e.preventDefault();
            e.preventDefault();
        }, false);
    } catch (e) {}
}

 
function setCookie(name,value,expires,path,domain,secure){cookieStr=name+"="+escape(value)+"; ";if(expires){expires=setExpiration(expires);cookieStr+="expires="+expires+"; ";}if(path){cookieStr+="path="+path+"; ";}if(domain){cookieStr+="domain="+domain+"; ";}if(secure){cookieStr+="secure; ";}document.cookie=cookieStr;}function setExpiration(cookieLife){var today=new Date();var expr=new Date(today.getTime()+cookieLife*60*1000);return expr.toGMTString();}
function getCookie(cname){var name=cname+"=";var ca=document.cookie.split(';');for(var i=0;i<ca.length;i++){var c=ca[i];while(c.charAt(0)==' ')c=c.substring(1);if(c.indexOf(name)==0)return c.substring(name.length,c.length);}return"";}
$(document).ready(function(){
   

 try {
            $('.reviewbox-slide').slick({
                dots: false,
               slidesToShow: 3,
                infinite: true,
                slidesToScroll: 1,
                responsive: [
                    {
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1,
                            infinite: true,
                            autoplay: true
                        }
                    },
                    {
                        breakpoint: 770,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 1,
                            autoplay: true
                        }
                    },
                    {
                        breakpoint: 482,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1,
                            autoplay: true,
                            arrow: false
                        }
                    }

                ]
            });
        } catch (e) {
        }


    try{
		
        //Stricky Menu
        $(window).scroll(function(){
            var scrolltop = $(this).scrollTop();
            if(scrolltop < 200) 
                $('nav').removeClass('fixedh');
            else
                $('nav').addClass('fixedh');
	})
        //Menu js for mobile
        $('.humberIcon').click(function(event) {
            $('.overlaybox').show();
            $('body').css({'overflow':'hidden','position':'fixed','height': '100%'});
            $('.policynav').addClass('menuslide');
	});
	$('.closenav,.overlaybox').click(function(event) {
            $('.overlaybox').hide();
            $('body').removeAttr('style');
            $('.policynav').removeClass('menuslide');
	});
        $('#metismenu li ul').hide();
	$('#metismenu li a.list_item').click(function (event) {
            var currObj = $(this);
            if (currObj.parent().children("ul").length > 0) {
                if ($(this).parent('li').hasClass('active')) {
                    $('#metismenu li').removeClass('active');
                    $('#metismenu li ul').hide();
                } else {
                    $('#metismenu li').removeClass('active');
                    currObj.parent().addClass('active');
                    $('#metismenu li ul').hide();
                    $('#metismenu li.active ul').show();
                }
            }
	});

    $(window).scroll(function () {
            if ($(this).scrollTop() > 600) {
                $('.backtotop').fadeIn();
            } else {
                $('.backtotop').fadeOut();
            }
        });

        $('.backtotop').click(function (e) {
            e.preventDefault();
            $('html,body').animate({
                scrollTop: 0
            }, 500);
        });
    }catch(e){}



});


        var objAgent = navigator.userAgent;
        var webpType;
        var is_chrome = ((navigator.userAgent.toLowerCase().indexOf('chrome') > -1) &&(navigator.vendor.toLowerCase().indexOf("google") > -1));
        webpType = (is_chrome) ? "1" : "";
       
   
    
    $(document).ready(function(){
        if(webpType ==1){
            $("html").addClass('webp');
        }else{
            $("html").addClass('no-webp');
        }
       
    });

    


    $(function() {
        $('.lazy').Lazy({
            placeholder: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII="
        });
    });


    $(document).ready(function () {
        $(window).resize(function () {
            var wnheight = $(window).height();
            //console.log(wnheight);
            $('#menu_v3').css({'height': wnheight, 'overflow-y': 'scroll'});
        });
        $('.pbfaqQues').click(function () {
            $(this).next('.pbfaqAns').slideToggle(800);
        })

        $('.pbNewsTitle').click(function () {
            $(this).next('.pbNewsContent').slideToggle(800);
        })
        /*----------------------For Main Navivation Header---------------*/
        $('.navigation_bar > ul > li').hover(function () {
            $(this).addClass("visited");
            $('div', this).stop(true, false).slideDown(300);
        }, function () {
            $(this).removeClass("visited");
            $('div', this).stop(true, false).slideUp(100);
        });


        /*----------------------End For Main Navivation Header---------------*/

        var width = $('.providerandproductContent').width();
        $('.providerandproductContent table').wrap('<div class="footable" style></div>')

        /*----------------------Product Partner---------------*/
        $('.newsassion_info .close').click(function(){
                $('.newsassion_info').hide();
                setCookie("caroffer", 1, 5, "/", "", !1);
        });
        $('#footerStripCarForm .strip_close').click(function(){
                $('#footerStripCarForm').hide();
                setCookie("carstickyclose", 1, 5, "/", "", !1);
        });
        
        $('#footerStripTWForm .strip_close').click(function(){
                $('#footerStripTWForm').hide();
                setCookie("twstickyclose", 1, 5, "/", "", !1);
        });
		
        $('#footerStripHealthForm .strip_close').click(function(){
                $('#footerStripHealthForm').hide();
                setCookie("healthstickyclose", 1, 5, "/", "", !1);
        });
        $('#footerStripTermForm .strip_close').click(function(){
                $('#footerStripTermForm').hide();
                setCookie("termstickyclose", 1, 5, "/", "", !1);
        });
        $('#footerStripInvForm .strip_close').click(function(){
                $('#footerStripInvForm').hide();
                setCookie("invstickyclose", 1, 5, "/", "", !1);
        });
        $('#footerStripInvestmentForm .strip_close').click(function(){
                $('#footerStripInvestmentForm').hide();
                setCookie("investmentstickyclose", 1, 5, "/", "", !1);
        });
        try {
            $('#productPartner .responsive').slick({
                dots: false,
                speed: 300,
                slidesToShow: 5,
                infinite: true,
                slidesToScroll: 1,
                responsive: [
                    {
                        breakpoint: 1024,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1,
                            infinite: true,
                            autoplay: true
                        }
                    },
                    {
                        breakpoint: 600,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 1,
                            autoplay: true
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1,
                            autoplay: true,
                            arrow: false
                        }
                    }

                ]
            });
        } catch (e) {
        }
        /*----------------------Product Partner---------------*/
        /*----------------------travel slider---------------*/

        $(function () {
            var slickOpts = {
                dots: true,
                infinite: true,
                speed: 500,
                autoplay: true
            };

            // Init the slick    
            try {$('.single-item').slick(slickOpts);} catch (e) {}
        });


        try {

            $('.single-item,.aboutSliderWrap').slick({
                dots: true,
                speed: 300,
                infinite: true,
                slidesToShow: 1,
                slidesToScroll: 1,
                arrow: false,
                customPaging: function (slider, i) {
                    var nameImg = ['/careers/images/sai.png', '/careers/images/dhruve.png', '/careers/images/neeraj-a.png']
                    var img = '<img src="' + nameImg[i] + '">';
                    //var thumb = $(slider.$slides[i]).data(img);
                    //var thumb = '/careers/images/neeraj-a.png';

                    return '<a>' + img + '</a>';
                },

            });
        } catch (e) {
        }

         /*----------------------articles landing page bottom news slider---------------*/
        try {
             $('.newsSection .newsLanding').slick({
                dots: true,
                infinite: true,
                slidesToShow:3,
                slidesToScroll: 1,
                responsive: [
                    {
                      breakpoint: 1024,
                      settings: {
                        slidesToShow: 3,
                        slidesToScroll: 3,
                        infinite: true,
                        dots: true
                      }
                    },
                    {
                      breakpoint: 840,
                      settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                      }
                    },
                    {
                      breakpoint: 568,
                      settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1,
                         infinite: true,
                        dots: true
                      }
                    },
                    
                  ]
            });
        } catch (e) {}
         /*----------------------articles listing life insurance slider---------------*/
        try {
             $('.article-slider').slick({
               
                infinite: true,
                slidesToShow:1,
                slidesToScroll: 1            
            });
        } catch (e) {}

 /*----------------------life articles landingr---------------*/
         try {
             $('.ca-wrapper .innerSlide').slick({
               
                infinite: true,
                slidesToShow:1,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 2000,
               
            });
        } catch (e) {}

        

        
        /*----------------------travel slider---------------*/
        //Display toll free menu
        $('.mobileData').click(function (event) {
            if ($(this).attr('data-mob') == 'yes') {
                if ($('.restTollFree').css('display') == "none")
                    $('.restTollFree,.tollFreeMenu').show();
                else {
                    $('.restTollFree,.tollFreeMenu').hide();
                }
            }
            event.stopPropagation();
        });
        //Menu open and close js
        var wnWidth = $(window).width();
        var wnheight = $(window).height();
        $('#menu_v3').css({'height': wnheight, 'overflow-y': 'scroll'});
        $("#humb_bg_menu").click(function () {
            if ($(this).hasClass("active")) {
                $('.overflowHide').hide(200);
                $('body').css({'overflow': 'auto', 'position': 'static', 'height': 'auto'});
                $('#menu_v3').removeAttr('style');
                $(".sidebar").css({"left": -275});
                $(this).removeClass("active");
            } else {
                $('.overflowHide').show(200);
                $('body').css({'overflow': 'hidden', 'position': 'fixed', 'height': '100%'});

                $(".sidebar").css({"left": 0});
                $(this).addClass("active");
            }
        });
        $(".close_panel").click(function () {
            $('.overflowHide').hide(200);
            $('body').css({'overflow': 'auto', 'position': 'static', 'height': 'auto'});
            $('#menu_v3').removeAttr('style');

            $(".sidebar").css({"left": -275});
            $("#humb_bg_menu").removeClass("active");
        });

        //Drop down menu for sidebar menu
        $('#menu_v3 li ul').hide();
        $('#menu_v3 li.active ul').show();
        $('#menu_v3 li').click(function () {
            var currObj = $(this);
            if (currObj.children("ul").length > 0) {
                if ($(this).hasClass('active')) {
                    $('#menu_v3 li').removeClass('active');
                    $('#menu_v3 li ul').hide();
                } else {
                    $('#menu_v3 li').removeClass('active');
                    currObj.addClass('active');
                    $('#menu_v3 li ul').hide();
                    $('#menu_v3 li.active ul').show();
                }
            }
        });
		                isLocal();                
            });




    var fixed = document.getElementById('menu_v3');
    if (fixed) {
        try {
            fixed.addEventListener('touchmove', function (e) {
                //e.preventDefault();
            }, false);
        } catch (e) {
        }
    }
	function isLocal(){    
        $.ajax({
            url: 'policybazzar-home/cj-process.php?type=ipdetection',
            type: "GET",
            cache: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                userType = 'user';
                if(data)
                   userType = 'agent';
               
                $('#gaData').attr('data-user-type',userType);
            }
        });
    }


    $(function () {
       
        //Added for content update on bu pages
        try {
            $('.leftSection p').addClass('paragraphBu');
            $('.leftSection table').wrap('<div class="footable"></div>');
            $('.leftSection .footable').parent().removeClass('footable');
        } catch (e) {
        }
    })






    $(document).ready(function () {
        InsertTracking('0', '27.72.102.104', 'ifnqscn26fmqa5pp9hk1ru6im2', '', '', 'BU', '', 'PB', '/cancer-insurance/', '0');
        navigator.sayswho = (function () {
            var N = navigator.appName, ua = navigator.userAgent, tem;
            var M = ua.match(/(opera|chrome|safari|firefox|msie)\/?\s*(\.?\d+(\.\d+)*)/i);
            if (M && (tem = ua.match(/version\/([\.\d]+)/i)) != null)
                M[2] = tem[1];
            M = M ? [M[1], M[2]] : [N, navigator.appVersion, '-?'];
            return M.join(' ');
        })();
    });


    $(document).ready(function () {
        //According for content
        try{
            $('.faqsWrapper ul li h2 a,.faqsWrapper ul li h3 a,.faqsWrapper ul li h4 a').attr('flag','down') 
            var flagVal = $('.faqsWrapper ul li h2 a,.faqsWrapper ul li h3 a,.faqsWrapper ul li h4 a').attr('flag');
            $('.faqsWrapper ul li h2 a,.faqsWrapper ul li h3 a,.faqsWrapper ul li h4 a').click(function(){
                var flagVal = $(this).attr('flag');
                if(flagVal == 'down' ){
                    $(this).parent().parent().find('div').slideDown();
                    $(this).attr('flag','');
                    $(this).attr('flag','up').addClass('minusPos');
                }
                if(flagVal == 'up' ){
                    $(this).parent().parent().find('div').slideUp();
                    $(this).attr('flag','');
                    $(this).attr('flag','down').removeClass('minusPos');
                }
            }); 
        } catch(e){}

});

