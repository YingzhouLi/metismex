MetisMex
========

MetisMex is a Matlab interface to METIS.
This code works with the latest stable version of [Metis](http://glaros.dtc.umn.edu/gkhome/metis/metis/overview)
(5.1.0, 2013-03-30). And the source files are included under external folder.

The following instructions worked on Ubuntu (14.04 LTS) and
OSX 10.10 with Matlab installed.

### Compile on Ubuntu
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

3. Compile MetisMex.
  ```
  matlab -nojvm -r "make;quit"
  ```

4. Test MetisMex
  ```
  cd test
  matlab &
  >> test
  >> test_sparse
  ```

### Compile on Mac
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
  
3. Compile MetisMex.
  ```
  matlab -nojvm -r "make;quit"
  ```

4. Test MetisMex
  ```
  cd test
  matlab &
  >> test
  >> test_sparse
  ```

### Install on Ubuntu
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
  
3. Install MetisMex.
  ```
  matlab -nojvm -r "make(1);quit"
  ```

### Install on Mac
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

3. Install MetisMex.
  ```
  git clone https://github.com/YingzhouLi/metismex.git
  cd metismex
  matlab -nojvm -r "make(1);quit"
  ```

### Uninstall on Ubuntu and Mac
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

### Acknowledgments
-------
Many thanks to [David Gleich](https://www.cs.purdue.edu/homes/dgleich/)
and [Robert Bridson](http://www.cs.ubc.ca/~rbridson/).
[Yingzhou Li](https://www.stanford.edu/people/yingzhouli)
implements this repository
after carefully exploring their previous work [metismex](https://github.com/dgleich/metismex)
and [metismex.c](http://www.cs.ubc.ca/~rbridson/download/metismex.c).
