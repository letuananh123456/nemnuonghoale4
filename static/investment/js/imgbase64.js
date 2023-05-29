function readURL(input,typeImage,typePer,typeLhbh) {
    console.log("khanh")
    if (input.files && input.files[0]) {
    let cha0 = input.closest(".file-upload")
    let val_base64 = $(cha0).find(".img_base64")
    let cha = $(cha0).find(".file-upload-content")
    let reader = new FileReader();
    reader.onload = function (e) {
        $(cha0).find('.image-upload-wrap').hide();
        $(cha).find('.file-upload-image').attr('src', e.target.result);
        $(cha0).find('.file-upload-content').show();
        $(cha).find('.image-title').html(input.files[0].name);
        let str = e.target.result;
        $(val_base64).val(str)
        loadGoogleVision(input,str,typeImage,typePer,typeLhbh)
    };
    reader.readAsDataURL(input.files[0]);
    }
}

// load ajax google vision 
function loadGoogleVision(input,strBase64,typeImage,typePer,typeLhbh) {
    console.log(input)
    let cha0 = input.closest(".pt-1")
    let namegg = $(cha0).find(".namegg")
    let socmtgg = $(cha0).find(".socmtgg")
    let addgg = $(cha0).find(".addgg")
    let ngaygg = $(cha0).find(".ngaygg")
    let thanggg = $(cha0).find(".thanggg")
    let namgg = $(cha0).find(".namgg")

    let mydata = JSON.stringify({
        strBase64: strBase64,
        typeImage:typeImage,
        typePer:typePer,
        typeLhbh:typeLhbh
    });
    $("#loadajax").show()
    $.ajax({
        type: 'POST',
        url: '/api-base64-images/',
        data: mydata,
        contentType: "application/json",
        dataType: 'json'
    }).done(function (data, statusText, xhr) {
        console.log(data.ngaysinh)
        $('#loadajax').delay(500).fadeOut('fast');
        namegg.val(data.name)
        socmtgg.val(data.socmt)
        ngaygg.val(data.ngaysinh[0])
        thanggg.val(data.ngaysinh[1])
        namgg.val(data.ngaysinh[2])
        addgg.val(data.address+","+data.quanhuyen)


    }).fail(function (xhr, textStatus, errorThrown) {
        $('#loadajax').hide();
        swal("Chú ý!", "Sai định dạng ảnh, yêu cầu chọn ảnh", "error");

    });
}

function removeUpload(e) {
    let removeCha = e.closest('.file-upload-content')
    let removeCha1 = e.closest('.file-upload')
    $(removeCha).hide();
    $(removeCha1).find('.image-upload-wrap').show();
}

$(".file-upload-input").click(function () {
    let removeCha1 = $(this).parents('.file-upload')
    if ($(removeCha1).find('.file-upload-image').attr('src')!="#") {
        $(removeCha1).find('.image-upload-wrap').hide();
        $(removeCha1).find('.file-upload-content').show(1000);
    }
})

if ($('.file-upload-image').attr('src')!="#") {
    $('.image-upload-wrap').hide();
    $('.file-upload-content').show(1000);
}