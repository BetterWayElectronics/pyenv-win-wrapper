
use strict;
use warnings;
use File::Copy;
use Win32::TieRegistry;
use Win32::Registry;
use Win32::Console::ANSI;
use Term::ANSIScreen qw/:color /;
use Term::ANSIScreen qw(cls);
use File::Basename;

my $clear_screen = cls(); 
my $version = "1.0.0";

my $BwE = (colored ['cyan on black'], qq{*-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*\n})
.(colored ['cyan on black'], qq{|}).(colored ['black on cyan'], qq{            __________          __________               }).(colored ['cyan on black'], qq{|\n})
.(colored ['cyan on black'], qq{|}).(colored ['black on cyan'], qq{            \\______   \\ __  _  _\\_   ____/               }).(colored ['cyan on black'], qq{|\n})
.(colored ['cyan on black'], qq{:}).(colored ['black on cyan'], qq{             |    |  _//  \\/ \\/  /|  __)_                }).(colored ['cyan on black'], qq{:\n})
.(colored ['cyan on black'], qq{.}).(colored ['black on cyan'], qq{             |    |   \\\\        //       \\               }).(colored ['cyan on black'], qq{.\n})
.(colored ['cyan on black'], qq{:}).(colored ['black on cyan'], qq{  (\\_/)      |______  / \\__/\\__//______  /               }).(colored ['cyan on black'], qq{:\n})
.(colored ['cyan on black'], qq{|}).(colored ['black on cyan'], qq{ ( ~_~)             \\/}).(colored ['black on cyan'], qq{PyEnv-Win Wrapper}).(colored ['black on cyan'], qq{\\/$version           }).(colored ['cyan on black'], qq{|\n})
.(colored ['cyan on black'], qq{|}).(colored ['black on cyan'], qq{ (>  >)                                                  }).(colored ['cyan on black'], qq{|\n})
.(colored ['cyan on black'], qq{*-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*\n});



my $script_name = $0;
my $file_to_execute = join(" ", @ARGV);

# Get the Windows drive (e.g., C:)
my $windows_drive = $ENV{'SystemDrive'} || 'C:';

# Get the username
my $username = $ENV{'UserName'} || '';

# Installed?
my $pyenv = '$windows_drive\\Users\\$username\\.pyenv';

# Check if this is the first run
if (!-e $pyenv) {

    if ($script_name && $file_to_execute) {
        my $pyenv_exec_command = 'pyenv exec python "' . $file_to_execute . '" ';
        system($pyenv_exec_command);
    } else {
		print $clear_screen;
		print $BwE;

		my $versions = qx(pyenv versions);
		print "\nPython Versions:\n $versions";

        print (colored ['bold yellow'], "\nUsage: $script_name <python_script.py>\n");
		print "\nPress Enter to Exit... ";
		
		while (<>) {
		chomp;
		last unless length;
		}
    }
	

} else {
	print $clear_screen;
	print $BwE;
	print (colored ['bold red'], "\nPlease Install PyEnv-Win First!\n");
	print "\nPress Enter to Exit... ";
	
	while (<>) {
	chomp;
	last unless length;
	}

}
