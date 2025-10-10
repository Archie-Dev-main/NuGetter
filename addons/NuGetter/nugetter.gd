extends Node

class_name NuGetter

static func check_and_install_dependency(package_name : String) -> void:
	if not check_dependency(package_name):
		install_dependency(package_name)

static func check_dependency(package_name : String) -> bool:
	print("Checking if %s is installed...\n" % package_name)
	
	var output = []
	var exit_code : int = OS.execute("dotnet", ["list", "package"], output)
	
	if exit_code != 0:
		print("Cannot check packages!\nError Code: %d" % exit_code)
		print_output(output)
		return false
	
	for i : String in output:
		if i.contains(package_name):
			print("%s was found." % package_name)
			return true
	
	print("%s was not found.\n" % package_name)
	
	return false

static func install_dependency(package_name : String) -> bool:
	print("\nInstalling %s NuGet package...\n" % package_name)
	
	var output = []
	var exit_code : int = OS.execute("dotnet", ["add", "package", package_name], output)
	
	if (exit_code != 0):
		print("Could not install package!\nError Code: %d" % exit_code)
		print_output(output)
		return false
	
	print("Finished installing %s NuGet package." % package_name)
	return true

static func uninstall_dependency(package_name : String) -> void:
	print("\nRemoving %s NuGet package...\n" % package_name)
	
	var output = []
	var exit_code : int = OS.execute("dotnet", ["remove", "package", package_name], output)
	
	if exit_code != 0:
		print("Could not remove package!\nError Code: %d" % exit_code)
		print_output(output)
	
	print("%s was removed." % package_name)

static func print_output(output):
	for i in output:
		print(i)
