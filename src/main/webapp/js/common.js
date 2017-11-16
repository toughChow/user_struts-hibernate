$(function() {
    // 设置自适应高

    // 问题一：使用window.resize 兼容问题
    // $(window).resize(function() {
    $(".panel").height($(window).height());
    $(".left").height($(window).height() - 110);
    $(".right").height($(window).height() - 110);

    $(".panel").width($(window).width()-250);
    $(".header_change").width($(window).width());
    $(".content_change").width($(window).width());
    $(".right").width($(window).width()-250);
    $(".myForm").width($(window).width()-250);
    $(".myList-table").width($(window).width()-500);

    var flag = false;

    // 验证用户名
    var $username = $("input[name='username']");
    $username.on("blur", function() {
        if ($username.val().trim() == 0) {
            $('#usernameMsg').show();
            $('#usernameMsg').html("用户名不能为空").css({ "color": "red" });
            return false;
        } else if ($username.val().length < 6 || $username.val().length > 20) {
            $('#usernameMsg').show();
            $('#usernameMsg').html("用户名长度必须在6到20个字符之间").css({ "color": "red" });
            return false;
        } else {
            flag = true;
            $('#usernameMsg').hide();
        }
    });

    // 验证密码
    var $password = $("input[name='password']");
    $password.on("blur", function() {
        if ($password.val() == 0) {
            $('#passwordeMsg').show();
            $('#passwordeMsg').html("密码不能为空").css({ "color": "red" });
            return false;
        } else if ($password.val().length < 6 || $password.val().length > 20) {
            $('#passwordeMsg').show();
            $('#passwordeMsg').html("密码长度必须在6到20个字符之间").css({ "color": "red" });
            return false;
        } else {
            flag = true;
            $('#passwordeMsg').hide();
        }
    });

    // 验证确认密码
    var $passwordConfirm = $("input[name='passwordConfirm']");
    $passwordConfirm.on("blur", function() {
        if ($passwordConfirm.val().trim() == 0) {
            $('#passwordConfirmMsg').show();
            $('#passwordConfirmMsg').html("确认密码不能为空").css({ "color": "red" });
            return false;
        } else if ($passwordConfirm.val().length < 6 || $passwordConfirm.val().length > 20) {
            $('#passwordConfirmMsg').show();
            $('#passwordConfirmMsg').html("确认密码长度须在6到20个字符之间").css({ "color": "red" });
            return false;
        } else {
            flag = true;
            $('#passwordConfirmMsg').hide();
        }
    });

    //验证邮箱
    var $email = $("input[name='email']");
    $email.on("blur", function() {
        var $checkEmail = /\w+[@]{1}\w+[.]\w+/;
        if ($email.val().trim() == 0) {
            $('#emailMsg').show();
            $('#emailMsg').html("邮箱不能为空").css({ "color": "red" });
            return false;
        } else if (!($checkEmail.test($email.val()))) { // 验证邮箱格式
            $('#emailMsg').show();
            $('#emailMsg').html("邮箱格式有误").css({ "color": "red" });
            return false;
        } else {
            flag = true;
            $('#emailMsg').hide();
        }
    });


    $("#myForm-submit").on("click", "", { "judge": flag }, function(event) {
        if (flag == false) {
            alert("请确定信息无误后提交");
            // alert(event.data.judge);
            event.preventDefault();
        }
    });

});