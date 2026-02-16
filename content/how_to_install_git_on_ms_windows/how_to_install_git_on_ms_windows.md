# How to install Git on MS Windows

To install Git on Windows, you should use the official Git for Windows installer available from the official Git website. The process is straightforward and involves downloading the executable file and running the setup wizard, generally accepting the default options. 
Step 1: Download the installer 
Open your web browser and go to the official Git website: https://git-scm.com/download/win.
The download of the latest 64-bit Git for Windows installer (.exe file) should start automatically. If not, click the appropriate download link for your system. 
Step 2: Run the installer 
Once the download is complete, locate the downloaded .exe file (usually in your Downloads folder) and double-click it to launch the installer.
When prompted by the User Account Control, click Yes to allow the app to make changes to your device. 
Step 3: Follow the setup wizard 
Read the GNU General Public License agreement and click Next.
Select the installation destination folder. The default location (C:\Program Files\Git) is recommended for most users.
On the "Select Components" screen, the default options are usually sensible. Ensure that "Windows Explorer integration" (including Git Bash Here and Git GUI Here) is checked for easy access from your right-click menu in File Explorer. Click Next.
Select your desired default text editor for Git (e.g., VS Code, Notepad++, or Vim) from the dropdown list. The default is usually Vim. Click Next.
Follow the prompts through the remaining configuration screens, accepting the default (recommended) options unless you have a specific reason to change them. Key settings include:
Adjusting your PATH environment: The recommended option, "Git from the command line and also from 3rd-party software," allows you to use Git from any terminal (Command Prompt, PowerShell, or Git Bash).
Configuring line ending conversions: The default "Checkout Windows-style, commit Unix-style line endings" is generally fine for cross-platform projects on Windows.
Configuring the terminal emulator: The default MinTTY is suggested.
Choosing a credential helper: Use the default Git Credential Manager Core.
Click Install to begin the installation process.
Step 4: Verify the installation
Once the installation is complete, you can uncheck the option to view the release notes and click Finish.
Open a new Command Prompt, PowerShell, or Git Bash terminal.
Type the following command and press Enter:
bash
git --version
Use code with caution.

If the installation was successful, you will see the installed Git version number (e.g., git version 2.X.X.windows.1).
Step 5: Configure Git (optional but recommended) 
After installation, configure your Git username and email address. This information is associated with any commits you create: 
bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
Use code with caution.

You can verify your settings at any time by typing git config --list.