state("Little Nightmares II", "steam")
{
	float levelTime : 0x4095358, 0x40, 0x3C0, 0x110, 0xE8;
	float xCoord : 0x4074E50, 0x30, 0x590, 0x260, 0xB0, 0x1D4;
	float yCoord : 0x4074E50, 0x30, 0x590, 0x260, 0xB0, 0x1D0;
	float zCoord : 0x4074E50, 0x30, 0x590, 0x260, 0xB0, 0x1D8;
}

init
{

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
return (old.zCoord > 3109 && current.zCoord < 3109 && current.zCoord > 0);
}

split
{

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
