function dList = readDislocationList (filename, delimiter)
%% dList = readDislocationList (filename, delimiter)
%  Reads from the file <filename> the list of dislocations present on the
%  slip plane. The file data should be in the following format:
%  b1 b2 b3 l1 l2 l3 f
%  where [b1 b2 b3] is the Burgers vector, [l1 l2 l3] is the dislocation
%  line vector and f is the fractional position on the slip plane. The
%  variable delimiter provides the character used to delimit the data. The
%  default calue of the delimiter is ' ' or space.

    %% Read file data
    if nargin==1
        % If no argument is provided, the data is delimited by space
        delimiter = ' ';
    end
    data = dlmread (filename, delimiter);
    nData = size(data,1); % Number of rows
    
    %% Create the dislocation list
    % Preallocate the structure
    dList(nData) = struct('b', [0 0 0], 'l', [0 0 0], 'f', 0, 'm', 0);
    % Populate the list from file data
    for i=1:nData
        bvec = data(i, 1:3);
        lvec = data(i, 4:6);
        fpos = data(i, 7);
        dList(i) = createDislocation(bvec, lvec, fpos, 1);
    end
    
    %% Clear memory
    clear data;
    clear nData;
end
