	if (window.location.href.indexOf("/#license") > -1) {
			$(".tabLink").removeClass("activeLink");
			$("[data-id='cont-3']").addClass("activeLink");
			$(".tabcontent").addClass("hide");
			$("#cont-3-1").removeClass("hide");
			$("#legalTab").val('cont-3');
		}
		if (window.location.href.indexOf("/#termsofuse") > -1) {
			$(".tabLink").removeClass("activeLink");
			$("[data-id='cont-4']").addClass("activeLink");
			$(".tabcontent").addClass("hide");
			$("#cont-4-1").removeClass("hide");
			$("#legalTab").val('cont-4');
		}
		if (window.location.href.indexOf("/#isnp") > -1) {
			$(".tabLink").removeClass("activeLink");
			$("[data-id='cont-6']").addClass("activeLink");
			$(".tabcontent").addClass("hide");
			$("#cont-6-1").removeClass("hide");
			$("#legalTab").val('cont-6');
			$("[data-id=cont-6-1-1]").addClass("activeLink");
			$("#cont-6-1-1-1").removeClass("hide");
		}
		$(".tabLink").each(function() {
        $(this).click(function() {
            tabeId = $(this).attr('data-id');
            $(".tabLink").removeClass("activeLink");
            $(".tabcontent").addClass("hide");
            if (tabeId == 'cont-6') {
                $("[data-id=" + tabeId + "]").addClass("activeLink");
                $("#" + tabeId + "-1").removeClass("hide");
                $("[data-id=" + tabeId + "-1-1]").addClass("activeLink");
                $("#" + tabeId + "-1-1-1").removeClass("hide");
            } else if (tabeId == 'cont-6-1-1') {
                $("#cont-6-1").removeClass("hide");
                $("[data-id=cont-6]").addClass("activeLink");
                $("[data-id=cont-6-1-1]").addClass("activeLink");
                $("#cont-6-1-1-1").removeClass("hide");
            } else if (tabeId == 'cont-6-1-2') {
                $("#cont-6-1").removeClass("hide");
                $("[data-id=cont-6]").addClass("activeLink");
                $("[data-id=cont-6-1-2]").addClass("activeLink");
                $("#cont-6-1-2-1").removeClass("hide");
            } else {
                $(this).addClass("activeLink");
                $("#" + tabeId + "-1").removeClass("hide");
            }
            return false;
        });
    });
		$(document).on('change', '#legalTab', function() {
        var tabeId = $(this).val();
        $('div.tabcontent').removeClass('hide').addClass('hide');
        $('#' + tabeId + '-1').removeClass('hide');
        if (tabeId == 'cont-6') {
            $("#" + tabeId + "-1").removeClass("hide");
            $("[data-id=" + tabeId + "-1-1]").addClass("activeLink");
            $("#" + tabeId + "-1-1-1").removeClass("hide");
        }
		});
		