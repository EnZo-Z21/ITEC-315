- We will be learning to build mobile apps for Android and IOS
- We will be using Flutter and Dart
- No previous knowledge Required
- We will learn core features and concepts by creating multiple demo apps
- Learning through application and build portfolio of demo apps

---
# What is Flutter?
- Combination of 2 parts
	- *UI Framework*  
		- Collection of code packages and utility functions for writing cross-platform apps
		- One codebase allows us to create apps for multiple platforms (Android, iOS, Windows, macOS, Linux, Web)
		- Other solutions would require different frameworks and languages for each platform
	- Tool Collection
		- CLI & Software that helps with developing, testing and building these apps
		- Allows us to convert our code to run on the previous platforms. 
		- This code is not natively run on systems, we must translate to machine code that works on each platform

---

# Flutter is Not a Programming Language
- We will use flutter to develop our apps but it is not the *language* we are writing in
- *Flutter* is a framework for building user interfaces with *Dart*
	- This is the actual programming languages
- So What is a *framework*?
	- Its a collection of packages, utilities, and functions you can use in your code
	- For example pre built code to deal with buttons or forms
- What is *Dart*
	- Developed by Google
	- Multi purpose language, however its main use is Flutter development.
	- Flutter will work with us to translate this code to native (machine) code for that platforms we want to develop on
- We will be learning both Flutter and Dart together, by the end of the course we will know both

---

# Target Platforms
- Flutter can be used with dart to target multiple platforms
- Originally the language was created just for Android and iOS
- It has branched out to include other target platforms, but Android and iOS are still the main focus
![[target_platforms.png]]

- We can write the code *to target* any platform *from* any platform
- However, you can only test and run:
	- iOS and macOS apps on macOS machines
	- Windows apps on Windows machines
	- Linux apps on Windows machines
- Android and web apps can be built on all operating systems
- This means we can write the code on anything (its cross platform), but in order to upload a iOS app to the store we would need to compile it and debug on a macOS machine
- We can copy stuff to another machine to deploy it

---

# Projects in Flutter
- Flutter and Dart are relatively mainstream. 
- Not the most used platform as there are many options for development
	- Although most are platform specific
- Google
	- Stadia
	- Google Ads
	- Google Assistant
	- Google Pay
- Ebay
	- Ebay Motors
- Groupon
- Phillips Hue - Smart home app
- SpaceX Go - SpaceX's info app
- BMW app
- Sonos

---
# Flutter Setup Overview
- We need to setup an environment to develop on
	- Just like other programming langauges
- This will differ slightly between windows and mac
	- We will do 1 at a time, you can feel free to use whatever platform makes your little heart happy
- Steps
	1. Setup Flutter SDK
		- Get Flutter SDK - For managing Projects
		- Get Git - For version control. Some flutter tools use git to update
	2. Platform Tools
		- Android Studio - For building android apps
			- This will work on both platforms
		- Xcode - For building and testing iOS apps
			- This will only work on macos
	3. Get a virtual machine set up to run our app code
		1. This way we will not need to use our phones to test

---

# Device Layout

| Platform | on Windows | on macOS | on Linux |
| ---- | ---- | ---- | ---- |
| building iOS apps | not possible | Download and install xCode | Not possible |
|  |  | Configure XCode CLI Tools |  |
|  |  | Create iOS simulator |  |
| building Android Apps | Download and install android studio | Download and install android studio | Download and install android studio |
|  | Install SDK CLI and Build tools | Install SDK CLI and Build tools | Install SDK CLI and Build tools |
|  | Create local android emulator | Create local android emulator | Create local android emulator |

---

