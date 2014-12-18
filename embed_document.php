<?php
/**
 * MediaWiki Embed Document extension
 */
$wgExtensionCredits['parserhook'][] = array(
        'name' => 'Embed Document',
        'author' => array('SLohse', 'DrTrigon'),
        'version' => '0.13',
        'url' => 'http://www.mediawiki.org/wiki/Extension:Embed_Document',
        'description' => 'Allows embedding *.pdf, *.doc and *.wav files on a wiki page',
);
 
$wgExtensionFunctions[] = 'registerEmbedDocumentHandler';
 
function registerEmbedDocumentHandler() {
         global $wgParser;
         $wgParser->setHook( 'embed_document', 'embedDocumentHandler' );
}
 
function embedDocumentHandler( $input, $argv ) {
    $allowedchars = array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                          'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                          'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
                          'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                          '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                          '_', '/', '.', '-', ':');
 
    $w = '100%';
    $h = '680';
    foreach( $argv as $name => $value )
    {
        if ($name == 'width')  $w = $value;
        if ($name == 'height') $h = $value;
    }
 
    if( str_replace($allowedchars, '', $input) == '' ) {
       # note that the following line does not have to run $input through htmlspecialchars($input) because the 'if' condition above already
       # is intended to filter out illegal or dangerous characters that could create a XSS vulnerability
       return "<iframe width=" . $w . " height=" . $h . " src=" . $input . " frameborder=0 framebordercolor=#00000></iframe>";
    } else {
       return "<font color=#aa0000>Error: invalid character sequence between <code>&amp;lt;embed_document&amp;gt;...&amp;lt;/embed_document&amp;gt;</code> markers, allowed
are only<ul><li>a...z</li><li>A...Z</li><li>0...9</li><li>_</li><li>/</li><li>.</li><li>-</li><li>:</li></ul></font>";
   }
}
?>