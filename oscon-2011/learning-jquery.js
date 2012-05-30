// $ is a function, the bling function.

// Sets the alternate rows to be odd
$('table tr:nth-child(odd)').addClass('odd');


// jQuery should get loaded last on your page.  Prototype uses the $ function, and will eat jQuery's $.  But jQuery won't stomp on 
// the Prototype $ function.

// Put your Javascript last on the page, because the <script> tag blocks the rendering of the web page.

$(document).ready( function () {
    // <YOU>
} );

// or simpler

$(function () {
    // <YOU>
});
