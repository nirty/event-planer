
<!DOCTYPE HTML>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>CIT 597: Ajax to get a quote - P. Palmer</title>

<!--[if IE]>

<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">

</script>

<![endif]-->

<script type="text/javascript">

<!--

    var po =
    {


        createXMLHTTPRequest: function () {
            if ((typeof XMLHttpRequest !== 'undefined')
              && (window.location.protocol !== 'file:')
              || (!window.ActiveXObject)) {
                return new XMLHttpRequest(); // Firefox
            }
            else {
                try { return new ActiveXObject('Msxml2.XMLHTTP.6.0'); } // IE
                catch (sixerr) { }
                try { return new ActiveXObject('Msxml2.XMLHTTP.3.0'); } // IE
                catch (threrr) { }
                try { return new ActiveXObject('Msxml2.XMLHTTP'); } // IE
                catch (err) { }
            }
            return null;
        },


        callServer: function () {


            // ------ prepare the URL ------
            var myURL =
            "http://palmer-vm.seas.upenn.edu/User23/EventProject/EventHandler.ashx";
            var myParam =
            encodeURI(document.getElementById('numquotes').value);





            // ------ create the XHR object ------
            var myRequest = null;
            try {
                myRequest = po.createXMLHTTPRequest();
                if (myRequest == null) {
                    alert('Count not create XMLHTTPRequest');
                    return;
                }
                myRequest.open("POST", myURL, true);
            }
            catch (err4) {
                alert('Could not create XMLHTTPRequest object');
                return;
            }

            // ------ assign callback to this anonymous inner function ------
            myRequest.onreadystatechange = function () {
                if (myRequest.readyState == 4) {

                    if (myRequest.status == 200) {
                        // update page with results
                        document.getElementById('TextArea1').innerHTML =
                           '<p>' + myRequest.responseText + '</p>';
                    }
                    else {
                        // update page with status error
                        document.getElementById('TextArea1').innerHTML =
                           myRequest.status.toString();
                    }

                } // end if readyState == 4
            } // end anonymous inner function




            // ------ make the call ------
            try {
                myRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); // required by POST

                myRequest.send('num_quotes=' + myParam);
                // HTTP POST body contains parameters
            }
            catch (err5) {
                alert('failed to send to server');
                return;
            }



            return;
        } // end callServer

    } // end po   

//-->

</script>

<style type="text/css">

<!--



section, article, header, footer, nav, aside, hgroup {

    display: block;

}

body {

	background-color: #DDD;

}

.answer {

	width:350px;

	height:150px;

}

p {

    font-size:x-large

}

-->

</style>

</head>

<body>




Number of quotes to fetch:<input id="numquotes" type="text">

<br>

<input type="submit" value="Get quote(s)" onclick="po.callServer();"> 



<br>&nbsp;<br>



<div id="TextArea1">

</div>



</body>

</html>