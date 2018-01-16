% DIRALL - Find all paths in the specified directory and its subdirectories.
% 
% Syntax
% paths = DIRALL(path) - Returns a cell of paths to all files and folders in the specified path.
% paths = DIRALL(path, includeDirectories) - Specifies whether or not (true or false, resp.) to include directories or only files in the output.
% 
% Output
% paths is a cell of character arrays containing absolute paths to the found files and folders. It does not contain the specified path or its parent, only subfiles and folders.

% MIT License
% 
% Copyright (c) 2018 Erik Huizinga

function paths = dirAll(path, includeDirectories)
    if nargin == 1
        includeDirectories = true;
    end
    
    dirStruct = dir(path);
    
    % Remove '.' and '..' directories
    isSubElement = cellfun(@isempty, regexp({dirStruct.name}, '^[.]{1,2}$', 'match'));
    dirStruct = dirStruct(isSubElement);
    
    paths = arrayfun(@(s) fullfile(s.folder, s.name), dirStruct, 'UniformOutput', false);
    
    isDir = [dirStruct.isdir];
    
    dirs = paths(isDir);
    subPaths = cellfun(@(d) dirAll(d, includeDirectories), dirs, 'UniformOutput', false);
    
    if ~includeDirectories
        paths = paths(~isDir);
    end
    
    paths = vertcat(paths, subPaths{:});
end
