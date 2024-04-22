<br> 
<!-- PROJECT LOGO -->
<div align="center">
  <img src="https://img.shields.io/badge/Python-2496ED?style=for-the-badge&logo=Python&logoColor=white" alt="Python">
  
  <h3 align="center">Mini Python Compiler</h3>

  <p align="center">
    A Simple Python Compiler that is capable of printing strings and printing basic arithmetic operations.
  </p>
</div>

<!-- ABOUT THE PROJECT -->

## About The Project

A mini compiler demonstrating the use of data types utilizing Flex and Bison. In the case of Python, the print statement is able to take in multiple data types such as integers and string. The developer in Python would simply call `print(<value>)`, however inside the compiler it requires complex design to determine the value type then it can print to the console.

<!-- GETTING STARTED -->

## Getting Started

Installing and configuring Flex and Bison using Docker.

### Prerequisites

_Have Docker pre-installed into your operating system._

- Using [CLI Command](https://docs.docker.com/engine/install/ubuntu/) for Ubuntu
  ```
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  ```

### Installation

_Below is an example of how you download this project and start using Docker._

1. Clone the repo
   ```
   git clone <repo_url>
   ```
2. Go into the Project Repository
   ```
   cd /path/to/repository
   ```
3. Build Image
   ```
   sudo docker build -t compiler-image .
   ```
4. Run Container
   ```
   sudo docker run -it compiler-image
   ```
5. Run Test inside Container
   ```
   $ make
   $ ./compiler <source_file>
   ```

<!-- USAGE EXAMPLES -->

## Usage

_Using the pre-defined Python file to test arithmetic operations and printing of strings._

```
$ make
$ ./compiler __test__/arithmetic.py
```

_Remove all generated files._

```
make clean
```

<!-- LICENSE -->

## License

Distributed under the MIT License. See `LICENSE.txt` for more information.
