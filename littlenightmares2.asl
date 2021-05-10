state("Little Nightmares II", "Release")
{
	float levelTime : 0x4095358, 0x40, 0x3C0, 0x110, 0xE8;
	float xCoord : 0x4074E50, 0x30, 0x590, 0x260, 0xB0, 0x1D4;
	float yCoord : 0x4074E50, 0x30, 0x590, 0x260, 0xB0, 0x1D0;
	float zCoord : 0x4074E50, 0x30, 0x590, 0x260, 0xB0, 0x1D8;
	int levelID : 0x40CE690, 0x0, 0xA30, 0xF38;
	int grabState : 0x4074E50, 0x30, 0x598, 0x118, 0xC40;
}
state("Little Nightmares II", "Current")
{
	float levelTime : 0x408B318, 0x40, 0x3C0, 0x110, 0xE8;
	float xCoord : 0x406AE10, 0x30, 0x590, 0x260, 0xB0, 0x1D4;
	float yCoord : 0x406AE10, 0x30, 0x590, 0x260, 0xB0, 0x1D0;
	float zCoord : 0x406AE10, 0x30, 0x590, 0x260, 0xB0, 0x1D8;
	int levelID : 0x40BA1B0, 0x0, 0xA30, 0xF38;
	int grabState : 0x406AE10, 0x30, 0x598, 0x118, 0xC40;
}

init
{
if (modules.First().ModuleMemorySize == 0x4510000) { version = "Release"; } else if (modules.First().ModuleMemorySize == 0x4502000) { version = "Current"; }
}

update
{

}

startup
{
settings.Add("split0", false, "Split at Chapter Change");
settings.Add("split1", false, "Split at House Entered");
settings.Add("split2", false, "Split at Hut Escaped");
settings.Add("split3", false, "Split at TV Moment 1");
settings.Add("split4", false, "Split at Six Kidnapped");
settings.Add("split5", false, "Split at Elevator");
settings.Add("split6", false, "Split at Teacher Escaped 1");
settings.Add("split7", false, "Split at Chess Puzzle");
settings.Add("split8", false, "Split at Teacher Escaped 2");
settings.Add("split9", false, "Split at Frog");
settings.Add("split10", false, "Split at Teacher Escaped 3");
settings.Add("split11", false, "Split at TV Moment 2");
settings.Add("split12", false, "Split at Elevator");
settings.Add("split14", false, "Split at Incinerator");
settings.Add("split15", false, "Split at Elevator Up");
settings.Add("split16", false, "Split at TV Moment 3");
settings.Add("split18", false, "Split at Balcony Skip");
settings.Add("split19", false, "Split at TV");
settings.Add("split20", false, "Split at Chair Room Exit");
settings.Add("split21", false, "Split at Cart Skip");
settings.Add("split22", false, "Split at Thin Man Escaped");
settings.Add("split24", false, "Split at Big Six");
}

start
{
vars.AllGameTime = 0;
vars.runStarted = true;
vars.startGameTime = current.levelTime;

	bool[] splitsTemp = new bool[95];
	vars.splits = splitsTemp; 

current.houseEntered = false;
current.hutEscaped = false;
current.tvMomentOne = false;
current.sixKidnapped = false;
current.elevatorEntered = false;
current.teacherEscaped = false;
current.chessPuzzle = false;
current.teacherEscapedTwo = false;
current.frogKey = false;
current.teacherEscapedThree = false;
current.tvMomentTwo = false;
current.elevatorHospital = false;
current.burnDoctor = false;
current.elevatorUp = false;
current.tvMomentThree = false;
current.balconySkip = false;
current.tvSkip = false;
current.chairSkip = false;
current.cartSkip = false;
current.thinManEscaped = false;
current.bigSix = false;

current.wilderness = false;
current.school = false;
current.hospital = false;
current.palecity = false;

current.endSplit = false;

return (old.zCoord > 3109 && current.zCoord < 3109 && current.zCoord > 0);
}

