export function registerChildren(node) {
	node.$ = {};
	node.get_children().forEach(child => node.$[child.name] = child);
}

export function doExports(clazz) {
	const vars = mapping => Object.keys(mapping).forEach(key => godot.register_property(clazz, key, mapping[key]));
	const signal = signalName => godot.register_signal(clazz, signalName);
	clazz.export(vars, signal);
}
