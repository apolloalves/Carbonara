LinuxBashCare-10.12.23
Description:

This Bash script, named LinuxBashCare-10.12.23.sh, is designed to perform system maintenance tasks on a GNU/Linux distribution. Developed by Apollo Alves and last updated on 16/12/2023, the script provides a menu-based interface for users to choose from various system optimization and cleanup options. Before executing, it checks whether the user has root privileges, requiring sudo if not.

Disclaimer:

The script begins with a prominent disclaimer, emphasizing that the user runs it at their own risk, and the developers are not responsible for any system failures or damages. It encourages open-source usage, prohibits improper distribution or commercialization, and invites users to contribute to the code for the betterment of the GNU/Linux community.

Menu Features:

The script displays a menu with different options, each associated with specific maintenance tasks. Some notable features include:

Colorful Outputs:
The script uses ANSI escape codes for colored and stylized output, making the interface visually appealing. It includes commands to print messages, errors, and completion statuses in different colors and styles.

neofetch Integration:
The script incorporates neofetch to display system information with ASCII art. This adds a personalized touch to the script's interface.

Dynamic Menu:
The menu dynamically adjusts based on user input, highlighting the selected option and providing a numbered list for easy navigation.

Script Execution:
Upon selecting an option, the script executes corresponding sub-scripts located in the /bin/ directory. These sub-scripts perform specific actions, such as removing unwanted packages or unused PPAs, contributing to system cleanup and optimization.

Usage:

To run the script, execute it with root privileges (sudo):

bash
sudo LinuxBashCare-10.12.23.sh
Contributions:

The README encourages users to contribute to the code and emphasizes the collaborative spirit of the GNU/Linux community.

Author: Apollo Alves
Creation Date: 16/12/2023

Note:

While the script's functionality is not explicitly detailed, the provided code seems well-organized and employs various techniques for creating an interactive and visually appealing user experience. It's recommended to review the individual sub-scripts in the /bin/ directory for a detailed understanding of the tasks performed by this script.