split
{

if (current.levelID == 26) {

	current.houseEntered = old.xCoord < -100 && current.xCoord >= -100 && current.xCoord < -80 && current.zCoord < 3000;	
	if(!old.houseEntered && current.houseEntered && vars.splits[1] != true && settings["split1"]) {
   						vars.splits[1] = true;
						return true;
	}
	
	current.hutEscaped = old.xCoord < 10865 && current.xCoord >= 10865 && current.zCoord < 3000;	
	if(!old.hutEscaped && current.hutEscaped && vars.splits[2] != true && settings["split2"]) {
   						vars.splits[2] = true;
						return true;
	}
	
} else if (current.levelID == 59) {

	current.tvMomentOne = current.xCoord > -28000 && old.zCoord > 3000 && current.zCoord < 200;	
	if(!old.tvMomentOne && current.tvMomentOne && vars.splits[3] != true && settings["split3"]) {
   						vars.splits[3] = true;
						return true;
	}
	
	current.sixKidnapped = old.xCoord < 1445 && current.xCoord >= 1445;	
	if(!old.sixKidnapped && current.sixKidnapped && vars.splits[4] != true && settings["split4"]) {
   						vars.splits[4] = true;
						return true;
	}
	
	current.elevatorEntered = old.yCoord < -430 && current.yCoord >= -430 && current.xCoord > 5445 && current.xCoord < 5855 && current.zCoord > -790;	
	if(!old.elevatorEntered && current.elevatorEntered && vars.splits[5] != true && settings["split5"]) {
   						vars.splits[5] = true;
						return true;
	}
	
	current.teacherEscaped = old.xCoord < 18180 && current.xCoord >= 18180;	
	if(!old.teacherEscaped && current.teacherEscaped && vars.splits[6] != true && settings["split6"]) {
   						vars.splits[6] = true;
						return true;
	}
	
	current.chessPuzzle = old.xCoord < 22480 && current.xCoord >= 22480 && current.zCoord < 800;	
	if(!old.chessPuzzle && current.chessPuzzle && vars.splits[7] != true && settings["split7"]) {
   						vars.splits[7] = true;
						return true;
	}
	
	current.teacherEscapedTwo = old.xCoord < 40225 && current.xCoord >= 40225;	
	if(!old.teacherEscapedTwo && current.teacherEscapedTwo && vars.splits[8] != true && settings["split8"]) {
   						vars.splits[8] = true;
						return true;
	}
	
	current.frogKey = old.xCoord < 48420 && current.xCoord >= 48420;	
	if(!old.frogKey && current.frogKey && vars.splits[9] != true && settings["split9"]) {
   						vars.splits[9] = true;
						return true;
	}
	
	current.teacherEscapedThree = old.xCoord < 58140 && current.xCoord >= 58140;	
	if(!old.teacherEscapedThree && current.teacherEscapedThree && vars.splits[10] != true && settings["split10"]) {
   						vars.splits[10] = true;
						return true;
	}
	
} else if (current.levelID == 51) {

	current.tvMomentTwo = old.zCoord > 2900 && current.zCoord < -700;	
	if(!old.tvMomentTwo && current.tvMomentTwo && vars.splits[11] != true && settings["split11"]) {
   						vars.splits[11] = true;
						return true;
	}
	
	current.elevatorHospital = old.yCoord < -8155 && current.yCoord >= -8155 && current.zCoord > -50 && current.zCoord < 200 && current.xCoord > -4940 && current.xCoord < -4485;	
	if(!old.elevatorHospital && current.elevatorHospital && vars.splits[12] != true && settings["split12"]) {
   						vars.splits[12] = true;
						return true;
	}
	
	current.burnDoctor = current.xCoord <= 29625 && old.xCoord > 29625 && current.zCoord < -4600;	
	if(!old.burnDoctor && current.burnDoctor && vars.splits[14] != true && settings["split14"]) {
   						vars.splits[14] = true;
						return true;

	}
	

	
} else if (current.levelID == 79) {

	current.elevatorUp = current.zCoord >=  23900 && old.zCoord < 23900;	
	if(!old.elevatorUp && current.elevatorUp && vars.splits[15] != true && settings["split15"]) {
   						vars.splits[15] = true;
						return true;

	}

	
	current.tvMomentThree = current.zCoord < 28000 && old.zCoord > 29000 && current.xCoord > 58970 && current.xCoord < 61240;	
	if(!old.tvMomentThree && current.tvMomentThree && vars.splits[16] != true && settings["split16"]) {
   						vars.splits[16] = true;
						return true;

	}

	current.balconySkip = current.yCoord >= -8860 && old.yCoord < -8860 && current.xCoord > 20110 && current.xCoord < 20445 && current.zCoord > 63000 && current.zCoord < 65000;	
	if(!old.balconySkip && current.balconySkip && vars.splits[18] != true && settings["split18"]) {
   						vars.splits[18] = true;
						return true;

	}
	
	current.tvSkip = current.xCoord >= 33180 && old.xCoord < 33180 && current.yCoord > -9668 && current.yCoord < -8530 && current.zCoord > 61600 && current.zCoord < 64500;	
	if(!old.tvSkip && current.tvSkip && vars.splits[19] != true && settings["split19"]) {
   						vars.splits[19] = true;
						return true;

	}
	
	current.chairSkip = current.xCoord >= 41670 && old.xCoord < 41670 && current.zCoord > 50000;	
	if(!old.chairSkip && current.chairSkip && vars.splits[20] != true && settings["split20"]) {
   						vars.splits[20] = true;
						return true;

	}
	
	current.cartSkip = current.xCoord > 44745 && current.zCoord > 62000 && old.zCoord < 61150;	
	if(!old.cartSkip && current.cartSkip && vars.splits[21] != true && settings["split21"]) {
   						vars.splits[21] = true;
						return true;

	}
	
	current.thinManEscaped = current.xCoord <= -15185 && old.xCoord > -15185 && current.zCoord > 60000 && current.zCoord < 65000;	
	if(!old.thinManEscaped && current.thinManEscaped && vars.splits[22] != true && settings["split22"]) {
   						vars.splits[22] = true;
						return true;

	}

} else if (current.levelID >= 30 && current.levelID <= 39) {
	
	
	current.bigSix = current.xCoord <= -15362 && old.xCoord > -15362 && current.zCoord > 4700 && current.zCoord < 5800 && current.yCoord > 2800 && current.yCoord < 4000;	
	if(!old.bigSix && current.bigSix && vars.splits[24] != true && settings["split24"]) {
   						vars.splits[24] = true;
						return true;

	}

	current.endSplit = current.zCoord > 9570 && current.zCoord < 9800 && current.xCoord > 30990 && current.xCoord < 31170 && current.yCoord > -2080 && current.yCoord < -1820 && current.grabState == 1 && old.grabState == 0;	
	if(!old.endSplit && current.endSplit && vars.splits[25] != true ) {
	   						vars.splits[25] = true;
						return true;

	}
	
	
}

	current.wilderness = current.levelID == 59;
	if(current.wilderness && vars.splits[26] != true && settings["split0"]) {
   						vars.splits[26] = true;
						return true;

	}
	current.school = current.levelID == 51;
	if(current.school && vars.splits[27] != true && settings["split0"]) {
   						vars.splits[27] = true;
						return true;

	}
	current.hospital = current.levelID == 79;
	if(current.hospital && vars.splits[28] != true && settings["split0"]) {
   						vars.splits[28] = true;
						return true;

	}
	current.palecity = current.levelID >= 30 && current.levelID <= 34;
	if(current.palecity && vars.splits[29] != true && settings["split0"]) {
   						vars.splits[29] = true;
						return true;
	}

}

reset
{

}

isLoading
{
	return true;
}

gameTime
{
	if (old.levelTime > current.levelTime && old.levelID != 2 && old.levelID != 0) { vars.AllGameTime += old.levelTime; }
	if (current.levelTime > 0 && vars.runStarted && current.levelID != 2 && current.levelID != 0) { return TimeSpan.FromSeconds(vars.AllGameTime+current.levelTime-vars.startGameTime); } else if (!vars.runStarted) { return TimeSpan.FromSeconds(0); } else if (current.levelTime > 0 && vars.runStarted && (current.levelID == 2 || current.levelID == 0)) { return TimeSpan.FromSeconds(vars.AllGameTime-vars.startGameTime);  }
}
