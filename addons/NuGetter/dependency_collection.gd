extends Node

var dependencies = []

func install_dependences() -> void:
	for i in dependencies:
		NuGetter.check_and_install_dependency(i)
