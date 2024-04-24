<h1 align="center">
  <br>
    🔍 gowitness
  <br>
  <br>
</h1>

<h4 align="center">A golang, web screenshot utility using Chrome Headless.</h4>


## About the project

This is a modified version of gowitness that uses python3 along with the jinja2 library to provide more user-friendly reports.

Current features:
- Screenshot filtering by status codes 
- Grouping screenshots by similarity based on perception hashes

## Project Usage

### Via docker

Docker is the main way to use the project.

0) (Optional) build the project `docker build -t yourname/gowitness .`
1) Pull docker image (you can use a ready-made one): `docker pull mk13371/gowitness`
2) Create a urls.txt file with the links you want to screenshot
3) Run docker in the same directory: `docker run --rm -v $(pwd):/data mk13371/gowitness:latest`.

### Separately

For complete instructions on how to run the project separately, read the instructions [in this repository](https://github.com/mk13337/gowitness_reporter)

