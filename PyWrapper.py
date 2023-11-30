import os
import subprocess
from colorama import Fore, Style, init

init(autoreset=True)

# Clear the screen
def clear_screen():
    os.system('cls' if os.name == 'nt' else 'clear')

# Define the banner
def print_banner():
    print(Fore.CYAN + "*-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*")
    print(Fore.CYAN + "|" + Fore.WHITE + "            __________          __________               " + Fore.CYAN + "|")
    print(Fore.CYAN + "|" + Fore.WHITE + "            \\______   \\ __  _  _\\_   ____/               " + Fore.CYAN + "|")
    print(Fore.CYAN + ":" + Fore.WHITE + "             |    |  _//  \\/ \\/  /|  __)_                " + Fore.CYAN + ":")
    print(Fore.CYAN + "." + Fore.WHITE + "             |    |   \\\\        //       \\               " + Fore.CYAN + ".")
    print(Fore.CYAN + ":" + Fore.WHITE + "  (\\_/)      |______  / \\__/\\__//______  /               " + Fore.CYAN + ":")
    print(Fore.CYAN + "|" + Fore.WHITE + " ( ~_~)             \\/" + Fore.WHITE + "PyEnv-Win Wrapper" + Fore.WHITE + "\\/1.0.0           " + Fore.CYAN + "|")
    print(Fore.CYAN + "|" + Fore.WHITE + " (>  >)                                                  " + Fore.CYAN + "|")
    print(Fore.CYAN + "*-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-*")

# Get the script name and arguments
script_name = os.path.basename(sys.argv[0])
file_to_execute = " ".join(os.sys.argv[1:])

# Get the Windows drive (e.g., C:)
windows_drive = os.environ.get('SystemDrive', 'C:')

# Get the username
username = os.environ.get('UserName', '')

# Installed?
pyenv = os.path.join(windows_drive + '\\Users\\' + username, '.pyenv\\')

# Check if this is the first run
if os.path.exists(pyenv):

    if script_name and file_to_execute:
        pyenv_exec_command = f'pyenv exec python "{file_to_execute}"'
        subprocess.run(pyenv_exec_command, shell=True)
    else:
        clear_screen()
        print_banner()

        try:
            versions = subprocess.check_output('pyenv versions', shell=True, text=True)
            print(f"\nPython Versions:\n {versions}")

            print(Fore.YELLOW + f"Usage: {script_name} <python_script.py>")
            input("\nPress Enter to Exit... ")

        except subprocess.CalledProcessError:
            pass

else:
    clear_screen()
    print_banner()
    print(Fore.RED + "\nPlease Install PyEnv-Win First!\n")
    input("\nPress Enter to Exit... ")
