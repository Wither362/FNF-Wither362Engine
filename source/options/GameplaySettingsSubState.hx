package options; 

#if desktop
import Discord.DiscordClient;
#end
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxSubState;
import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSave;
import haxe.Json;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;
import flixel.input.keyboard.FlxKey;
import flixel.graphics.FlxGraphic;
import Controls;

using StringTools;

class GameplaySettingsSubState extends BaseOptionsMenu
{
	public function new()
	{
		title = 'Gameplay Settings';
		rpcTitle = 'Gameplay Settings Menu'; //for Discord Rich Presence
		
		var option:Option = new Option("Reduce Notes When Pasting",
			"If activated, when you paste the notes\nit will reduce them",
			"reduceNotes",
			"bool",
			false);
		addOption(option);
		
		var option:Option = new Option("Multiplicative Value",
			"When you press SHIFT it multiplies the value by\nthe value you set it\nif it's 0, it will count the dafault value",
			"multiplicativeValue",
			"float",
			0);
		option.scrollSpeed = 5;
		option.minValue = 0;
		option.maxValue = 100;
		option.changeValue = 0.1;
		addOption(option);
		
		var option:Option = new Option("Music When Dead",
			"If disabled, when you die it won't play music",
			'musicWhenDead',
			'bool',
			true);
		addOption(option);
		
		var option:Option = new Option('Controller Mode',
			'Check this if you want to play with\na controller instead of using your Keyboard.',
			'controllerMode',
			'bool',
			false);
		addOption(option);

		//I'd suggest using "Downscroll" as an example for making your own option since it is the simplest here
		var option:Option = new Option('Downscroll', //Name
			'If checked, notes go Down instead of Up, simple enough.', //Description
			'downScroll', //Save data variable name
			'bool', //Variable type
			false); //Default value
		addOption(option);

		var option:Option = new Option('Middlescroll',
			'If checked, your notes get centered.',
			'middleScroll',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Ghost Tapping',
			"If checked, you won't get misses from pressing keys\nwhile there are no notes able to be hit.",
			'ghostTapping',
			'bool',
			true);
		addOption(option);

		var option:Option = new Option('Disable Reset Button',
			"If checked, pressing Reset won't do anything.",
			'noReset',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Charting Activated',
			"If checked, the pause menu will show the chart things.",
			'chartingActivated',
			'bool',
			false);
		addOption(option);
		
		var option:Option = new Option('Wither362 Link',
			"If checked, clicking in Donate will send you\nto the Wither362 link.",
			'otherLink',
			'bool',
			true);
		addOption(option);
		
		var option:Option = new Option('Clear Notes Warning',
			"If disabled, pressing Clear Notes won't warn you.\nYou will have to reset the engine.",
			'clearNotesWarning',
			'bool',
			true);
		addOption(option);
		
		var option:Option = new Option('Clear Events Warning',
			"If disabled, pressing Clear Events won't warn you.\nYou will have to reset the engine.",
			'reloadEventWarning',
			'bool',
			true);
		addOption(option);
		
		var option:Option = new Option('Reload JSON Warning',
			"If disabled, pressing Reload JSON won't warn you.\nYou will have to reset the engine",
			'reloadWarning',
			'bool',
			true);
		addOption(option);
		
		var option:Option = new Option('Bad Words',
			"If disabled, there aren't gonna be bad words\nYou will have to reset the engine.",
			'badWords',
			'bool',
			true);
		addOption(option);
		
		/*var option:Option = new Option('Note Delay',
			'Changes how late a note is spawned.\nUseful for preventing audio lag from wireless earphones.',
			'noteOffset',
			'int',
			0);
		option.displayFormat = '%vms';
		option.scrollSpeed = 100;
		option.minValue = 0;
		option.maxValue = 500;
		addOption(option);*/

		var option:Option = new Option('Rating Offset',
			'Changes how late/early you have to hit for a "Sick!"\nHigher values mean you have to hit later.',
			'ratingOffset',
			'int',
			0);
		option.displayFormat = '%vms';
		option.scrollSpeed = 20;
		option.minValue = -30;
		option.maxValue = 30;
		addOption(option);

		var option:Option = new Option('Sick! Hit Window',
			'Changes the amount of time you have\nfor hitting a "Sick!" in milliseconds.',
			'sickWindow',
			'int',
			45);
		option.displayFormat = '%vms';
		option.scrollSpeed = 15;
		option.minValue = 15;
		option.maxValue = 45;
		addOption(option);

		var option:Option = new Option('Good Hit Window',
			'Changes the amount of time you have\nfor hitting a "Good" in milliseconds.',
			'goodWindow',
			'int',
			90);
		option.displayFormat = '%vms';
		option.scrollSpeed = 30;
		option.minValue = 15;
		option.maxValue = 90;
		addOption(option);

		var option:Option = new Option('Bad Hit Window',
			'Changes the amount of time you have\nfor hitting a "Bad" in milliseconds.',
			'badWindow',
			'int',
			135);
		option.displayFormat = '%vms';
		option.scrollSpeed = 60;
		option.minValue = 15;
		option.maxValue = 135;
		addOption(option);
		
		var option:Option = new Option('More Things',
		  'Changes some things\njejeje.',
		  'moreThings',
		  'bool',
		  false);
		addOption(option);
		
		var option:Option = new Option('In Spanish',
			'Cambia el idioma a espanol\nsi no sabes ingles.',
			'spanish',
			'bool',
			false);
		addOption(option);

		var option:Option = new Option('Safe Frames',
			'Changes how many frames you have for\nhitting a note earlier or late.',
			'safeFrames',
			'float',
			10);
		option.scrollSpeed = 5;
		option.minValue = 2;
		option.maxValue = 10;
		option.changeValue = 0.1;
		addOption(option);

		super();
	}
}
