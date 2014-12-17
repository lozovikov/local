<?php
 switch ($MODULE_OUTPUT['mode']) {
	 case 'results':
		$results = $MODULE_OUTPUT['results']; 
		$results_count = 0;
		foreach($results as $category_results){
			$results_count += $category_results['count'];
		}
		$results_count = (string)$results_count;
		if ($results_count) {
	?>
	<div>
	<h1>ѕо вашему запросу найден<?=($results_count[strlen($results_count)-1]=='1'?'':'о')?> <?=$results_count?> материал<?=($results_count[strlen($results_count)-1]=='1'?'':(strlen($results_count) != 2 && in_array($results_count[strlen($results_count)-1], array('2', '3', '4'))?'а':'ов'))?>:</h1>
	<?
	$ind = 0;
	foreach($results as $category_results)
	{
		foreach($category_results['results'] as $result)
		{
			$ind++;
			echo $ind.'. <a href="http://'.$_SERVER["HTTP_HOST"].$result['uri'].'">'.$result['title'].'</a><br />'.((isset($result['pic']) && $result['pic']) ? '<br /><div><a href="'.$result['uri'].'"><img height="200px" src="'.$result['pic'].'" /></a></div>': '').'<p>'.(is_array($result['text']) ? implode('<br /><br />', $result['text']) : $result['text']).'</p><br />';
			//echo $ind.'. <a href="'.$result['uri'].'">'.$result['title'].'</a><br />'.((isset($result['pic']) && $result['pic']) ? '<br /><div><a href="'.$result['uri'].'"><img height="200px" src="'.$result['pic'].'" /></a></div>': '').'<p>'.(is_array($result['text']) ? implode('<br /><br />', $result['text']) : $result['text']).'</p><br />';
		}
	}
	?>
	</div>
	<?
		} else {
	?>
		<div>
			<h1>  сожалению, по вашему запросу не найдено никаких материалов.</h1>
		</div>
	<?
		}
	break;
	
	case 'form':
	?>
		<div>	
			<form name="searchForm" action="<?=$MODULE_OUTPUT['results_folder']?>" method="get">
				<div class="search">
					<input name="search" id="mod_search_searchword" maxlength="20" alt="ѕоиск" class="inputbox" type="text" size="20" value="поиск..."  onblur="if(this.value=='') this.value='поиск...';" onfocus="if(this.value=='поиск...') this.value='';" />	
				</div>
			</form>					
		</div>
	<? 
		break;	
 }
?>
