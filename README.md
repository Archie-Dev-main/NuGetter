# NuGetter
A plugin for managing NuGet packages with scripting.

# Usage
The main way this plugin is intended to be used is in a tool script for a plugin, so that you can include NuGet dependencies for your plugin.
On the other hand, you could also just use it for your project, but there's little reason to do this when Visual Studio and VS Code both let you include NuGet packages easily.


# Example
Let's say I wanted to make a [Fennecs](https://fennecs.tech/) plugin for Godot. Well, I'd need the Fennecs NuGet package for it, and so would every single person who downloads my plugin.

So in my tool script for the plugin, I'd put this code in my tool script:

```
func _enable_plugin() -> void:
	NuGetter.check_and_install_dependency("fennecs")
	print("\nHave a nice day!")
```

# More Info
For more about Godot plugin development, please refer to the [Godot Docs](https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_plugins.html)!
