
[//000000001]: # (doctools::html::cssdefaults \- Documentation tools)
[//000000002]: # (Generated from file 'html\_cssdefaults\.man' by tcllib/doctools with format 'markdown')
[//000000003]: # (Copyright &copy; 2009 Andreas Kupries <andreas\_kupries@users\.sourceforge\.net>)
[//000000004]: # (doctools::html::cssdefaults\(n\) 0\.1 tcllib "Documentation tools")

<hr> [ <a href="../../../../toc.md">Main Table Of Contents</a> &#124; <a
href="../../../toc.md">Table Of Contents</a> &#124; <a
href="../../../../index.md">Keyword Index</a> &#124; <a
href="../../../../toc0.md">Categories</a> &#124; <a
href="../../../../toc1.md">Modules</a> &#124; <a
href="../../../../toc2.md">Applications</a> ] <hr>

# NAME

doctools::html::cssdefaults \- Default CSS style for HTML export plugins

# <a name='toc'></a>Table Of Contents

  - [Table Of Contents](#toc)

  - [Synopsis](#synopsis)

  - [Description](#section1)

  - [API](#section2)

  - [Bugs, Ideas, Feedback](#section3)

  - [Keywords](#keywords)

  - [Category](#category)

  - [Copyright](#copyright)

# <a name='synopsis'></a>SYNOPSIS

package require Tcl 8\.5 9  
package require doctools::html::cssdefaults ?0\.1?  

[__::doctools::html::cssdefaults::contents__](#1)  

# <a name='description'></a>DESCRIPTION

This package provides a single command providing access to the text of the
default CSS style to use for HTML markup generated by the various HTML export
plugins\.

This is an internal package of doctools, for use by
*[export](\.\./\.\./\.\./\.\./index\.md\#export)* plugins, i\.e\. the packages
converting doctools related documented into other formats, most notably
*[HTML](\.\./\.\./\.\./\.\./index\.md\#html)*\.

# <a name='section2'></a>API

  - <a name='1'></a>__::doctools::html::cssdefaults::contents__

    This command returns the text of the default CSS style to use for HTML
    markup generated by the various HTML export plugins\.

# <a name='section3'></a>Bugs, Ideas, Feedback

This document, and the package it describes, will undoubtedly contain bugs and
other problems\. Please report such in the category *doctools* of the [Tcllib
Trackers](http://core\.tcl\.tk/tcllib/reportlist)\. Please also report any ideas
for enhancements you may have for either package and/or documentation\.

When proposing code changes, please provide *unified diffs*, i\.e the output of
__diff \-u__\.

Note further that *attachments* are strongly preferred over inlined patches\.
Attachments can be made by going to the __Edit__ form of the ticket
immediately after its creation, and then using the left\-most button in the
secondary navigation bar\.

# <a name='keywords'></a>KEYWORDS

[CSS](\.\./\.\./\.\./\.\./index\.md\#css), [HTML](\.\./\.\./\.\./\.\./index\.md\#html),
[doctools](\.\./\.\./\.\./\.\./index\.md\#doctools),
[export](\.\./\.\./\.\./\.\./index\.md\#export),
[plugin](\.\./\.\./\.\./\.\./index\.md\#plugin),
[style](\.\./\.\./\.\./\.\./index\.md\#style)

# <a name='category'></a>CATEGORY

Documentation tools

# <a name='copyright'></a>COPYRIGHT

Copyright &copy; 2009 Andreas Kupries <andreas\_kupries@users\.sourceforge\.net>
