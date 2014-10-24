// $('a[href*="temu.com"]').hide();

$( "span>:contains('temu.com')" ).css( "color", "red" );
$( "span>:contains('temu.com')" ).append( '<span style="font-size: 20px"> ❌' );
