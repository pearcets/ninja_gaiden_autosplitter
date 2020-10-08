// Based on https://github.com/saturnin55/DucktalesNESAutoSplitter by saturnin55

state("nestopia", "1.40")
{
    // base 0x0000 address of ROM : "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0x68;
    byte act:           "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xd5;
    byte stage:         "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xd6;
    byte ryu_x:         "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xee;
    byte ryu_y:         "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xf2;
    byte timer:         "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xcb;
    byte boss_hp:       "nestopia.exe", 0x1b2bcc, 0, 8, 0xc, 0xc, 0xce;
} 

init
{
    version = modules.First().FileVersionInfo.FileVersion;
}

split
{
    if (current.timer == 0 && old.timer != 0 && current.boss_hp == 0) {
        print("SPLIT");
        return true;
    }
}

start
{
    if ((current.ryu_x != old.ryu_x || current.ryu_x != old.ryu_x) && (old.ryu_x != 0 && current.ryu_x != 0)) {
        print("TIMER START");
        return true;
    }
}