# Windows Setup
1. go to [flutters main site](https://flutter.dev) and click get started
2. Click Windows - We are picking which platform we are on
3. Click Mobile - Here we are picking development target. We can add others later
	1. Follow the Proceeding Instructions
4. Download and install git from this page (if you don't have it)
	1. You can choose all defaults
5. Choose the option to download and install the flutter sdk
	1. Download the zip bundle and extract it
	2. create a folder in your C\\Users\\Name\\ drive called Dev
	3. Move the flutter folder there (the one you extracted)
6. Update your path variable 
	1. 1. Press Windows + S.
	2. Type `environment`.	    
	3. When **Edit the system environment variables** displays as the **Best match**, click **Open** under **Edit the system environment variables**.
	4. Click **About**.
	5. Click **Advanced System Settings**.
	6. Click **Environment Variables…**
	    The **Environment Variables** dialog displays.
	7. Under **User variables for user** check for the **Path** entry.
	    1. If the entry exists, click **Edit…**.
	    2. If the entry doesn’t exist, click **New…**.
	    3. 1. Click **New**.
	    4. Type `<install-directory>\flutter\bin`.
	    5. Click the install-directory\\flutter\\bin entry
	    6. Click **Move Up** until the Flutter entry sits at the top of the list.
	    7. Click **OK**.
1. Follow Instructions to install android studio
2. Install command line tools from here
	1. [How to Install Android Studio Command Line Tools? (sysgeeker.com)](https://www.sysgeeker.com/blog/how-to-install-android-studio-command-line-tools.html)
3. Sign licenses in powershell
```powershell
flutter doctor --android-licenses
```
- Accepts all licenses
4. Run flutter doctor again in powershell
```powershell
flutter doctor
```

---

# Mac Set Up with Xcode
- Install Homebrew at brew.sh
	- Watch for the commands to enter in your terminal when this completes
- Install cocoapods from brew
```bash
brew install cocoapods
```
- Visit Flutter.dev, select MacOS, select ios
- Follow instructions on installing from VS code
- Follow instructions for configuring Xcode
- Copy path when asked, we will edit .zshrc and add this to the end
```zsh
export PATH="$PATH/Users/Name/Development/flutter/bin"
```
- Source your file
```bash
source .zshrc
```
- Finish setup with listed commands

- If you want, you can also follow instructions for installing and setting up android studio
----
# Getting Started with a Project
- Create a new Folder on our system (no spaces)
	- I will be using C:\\Users\\georg\\Development\\School\\ITEC315
	- My suggestions is to have a Development folder in your home (C:\\Users\\Name or /Users/Name) and make a folder for this class there.
	- All projects should go in that folder so you dont lose them!
- Open VS Code and open a terminal window in it (CMD/Ctrl + `)
- In the terminal we will use a command to create a new app (NO SPACES!)
```bash
flutter create first_app
```
- We should have a new folder opened in here. 

---
# Starting App
- Copy code from main.dart into the lib folder
- This is a demo program that we will look at
	- We will talk more about folders and files and setup later but for now we will play with this to get something running 

---
# Commands
- By using ctrl+shift+p or cmd+shift+p we can open a command pallet in vs code
- type flutter
	- We should see some suggested flutter commands
- Use the one that says Flutter: Launch Emulator
	- This allows us to launch the emulator (either simulator or android emulator) from vs code
- I will mostly be using the Android emulator as im mainly using windows, although I will usually carry my mac laptop with me as well
- Now we can run our app

---

# Running our app
- First make sure status bar is up
	- View->Appearance->Status
- With our device running, we should see a label at the bottom of vs code saying which device it is and some details about it
- We can click to change it to other devices (even between ios and android on mac if we choose!)
- Next to run it, we look at the main.dart file
- We can run a few ways, 
	- run button above main
	- Opening terminal at the app with the terminal shortcut and hitting 
	- Using shortcuts f5 / ctrl f5
	- Menu->run->run with/without debugging
- App should be running now 
	- If any issues, we will try to handle after class

---

# First Changes
- Lets look in the main.dart file
- If you scroll down a little there are 2 Text boxes
	- These are the text widgets that we see
	- We will learn more about them later
- Let's save that
	- I like to turn on auto save in menu->file->auto save
	- Force with ctrl+s or command+s
- App should automatically update on the device

---

# Material Design
- We can see inside our app "Material App" at the top
- This is in reference to Google's Material Design
	- This is their flexible design framework
- What is it?
	- Set of rules, suggesstions, and guide lines established by google to design beautiful interfaces
	- Comes with base designs, but we can highly customize
	- Our apps can and will look diferent
	- Not a prison, just a foundation
- Can read more on material.io

---

# Next Steps
- We've opened and edited a basic app in flutter
- Our goal now is to really dive into Flutter and Dart Fundamentals
	- Syntax
	- Freatures
	- New Concepts
- After this we will work on advanced features
	- User interaction
	- Customizing Style
	- Multi Screen apps
- Lastly we will tackle things like animation, backend programming, native device features (like camera and specific sensors)

---

