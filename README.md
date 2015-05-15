MetisMex
========

# Warning: The code is still under working. Please wait until this warning been removed.

This code works with the latest stable version of Metis (5.1.0, 2013-03-30).


### Compiling
---------

The following instructions worked on Ubuntu (14.04 LTS) and
OSX 10.10 with Matlab installed.

1. Install the latest version of 
  [metis](http://glaros.dtc.umn.edu/gkhome/metis/metis/overview).

  a. Ubuntu
    
    ```
    sudo apt-get install libmetis-dev
    ```

  b. OSX
  
    ```
    brew install metis
    ```
    
2. Download and compile MetisMex.
    
    ```
    git clone https://github.com/YingzhouLi/metismex.git
    cd metismex
    matlab -nojvm -r "make;quit"
    ```

3. Test MetisMex
    ```
    >> A = blkdiag(ones(5),ones(5)); A(1,10) = 1; A(10,1) = 1; A(5,6) = 1; A(6,5) = 1;
    >> [p1,p2] = metispart(sparse(A))
    p1 =
        1     2     3     4     5
    p2 =
        6     7     8     9    10
    ```
    
### Acknowledgments
-------
Many thanks to [David Gleich](https://www.cs.purdue.edu/homes/dgleich/)
and [Robert Bridson](http://www.cs.ubc.ca/~rbridson/).
[Yingzhou Li](https://www.stanford.edu/people/yingzhouli)
implements this repository
after carefully exploring their previous work [metismex](https://github.com/dgleich/metismex)
and [metismex.c](http://www.cs.ubc.ca/~rbridson/download/metismex.c).



