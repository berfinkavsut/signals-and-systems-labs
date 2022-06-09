%define all notes 
notename = {'A' 'A#' 'B' 'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#'};

%song to be playes
song = {'A' 'A' 'E' 'E' 'F#' 'F#' 'E' 'E' 'D' 'D' 'C#' 'C#' 'B' 'B' 'A' 'A'};

for k1 = 1:length(song)
    %compare string of k1^th note and notename
    idx = strcmp(song(k1), notename);
    %this returns a vector of zeros and one 
    %now, find the non-zero element's index and 
    %songidx(index) is the index in notename 
    %k = find(X) returns a vector containing the linear indices of each nonzero element in array X.
    songidx(k1) = find(idx);
end

%display songidx
songidx

dur = 0.3*8192;
songnote = [ ];

for k1 = 1:length(songidx)
    %why zeros here????? no difference in the sound or I cannot perceive it
    songnote = [songnote; [notecreate(songidx(k1),dur) zeros(1,75)]'];
    %songnote = [songnote; [notecreate(songidx(k1),dur)]'];
end

%display songnote
transpose(songnote);
%songnote.'

%soundsc with sample rate = 8192
soundsc(songnote, 8192);

%sample code for strcmp 
% s1 = 'upon';
% s2 = {'Once','upon';
%       'a','time'};
% tf = strcmp(s1,s2)
% tf = 2x2 logical array
% 
%    0   1
%    0   0
