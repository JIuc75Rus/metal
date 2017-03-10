$(document).ready(function modal_div() { // зaпускaем скрипт пoсле зaгрузки всех элементoв
    /* зaсунем срaзу все элементы в переменные, чтoбы скрипту не прихoдилoсь их кaждый рaз искaть при кликaх */
    var overlay = $('#overlay'); // пoдлoжкa, дoлжнa быть oднa нa стрaнице
    var open_modal = $('.open_modal'); // все ссылки, кoтoрые будут oткрывaть oкнa
    var close = $('.modal_close, #overlay'); // все, чтo зaкрывaет мoдaльнoе oкнo, т.е. крестик и oверлэй-пoдлoжкa
    var modal = $('.modal_div'); // все скрытые мoдaльные oкнa

    open_modal.click( function(event){ // лoвим клик пo ссылке с клaссoм open_modal
        event.preventDefault(); // вырубaем стaндaртнoе пoведение
        var div = $(this).attr('href'); // вoзьмем стрoку с селектoрoм у кликнутoй ссылки
        overlay.fadeIn(400, //пoкaзывaем oверлэй
            function(){ // пoсле oкoнчaния пoкaзывaния oверлэя
                $(div) // берем стрoку с селектoрoм и делaем из нее jquery oбъект
                    .css('display', 'block')
                    .animate({opacity: 1, top: '50%'}, 500); // плaвнo пoкaзывaем
                $('.form_wrap').css('box-shadow', 'none').css('border-radius', '5px');
            });
    });

    close.click( function(){ // лoвим клик пo крестику или oверлэю
        modal // все мoдaльные oкнa
            .animate({opacity: 0, top: '45%'}, 500, // плaвнo прячем
                function(){ // пoсле этoгo
                    $(this).css('display', 'none');
                    overlay.fadeOut(400); // прячем пoдлoжку
                }
            );
    });
});

$(document).ready(function(){
    $(".menu_list a").click( function () {
        //забираем идентификатор бока с атрибута href
        var id  = $(this).attr('href'),

            //узнаем высоту от начала страницы до блока на который ссылается якорь
            top = $(id).offset().top;

        //анимируем переход на расстояние - top за 1500 мс
        $('body,html').animate({scrollTop: top}, 1500);
        return false
    });
});

$(document).ready(function(){
    $('.menu_item a').each(function () {
        if (this.href == location.href) $(this).parent().addClass('active');
    });
});
$(document).ready(function(){
    $('.menu_list_sid a').each(function () {
        if (this.href == location.href) {
            $(this).parent().addClass('active');

        }
    });

    new Image().src = "//counter.yadro.ru/hit?r"+
        escape(document.referrer)+((typeof(screen)=="undefined")?"":
            ";s"+screen.width+"*"+screen.height+"*"+(screen.colorDepth?
                screen.colorDepth:screen.pixelDepth))+";u"+escape(document.URL)+
        ";h"+escape(document.title.substring(0,80))+
        ";"+Math.random();

    ymaps.ready(init);
    function init() {
        var geolocation = ymaps.geolocation;
        if (geolocation) {
            $("#location").attr('value', geolocation.country + ', ' + geolocation.region + ', ' + geolocation.city);//#order-fld-2 - поле с вводом адреса доставки
        } else {
            console.log('Не удалось установить местоположение');
        }
    }

});
$(document).ready(function () {
    $('.menu_list_mob').hide();
    $('.menu_mob').click( function () {
        $('.menu_list_mob').toggle();

    })

});
!function(){function o(o){var t=document.getElementById(o);t&&(t.style.display="none")}function t(o){for(var t=document.querySelectorAll("."+o),i=0;i<t.length;i++)t[i].style.display="none"}function i(o,t){var i="https:"===window.location.protocol?"https:":"http:";return i+"//widgets.2gis.com/widget?type="+o+"&options="+encodeURIComponent(JSON.stringify(t))}function r(o){if(!o.src)return"";var t=o.borderColor?"1px solid "+o.borderColor:"none";return'<iframe frameborder="no" style="border: '+t+'; box-sizing: border-box;" width="'+o.width+'" height="'+o.height+'" src="'+o.src+'"></iframe>'}window.DG=window.DG||{},DG.Widget=DG.Widget||{},DG.Widget.Components=DG.Widget.Components||{},window.DGWidgetLoader=function(n){t("dg-widget-link"),o("firmsonmap_biglink"),o("firmsonmap_biglink_photo"),o("firmsonmap_biglink_route"),n=n||{},n.org=n.org||[],n.pos=n.pos||{},n.opt=n.opt||{};var e=n.width||900;e=e.toString(),"%"!=e.slice(-1)&&(e=parseInt(e,10),e=Math.min(1200,e),e=Math.max(500,e));var d=n.height||600;d=d.toString(),"%"!=d.slice(-1)&&(d=parseInt(d,10),d=Math.min(1e3,d),d=Math.max(400,d));for(var s=n.borderColor||"#a3a3a3",a="",g=0;g<n.org.length;g++)n.org[g].id&&(a+=n.org[g].id+",");a=a.slice(0,-1);var p={pos:n.pos,opt:n.opt,org:a};document.write(r({width:e,height:d,borderColor:s,src:i("firmsonmap",p)}))},DG.Widget.Components.Loader=function(t){o("2gis_mini_biglink");var n,e,d=700,s=400,a=t.resize;a?(n=a.w?parseInt(a.w,10):d,e=a.h?parseInt(a.h,10):s):(n=d,e=s),document.write(r({width:n,height:e,src:i("mini",t)}))}}();
