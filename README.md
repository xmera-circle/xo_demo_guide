# xmera Omnia Demo Guide

Developer project of xmera Omnia Demo Guide

![xmera Omnia Demo Guide Version](https://img.shields.io/badge/xmera_Omnia_Demo_Guide-0.2.0-red) ![xmera Omnia Version](https://img.shields.io/badge/xmera_Omnia-v3.4.x-blue) ![Language Support](https://img.shields.io/badge/Languages-de-green) ![Version Stage](https://img.shields.io/badge/Stage-release-important)

The xmera Omnia Demo Guide is written in asciidoc and convertible into html pages by Antora.

---

## Installation

The documentation is based on ascii-docs. The adoc-files are converted to a html-documantation by Antora.
So you need to install

- [Antora](https://docs.antora.org/antora/2.3/install/install-antora/)

Antora needs an playbook (yml file), where the location of the content (the modules folder and the antora.yml) is located and the start page and the location of the userinterface are defined.

In the antora.yml the first navigation level is defined. The entries are links to the navigation files of the next navigation level. In this nav.yml in each module, the links to the content.yml's are specified.

## Create Antora html pages manually

To create the antora html pages you have to run

    $ antora xo-doc-playbook.yml

A folder pages is created. You can start the index.html in the folder pages to see the outcome.

## Create Antora html pages with makefile

Create the antora html pages and start the the page with firefox run:

    $ make html
