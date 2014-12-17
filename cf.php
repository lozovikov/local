<?php
// 2010-12-29

function cf_debug($input)
{
	echo '<pre>';
	print_r($input);
	echo '</pre>';
}


function cf_redirect($uri = NULL)
{
	header('Location: ' . (cf_isNonEmptyString($uri) ? $uri : $_SERVER['REQUEST_URI']));
}


function cf_hscLite($input)
{
	return str_replace('"', '&quot;', $input);
}


function cf_validateEmail($input, $allow_local = false)
{
	$mask = $allow_local
		? '/[a-z0-9_\.-]+@[a-z0-9_\.-]*[a-z0-9_-]+(\.[a-z]{2,})?/i'
		: '/[a-z0-9_\.-]+@[a-z0-9_\.-]*[a-z0-9_-]+\.[a-z]{2,}/i';
		
	return preg_match($mask, $input);
}

function cf_stringBeginsFrom($haystack, $needle)
{
	return strpos($haystack, $needle) === 0;
}

function cf_stringEndsWith($haystack, $needle)
{
	return strpos($haystack, $needle) === (strlen($haystack) - 1);
}

function cf_stringContains($haystack, $needle)
{
	return is_int(strpos($haystack, $needle));
}

function cf_isNonEmptyString($input)
{
	return is_string($input) && ($input !== '');
}


function cf_limitString($input, $length = 255)
{
	if (!is_string($input) || !cf_isNaturalNumeric($length)) {
		return false;
	}	
	return substr($input, 0, $length);
}


function cf_isIntegerNumeric($input)
{
	if (is_numeric($input)) {
		$intval = intval($input);		
		return (($intval == floatval($input)) && !is_int(strpos($input, '.')));
	}
	else {
		return false;
	}
}

function cf_isNaturalNumeric($input)
{
	if (is_numeric($input)) {
		$intval = intval($input);		
		return (($intval >= 1) && ($intval == floatval($input)) && !is_int(strpos($input, '.')));
	}
	else {
		return false;
	}
}


function cf_isNaturalOrZeroNumeric($input)
{
	if (is_numeric($input)) {	
		return ($input == 0) || cf_isNaturalNumeric($input);
	}
}


function cf_isPositiveNumeric($input)
{
	return (is_numeric($input) && (floatval($input) > 0));
}


function cf_isNonNegativeNumeric($input)
{
	return (is_numeric($input) && (floatval($input) >= 0));
}


function cf_isEmptyArray($input)
{
	return is_array($input) && (count($input) === 0);
}

function cf_isNonEmptyArray($input)
{
	return is_array($input) && (count($input) > 0);
}



function cf_arrayHasKeysBeginningFrom($string, $array)
{
	if (!cf_isNonEmptyString($string) && !cf_isNonEmptyArray($array)) {
		return false;
	}
	
	foreach (array_keys($array) as $key) {
		if (cf_stringBeginsFrom($key, $string)) {
			return true;
		}
	}
	
	return false;
}


function cf_removeArrayKeysBeginningFrom($string, $array)
{
	if (!cf_isNonEmptyString($string) && !cf_isNonEmptyArray($array)) {
		return false;
	}
	
	foreach (array_keys($array) as $key) {
		if (cf_stringBeginsFrom($key, $string)) {
			unset($array[$key]);
		}
	}
	
	return $array;
}

function cf_removeArrayValuesBeginningFrom($string, $array)
{
	if (!cf_isNonEmptyString($string) && !cf_isNonEmptyArray($array)) {
		return false;
	}
	
	foreach ($array as $key => $elem) {
		if (!is_string($elem) || cf_stringBeginsFrom($elem, $string)) {
			unset($array[$key]);
		}
	}
	
	return $array;
}


function cf_removeArrayKeysNotBeginningFrom($string, $array)
{
	if (!cf_isNonEmptyString($string) && !cf_isNonEmptyArray($array)) {
		return false;
	}
	
	foreach (array_keys($array) as $key) {
		if (!cf_stringBeginsFrom($key, $string)) {
			unset($array[$key]);
		}
	}
	
	return $array;
}


function cf_removeArrayValuesNotBeginningFrom($string, $array)
{
	if (!cf_isNonEmptyString($string) && !cf_isNonEmptyArray($array)) {
		return false;
	}
	
	foreach ($array as $key => $elem) {
		if (!is_string($elem) || !cf_stringBeginsFrom($elem, $string)) {
			unset($array[$key]);
		}
	}
	
	return $array;
}



function cf_unserializeSmart($input, $always_return_array = true, $auto_fix = true)
{
	$output = $always_return_array ? array() : false;
	
	if (cf_isNonEmptyString($input)) {
		$result = @unserialize($input);
		if ($result === false) {
			if ($auto_fix) {
				$input = cf_fixSerialized($input);
				return cf_unserializeSmart($input, $always_return_array, false);
			}
		}
		else
		{
			$output = $result;
		}
	}
	
	return $output;
}

function cf_fixSerialized($input)
{
	return preg_replace_callback(
		'!(?<=^|;)s:(\d+)(?=:"(.*?)";(?:}|a:|s:|b:|i:|o:|N;))!s',
		'cf_fixSerializedCallback', $input
		);
}

function cf_fixSerializedCallback($match)
{
    return 's:' . strlen($match[2]);
}

function cf_nullOrBool($input)
{
	return is_null($input) ? NULL : (bool)$input;
}

function cf_nullOrInt($input)
{
	return is_null($input) ? NULL : (int)$input;
}

function cf_nullOrFloat($input)
{
	return is_null($input) ? NULL : (float)$input;
}


