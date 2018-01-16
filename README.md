# `dirAll`

Find all paths in the specified directory and its subdirectories.

# Syntax

`paths = dirAll(path)` - Returns a cell of paths to all files and folders in the specified path.

`paths = dirAll(path, includeDirectories)` - Specifies whether or not (`true` or `false`, resp.) to include directories or only files in the output. Default is `true`.

# Output

`paths` is a `cell` of character arrays containing absolute paths to the found files and folders. It does not contain the specified path or its parent, only subfiles and folders.

# License

MIT
