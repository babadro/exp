package model
{
	import mx.utils.StringUtil;	

	[RemoteClass(alias="ows.33.example1.components.Actors")]
	[Bindable]
	[Entity]
	public class Actors
	{
		[Id]
		public var ACTORID:Number;
		public var NAMEFIRST:String;
		public var NAMELAST:String;
		public var AGE:Number;
		public var NAMEFIRSTREAL:String;
		public var NAMELASTREAL:String;
		public var AGEREAL:Number;
		public var ISEGOMANIAC:Number;
		public var ISTOTALBABE:Number;
		public var GENDER:String;
	}
}
