# ENVI Contribution Guide

This GitHub page is meant as a reference for how to create or contribute to new repositories for the ENVI organization.


## IDL Code

For how the IDL code should be written, see the IDL ContribGuide which details the desired syntax formatting for all PRO code. Here is a link to that repository:

[IDL ContribGuide](https://github.com/interactive-data-language/ContribGuide)

The only additional note to be added is that, because the ENVI task system uses procedures and keywords, all primary routines for ENVI code should be written as procedures that use keywords. This way they can easily be converted into ENVI tasks.


## ENVI Tasks

Because the fundamental piece of processing when using ENVI is the ENVI Task, it is preferrable that contributed code uses ENVI tasks where appropriate (it does not always apply to every situation). 

At this point in time, ENVI 5.4 is currently released. Many users are stil on the ENVI 5.3 framework, so all tasks shoul dbe written for ENVI 5.3 where appropriate. The tasks will work an later versions of ENVI as well and users on older versions of the software will have no problem using the tools.


## ENVI Extensions

When writing tasks for ENVI, it is also a good idea to create an extension for ENVI so that non-programmers can easily use any tools that are created. To make your extension simply use the repository for the extension template and replace the code where designated for your custom extension.

Note that the template has not been added to the repository yet.

