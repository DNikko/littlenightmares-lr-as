state("Little Nightmares II", "steam")
{
	float levelTime : 0x4095358, 0x40, 0x3C0, 0x110, 0xE8;
	float xCoord : 0x4074E50, 0x30, 0x590, 0x260, 0xB0, 0x1D4;
	float yCoord : 0x4074E50, 0x30, 0x590, 0x260, 0xB0, 0x1D0;
	float zCoord : 0x4074E50, 0x30, 0x590, 0x260, 0xB0, 0x1D8;
	int levelID : 0x40CE690, 0x0, 0xA30, 0xF38;
	int grabState : 0x4074E50, 0x30, 0x598, 0x118, 0xC40;
}

init
{
bool[] splitsTemp = new bool[95];
vars.splits = splitsTemp; 
}

update
{

}

startup
{

}

start
{
vars.AllGameTime = 0;
vars.runStarted = true;
vars.startGameTime = current.levelTime;
bool[] splitsTemp = new bool[95];
vars.splits = splitsTemp; 
current.endSplit = false;
return (old.zCoord > 3109 && current.zCoord < 3109 && current.zCoord > 0);
}

split
{
	current.endSplit = current.levelID >= 30 && current.levelID <= 34 && current.zCoord > 9570 && current.zCoord < 9800 && current.xCoord > 30990 && current.xCoord < 31170 && current.yCoord > -2080 && current.yCoord < -1820 && current.grabState == 1 && old.grabState == 0;	
	if(!old.endSplit && current.endSplit && vars.splits[25] != true ) {
	   						vars.splits[25] = true;
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
	if (old.levelTime > current.levelTime) { vars.AllGameTime += old.levelTime; }
	if (current.levelTime > 0 && vars.runStarted) { return TimeSpan.FromSeconds(vars.AllGameTime+current.levelTime-vars.startGameTime); } else if (!vars.runStarted) { return TimeSpan.FromSeconds(0); }
}
