export function registerChildren(node) {
    node.$ = {};
    node.get_children().forEach(child => node.$[child.name] = child);
}