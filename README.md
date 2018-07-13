# Daniel's publications

Bibtex file with my publications including a LaTeX file to create a PDF with highlighted name.

Render it with `latexmk` in a container using the following command:

```
docker run --rm -it -v $(pwd):/data janwh/latex latexmk -pdf publications-daniel-nuest.tex
```

Or build the local Dockerfile with newest biber and biblatex (tested biber `>= 2.11` and biblatex `>= 3.11`):

```
docker build --tag publications .
docker run --rm -it -v $(pwd):/data publications:latest
```
