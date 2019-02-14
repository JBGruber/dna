## Discourse Network Analyzer (DNA)

The Java software Discourse Network Analyzer (DNA) is a qualitative content analysis tool with network export facilities. You import text files and annotate statements that persons or organizations make, and the program will return network matrices of actors connected by shared concepts.

- Download the latest [release](https://github.com/leifeld/dna/releases) of the software.

- Check out the detailed [manual](https://github.com/leifeld/dna/releases/download/v2.0-beta.22/dna-manual.pdf) for more information, including installation instructions and information on network methods and rDNA.

- If you have questions or want to report bugs, please create an issue in the [issue tracker](https://github.com/leifeld/dna/issues).

<br />

## rDNA. A Package to Control DNA from R

This is the companion package to DNA. It integrates the Java software with the statistical computing environment R.

You can install the most recent version using:
``` r
# install.packages("devtools")
devtools::install_github("leifeld/dna/rDNA", INSTALL_opts = "--no-multiarch")
```
Please note that the most recent version requires compilation of the current jar file from the sources on GitHub, for example using the provided make file.

The recommended version for most users is therefore the stable release version of rDNA, which can be used together with the jar file of the respective release (see [releases](https://github.com/leifeld/dna/releases)). You can install the stable release version of rDNA by inserting the path to the latest release version into the above command. For example, for the 2.0 beta 23 release, this would be:
``` r
devtools::install_url("https://github.com/leifeld/dna/releases/download/v2.0-beta.23/rDNA_2.1.13.tar.gz",
                      INSTALL_opts = "--no-multiarch")
```
Note that the package relies on `rJava`, which needs to be installed first. For details on the installation process on different operating systems, consult the chapter "Installation of DNA and rDNA" in the manual.

[![Build Status](https://travis-ci.org/leifeld/dna.svg?branch=master)](https://travis-ci.org/leifeld/dna)
[![Coverage status](https://codecov.io/gh/leifeld/dna/branch/master/graph/badge.svg)](https://codecov.io/github/leifeld/dna?branch=master)
