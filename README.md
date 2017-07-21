# ENVI Contribution Guide

This GitHub page is meant as a reference for how to create or contribute to new repositories for the ENVI organization.


## IDL Code

For how the IDL code should be written, see the IDL ContribGuide which details the desired syntax formatting for all PRO code. Here is a link to that repository:

[IDL ContribGuide](https://github.com/interactive-data-language/ContribGuide)

The only additional note to be added is that, because the ENVI task system uses procedures and keywords, all primary routines for ENVI code should be written as procedures that use keywords. This way they can easily be converted into ENVI tasks.


## Directory Structure

When making a repository that contains ENVI tasks, a certain directory structure is required because the IDL Package Manager will be able to easily bundle your code and install for you if you do so. The layout is:

Under the parent directory:
- Subdirectory called "custom_code"
- Subdirectory called "extension"

The "custom_code" directory is to contain all required source code for the task and the ENVI ".task" file. This should also be the directory that contains the "idlpm.json" file that describes the code requirements. For more information on how to write ENVI tasks, see the "ENVI Tasks" section below.

The "extension" directory is optional and should be included if an ENVI extension. For more information on how to write an ENVI extension see below.


## ENVI Tasks

Because the fundamental piece of processing when using ENVI is the ENVI Task, it is preferable that contributed code uses ENVI tasks where appropriate (it does not always apply to every situation). 

At this point in time, ENVI 5.4 is currently released. Many users are still on the ENVI 5.3 framework, so all tasks should be written for ENVI 5.3 where appropriate. The tasks will work an newer versions of ENVI and users on older versions of the software will have no problem using the tools.

For a great tutorial on ENVI tasks, what they are, and how to use them, see the chapter.md file in the **envi-and-idl-tasks** folder. Specifically, **Exercise #1** goes through how to create a custom task. Note that this tutorial is taken directly from a course on Extending ENVI with IDL, so there are some markdown tags specific to the formatting that was used.

This folder also contains some examples of IDL tasks as well in a **code** directory. 

## ENVI Extensions

When writing tasks for ENVI, it is also a good idea to create an extension for ENVI so that non-programmers can easily use any tools that are created. To make your extension simply use the repository for the extension template and replace the code where designated for your custom extension.

Included is a file called **sample_extension.pro** which is provided as a basic example that can be extended upon for actual use. As is, if you change the names of the procedures, buttons, and task that gets called, you can use the extension as is.

