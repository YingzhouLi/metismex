MetisMex
========

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3746725.svg)](https://doi.org/10.5281/zenodo.3746725)

MetisMex is a Matlab interface to METIS.
This code works with the latest stable version of [Metis](http://glaros.dtc.umn.edu/gkhome/metis/metis/overview)
(5.1.0, 2013-03-30). And the source files are included under external folder.

The following instructions worked on [Ubuntu (14.04 LTS)](#compile-and-installation-on-ubuntu) and
[OSX 10.10](#compile-and-installation-on-mac) with Matlab installed. The instructions on
[Windows 10](#compile-and-installation-on-windows) have been validated with MATLAB 2020a and Visual Studio
2019 BuildTools.

### Compile and Installation on Ubuntu
---------

1. Download MetisMex
   ```
   git clone https://github.com/YingzhouLi/metismex.git
   cd metismex
   ```

2. Install the latest version of 
  [metis](http://glaros.dtc.umn.edu/gkhome/metis/metis/overview).

   a. Superuser or Root
   ```
   sudo apt-get install libmetis-dev
   ```
  
   b. User
   ```
   cd external/metis
   make config
   make
   cd ../..
   ```

3. Compile or Install MetisMex.

   a. Compile MetisMex
   ```
   matlab -nojvm -r "make;quit"
   ```
    
   b. Install MetisMex
   ```
   matlab -nojvm -r "make(1);quit"
   ```

4. Test MetisMex
   ```
   cd test
   matlab &
   >> test
   >> test_sparse
   ```

### Compile and Installation on Mac
---------

1. Download MetisMex
   ```
   git clone https://github.com/YingzhouLi/metismex.git
   cd metismex
   ```

2. Install the latest version of 
  [metis](http://glaros.dtc.umn.edu/gkhome/metis/metis/overview).

   a. Superuser or Root
   ```
   brew install metis
   ```
  
   b. User
   ```
   cd external/metis
   make config
   make
   cd ../..
   ```
  
3. Compile or Install MetisMex.

   a. Compile MetisMex
   ```
   matlab -nojvm -r "make;quit"
   ```
    
   b. Install MetisMex
   ```
   matlab -nojvm -r "make(1);quit"
   ```

4. Test MetisMex
   ```
   cd test
   matlab &
   >> test
   >> test_sparse
   ```
    
### Compile and Installation on Windows
---------

1. Prerequisites packages include [CMake](https://cmake.org/) and
  [Visual Studio](https://visualstudio.microsoft.com/) package.
    
   a. [CMake](https://cmake.org/) can be installed from either [installer](https://cmake.org/download/)
   or through [chocolatey](https://chocolatey.org/) Windows package manager.
    
   b. There are four different versions of [Visual Studio](https://visualstudio.microsoft.com/)
    
      * [Community](https://visualstudio.microsoft.com/vs/community/)
    
      * [Professional](https://visualstudio.microsoft.com/vs/professional/)
        
      * [Enterprise](https://visualstudio.microsoft.com/vs/enterprise/)
        
      * [BuildTools](https://visualstudio.microsoft.com/visual-cpp-build-tools/)
      
      The setup of `mex` in Matlab is straightforward for the first three versions. However, if you prefer to install
      [BuildTools](https://visualstudio.microsoft.com/visual-cpp-build-tools/), which is much ligher in terms of disk space,
      then you need to udpate `mex` setup as in this [post](http://yingzhouli.com/posts/2020-06/mex-msvc).
    
1. Download MetisMex as a [zip file](https://github.com/YingzhouLi/metismex/archive/master.zip) and unzip it.


2. Install the latest version of 
  [metis](http://glaros.dtc.umn.edu/gkhome/metis/metis/overview) through Windows PowerShell.

    ```
    cd PATH_TO_METISMEX\external\metis
    mkdir build\Win-x86_64
    cd build\Win-x86_64
    cmake -G "Visual Studio 16 2019" -A x64 -DGKLIB_PATH="..\..\GKlib" ..\..
    &"PATH_TO_VS\Bin\MSBuild.exe" ALL_BUILD.vcxproj /property:Configuration=Release
    cd ..\..
    ```
    
    If different version of Visual Studio is installed, the `cmake` line need to be updated accordingly
    as in [link](https://cmake.org/cmake/help/git-stage/generator/Visual%20Studio%2016%202019.html)
    or [link](https://cmake.org/cmake/help/git-stage/manual/cmake-generators.7.html).
  
3. Compile or Install MetisMex.

    a. Compile MetisMex
    ```
    matlab -nojvm -r "make;quit"
    ```
    
    b. Install MetisMex
    ```
    matlab -nojvm -r "make(1);quit"
    ```

4. Test MetisMex
    ```
    cd test
    matlab &
    >> test
    >> test_sparse
    


### Uninstall on Ubuntu, Mac, or Windows
---------

1. Download MetisMex.

    ```
    git clone https://github.com/YingzhouLi/metismex.git
    cd metismex
    ```  

2. Uninstall MetisMex

    ```
    matlab -nojvm -r "make(-1);quit"
    ```
  
### BibTeX Export
---------
```
@software{li_yingzhou_2020_3746725,
  author       = {Li, Yingzhou},
  title        = {{M}etis{M}ex: A {MATLAB} toolbox of interfaces to the 
                   {M}etis library}},
  month        = apr,
  year         = 2020,
  publisher    = {Zenodo},
  version      = {v1.0},
  doi          = {10.5281/zenodo.3746725},
  url          = {https://doi.org/10.5281/zenodo.3746725}
}
```

### Acknowledgments
-------
Many thanks to [David Gleich](https://www.cs.purdue.edu/homes/dgleich/)
and [Robert Bridson](http://www.cs.ubc.ca/~rbridson/).
[Yingzhou Li](https://www.stanford.edu/people/yingzhouli)
implements this repository
after carefully exploring their previous work [metismex](https://github.com/dgleich/metismex)
and [metismex.c](http://www.cs.ubc.ca/~rbridson/download/metismex.c).
