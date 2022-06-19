# binary_search_tree

Created as part of [The Odin Project Curriculum](https://www.theodinproject.com/lessons/663/project_submissions?page=5).

## Functionality

- On instantiation of Tree class, `#build_tree` creates a balanced binary search tree from an ordered array
- Duplicate values are not allowed — they will be removed during instantiation and `#insert` will not accept them
- `#pretty_print` displays the current tree
- Basic operations: `#insert`, `#delete`, `#find`
- Traversals: `#level_order`, `#preorder`, `#inorder`, `#postorder`
- `#depth` returns the number of levels below a given node, or below root if no argument is given
- `#balanced?` checks if the current instance of tree is balanced or not
- `#rebalance` rebalances the current instance of tree