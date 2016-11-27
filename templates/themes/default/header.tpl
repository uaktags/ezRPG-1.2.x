<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta name="Description" content="ezRPG Project, the free, open source browser-based game engine!" />
	<meta name="Keywords" content="ezrpg, game, game engine, pbbg, browser game, browser games, rpg, ezrpg project" />
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="Distribution" content="Global" />
	<meta name="Robots" content="index,follow" />
	<link rel="stylesheet" href="static/default/style.css" type="text/css" />
	<title>ezRPG :: {$TITLE|default:""|escape}</title>
</head>
<body>

<div id="wrapper">

	<div id="header">
		<span id="title">{settings n='game_name' g='app'}</span>
		<span id="title-right"><span id="time">{$smarty.now|date_format:'%A %T'}</span>
        <br />
        <strong>Players Online</strong>: {$ONLINE|escape}</span>
	</div>

	<div id="nav">
		{if $LOGGED_IN == 'TRUE'}
			<ul>
				{foreach from=$TOP_MENU_UserMenu item=menu key=menukey}
					<li><a href={$menu|escape}>{$menukey|escape}</a></li>
				{/foreach}
			</ul>
		{else}
			<ul>
				{foreach from=$TOP_MENU_LOGGEDOUT item=menu key=menukey}
					<li><a href={$menu|escape}>{$menukey|escape}</a></li>
				{/foreach}
			</ul>
		{/if}
	</div>

	<span class="space"></span>

	{if $LOGGED_IN == 'TRUE'}
		<div id="sidebar">
			<strong>Level</strong>: {$player->level|escape}<br />
			<strong>Gold</strong>: {$player->money|escape}<br />
			<div class="bar">
				<div class="inner" style="width: {($player->exp/$player->max_exp)*100|escape}%"></div>
				<div class="text">EXP: {$player->exp|escape} / {$player->max_exp|escape}</div>
			</div>
			<div class="bar">
				<div class="inner" style="width: {($player->hp/$player->max_hp)*100|escape}%"></div>
				<div class="text">HP: {$player->hp|escape} / {$player->max_hp|escape}</div>
			</div>
			<div class="bar">
				<div class="inner" style="width: {($player->energy/$player->max_energy)*100|escape}%"></div>
				<div class="text">Energy: {$player->energy|escape} / {$player->max_energy|escape}</div>
			</div>

			{if $new_logs > 0}
				<a href="index.php?mod=EventLog" class="red"><strong>{$new_logs|escape} New Log Events!</strong></a>
			{/if}
		</div>
	{/if}

	<div id="{if $LOGGED_IN == 'TRUE'}gamebody{else}body{/if}">
		{if isset($MSG)}
			<div class="msg">
				{foreach $MSG as $newmsg}
					{foreach $newmsg as $level=>$message}
						<span class="msg {$level|escape}"><strong>{$message|escape}</strong></span>
					{/foreach}
				{/foreach}
			</div>
		{/if}
		<span class="space"></span>