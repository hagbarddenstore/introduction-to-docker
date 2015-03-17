$(function () {
    var calls = [];

    function poll() {
        $.get('/proxy.php', function (data) {
            calls.push(data);

            while (calls.length > 20) {
                calls.shift();
            }

            if (calls.indexOf("v1") > -1) {
                $('#v1').html("<h2>v1 - Up</h2>");
                $('#v1').addClass('bg-success');
                $('#v1').removeClass('bg-danger');
            } else {
                $('#v1').html("<h2>v1 - Down</h2>");
                $('#v1').addClass('bg-danger');
                $('#v1').removeClass('bg-success');
            }

            if (calls.indexOf("v2") > -1) {
                $('#v2').html("<h2>v2 - Up</h2>");
                $('#v2').addClass('bg-success');
                $('#v2').removeClass('bg-danger');
            } else {
                $('#v2').html("<h2>v2 - Down</h2>");
                $('#v2').addClass('bg-danger');
                $('#v2').removeClass('bg-success');
            }

            if (calls.indexOf("v3") > -1) {
                $('#v3').html("<h2>v3 - Up</h2>");
                $('#v3').addClass('bg-success');
                $('#v3').removeClass('bg-danger');
            } else {
                $('#v3').html("<h2>v3 - Down</h2>");
                $('#v3').addClass('bg-danger');
                $('#v3').removeClass('bg-success');
            }

            if (calls.indexOf("v4") > -1) {
                $('#v4').html("<h2>v4 - Up</h2>");
                $('#v4').addClass('bg-success');
                $('#v4').removeClass('bg-danger');
            } else {
                $('#v4').html("<h2>v4 - Down</h2>");
                $('#v4').addClass('bg-danger');
                $('#v4').removeClass('bg-success');
            }

            setTimeout(poll, 100);
        });
    }

    poll();
});
