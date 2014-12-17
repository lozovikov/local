<?php if (!empty($Auth->co_domains))
	foreach ($Auth->co_domains as $domain) { ?>
		<iframe src="http://<?=$domain?>/?authpass=1&s=<?=$Auth->sid?>&cache=<?=($Auth->logged_in === true ? 1 : 0)?>" class="in_frame" width="0" height="0" style="display:none" ></iframe>
<?php 	} ?>