function make(installflag)
% MAKE  Make file for MetisMex
%   MAKE, MAKE(0) produce the mex files for METIS under 'build'
%   folder.
%
%   MAKE(1) produces the mex files for METIS under 'build' folder
%   and install MetisMex under the userpath/methismex. The path to
%   installed MetisMex will be added in 'startup.m' such that the
%   MetisMex will be included automatically..
%
%   MAKE(-1) uninstall MetisMex and delete all the files under
%   'build' folder.
%

%   Copyright (c) 2015 Yingzhou Li, Stanford University

if( nargin == 0 )
    installflag = 0;
end

src_path = ['src' filesep];
build_path = ['build' filesep];
build_src_path = [build_path 'src' filesep];
build_mex_path = [build_path 'mex' filesep];
install_path = strsplit(userpath,pathsep);
matlab_startup_file = [install_path{1} filesep 'startup.m'];
install_path = [install_path{1} filesep 'metismex' filesep];

% make clear, installflag<0
if(installflag < 0)
    if(exist(build_path, 'dir'))
        rmdir(build_path,'s');
    end
    if(exist(install_path, 'dir'))
        rmpath([install_path 'src' filesep]);
        rmpath([install_path 'mex' filesep]);
        rmdir(install_path,'s');
    end
    if(exist(matlab_startup_file, 'file'))
        startup_path_data = importdata(matlab_startup_file);
        fid = fopen(matlab_startup_file, 'w+');
        for i=1:length(startup_path_data)
            if(~strcmp(startup_path_data{i},['run ' install_path 'METIS_startup.m']))
                fprintf(fid,'%s\n',startup_path_data{i});
            end
        end
        fclose(fid);
    end
    return;
end

% make
if(~exist(build_path, 'dir'))
    mkdir(build_path);
end

if(~exist(build_src_path, 'dir'))
    mkdir(build_src_path);
end

if(~exist(build_mex_path, 'dir'))
    mkdir(build_mex_path);
end

copyfile([src_path '*'],build_src_path);

mex_files = dir([build_src_path '*.c']);

c = computer;
switch c
    case 'GLNXA64'
        path_to_metis = './external/metis/';
        for i=1:length(mex_files)
            eval(['mex -largeArrayDims -lmetis CFLAGS="\$CFLAGS -std=c99" -I'...
                  path_to_metis 'include -L' path_to_metis...
                  'build/Linux-x86_64/libmetis -I'...
                  build_src_path ' '...
                  build_src_path mex_files(i).name ' -outdir ' build_mex_path]);
        end
    case 'MACI64'
        path_to_metis = './external/metis/';
        for i=1:length(mex_files)
            eval(['mex -largeArrayDims -lmetis -Dchar16_t=uint16_T '...
                  'CFLAGS="\$CFLAGS -std=c99" -I'...
                  path_to_metis 'include -L' path_to_metis...
                  'build/Darwin-x86_64/libmetis -I'...
                  build_src_path ' '...
                  build_src_path mex_files(i).name ' -outdir ' build_mex_path]);
        end
end

% make install

if(installflag == 1)
    if(~exist(install_path, 'dir'))
        mkdir(install_path);
    end
    copyfile('METIS_startup.m',install_path);
    copyfile([build_path '*'],install_path);
    startup_path_data = importdata(matlab_startup_file);
    flagexist = 0;
    for i=1:length(startup_path_data)
        if(strcmp(startup_path_data{i},...
            ['run ' install_path 'METIS_startup.m']))
            flagexist = 1;
        end
    end
    if(~flagexist)
        fid = fopen(matlab_startup_file, 'at');
        fprintf(fid, '%s\n', ['run ' install_path 'METIS_startup.m']);
        fclose(fid);
    end
    run([install_path 'METIS_startup.m']);
    return;
end

end