function cf_uriIs($realm, $uri = NULL, $case_sensitive = false, $ignore_get = false, $ignore_slash = true)
{
	if (!is_string($realm)) {
		return false;
	}	
	
	if (!is_string($uri)) {
		$uri	= $_SERVER['REQUEST_URI'];
	}
	
	if ($ignore_get) {
		$realm	= array_shift(explode('?', $realm));
		$uri	= array_shift(explode('?', $uri));			
	}
	
	if ($ignore_slash) {
		$realm	= rtrim($realm,	'/');
		$uri	= rtrim($uri,	'/');
	}	
	
	if (!$case_sensitive) {
		$realm	= strtolower($realm);
		$uri	= strtolower($uri);
	}
	
	return $realm === $uri;
}

function cf_uriIn($realm, $uri = NULL, $case_sensitive = false, $ignore_get = false, $ignore_slash = true)
{
	if (!is_string($realm)) {
		return false;
	}	
	
	if (!is_string($uri)) {
		$uri = $_SERVER['REQUEST_URI'];
	}
	
	if ($ignore_get) {
		$realm	= array_shift(explode('?', $realm));
		$uri	= array_shift(explode('?', $uri));			
	}
	
	if ($ignore_slash) {
		$realm	= rtrim($realm, '/');
		$uri	= rtrim($uri, '/');
	}		
	
	if (!$case_sensitive)
	{
		$realm	= strtolower($realm);
		$uri	= strtolower($uri);
	}
	
	return (strlen($realm) > 0) && (cf_stringBeginsFrom($uri, $realm));
}


function cf_uriXin($realm, $uri = NULL, $case_sensitive = false, $ignore_get = false, $ignore_slash = true)
{
	if (!is_string($realm)) {
		return false;
	}	
	
	if (!is_string($uri)) {
		$uri = $_SERVER['REQUEST_URI'];
	}
	
	if ($ignore_get) {
		$realm	= array_shift(explode('?', $realm));
		$uri	= array_shift(explode('?', $uri));			
	}
	
	if ($ignore_slash) {
		$realm	= rtrim($realm,	'/');
		$uri	= rtrim($uri,	'/');
	}		
	
	if (!$case_sensitive)
	{
		$realm	= strtolower($realm);
		$uri	= strtolower($uri);
	}
	
	return ($realm !== $uri) && (strlen($realm) > 0) && (cf_stringBeginsFrom($uri, $realm));
}


function cf_uriDepthIn($realm, $uri = NULL, $case_sensitive = false, $ignore_get = false, $ignore_slash = true)
{
	if (!is_string($realm)) {
		return false;
	}	
	
	if (!is_string($uri)) {
		$uri = $_SERVER['REQUEST_URI'];
	}
	
	if ($ignore_get) {
		$realm	= array_shift(explode('?', $realm));
		$uri	= array_shift(explode('?', $uri));			
	}
	
	if ($ignore_slash) {
		$realm	= rtrim($realm, '/');
		$uri	= rtrim($uri, '/');
	}		
	
	if (!$case_sensitive)
	{
		$realm	= strtolower($realm);
		$uri	= strtolower($uri);
	}
	
	if ((strlen($realm) === 0) || !cf_stringBeginsFrom($uri, $realm)) {
		return false;
	}
		
	$suburi = trim(substr($uri, strlen($realm)), '/');
	
	if (strlen($suburi) === 0) {
		return 0;
	}
	else {
		return substr_count($suburi, '/') + 1;
	}
}


function cf_uriLevelIn($realm, $uri = NULL, $case_sensitive = false, $ignore_get = false, $ignore_slash = true)
{
	return cf_uriDepthIn($realm, $uri, $case_sensitive, $ignore_get, $ignore_slash);
}


function cf_generateRandomString($length = 8, $type = 1)
{
	$sets = array(
		1	=> 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789',
		2	=> 'abcdefghijklmnopqrstuvwxyz0123456789',
		3	=> 'abcdefghijklmnopqrstuvwxyz3456789',
		4	=> 'abcdefghijklmnopqrstuvwxyz',
		5	=> '0123456789',
		);
	
	if (!cf_isNaturalNumeric($length)) {
		return false;
	}
	
	if (!isset($sets[$type])) {
		return false;
	}
	
	$set		= $sets[$type];
	$last_char	= strlen($sets[$type]) - 1;
	$output		= '';
	
	for ($i = 1; $i <= $length; $i++) {
		$output .= substr($set, rand(0, $last_char), 1);
	}
	
	return $output;
}



// PHP4 patches (replacement for missing functions)


if (!function_exists('http_build_query')) {
	function http_build_query($formdata, $numeric_prefix = NULL, $key_prefix = NULL)
	{
		$output = array();
		foreach ((array) $formdata as $key => $elem) {			
			$tmp_key = urlencode(is_int($key) ? ($numeric_prefix . $key) : $key);			
			if ($key_prefix) {
				$tmp_key = $key_prefix . '[' . $tmp_key . ']';
			}
			if (is_array($elem) || is_object($elem)) {
				$output[] = http_build_query($elem, $numeric_prefix, $tmp_key);
			}
			else {
				$output[] = $tmp_key. '=' . urlencode($elem);
			}
		}
		return implode(ini_get('arg_separator.output'), $output);
	}
}

if (!function_exists('str_split')) {
	function str_split($string, $length = 1)
	{
		$num_parts = ceil(strlen($string) / $length);
		$output = array();
		for ($i = 0; $i < $num_parts; $i++) {
			$output[] = substr($string, $i * $length, $length);
		}
		return $output;
	}
}