function make(installflag)

if( nargin == 0 )
    installflag = 0;
end

src_path = './src/';
build_path = './build/';
build_src_path = [build_path 'src/'];
build_mex_path = [build_path 'mex/'];

% make clear, installflag<0
if(installflag < 0)
    rmdir(build_path,'s');
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
        for i=1:length(mex_files)
            eval(['mex -largeArrayDims -lmetis CFLAGS="\$CFLAGS -std=c99" -I' build_src_path ' '...
                  build_src_path mex_files(i).name ' -outdir ' build_mex_path]);
        end
    case 'MACI64'
        path_to_metis = '/usr/local/Cellar/metis/5.1.0/';
        for i=1:length(mex_files)
            eval(['mex -largeArrayDims -lmetis -Dchar16_t=uint16_T CFLAGS="\$CFLAGS -std=c99" -I'...
                  path_to_metis 'include -L' path_to_metis 'lib -I' build_src_path ' '...
                  build_src_path mex_files(i).name ' -outdir ' build_mex_path]);
        end
end

% make install

end
