date:    2012-10-07
category: java
title: Arguing the JSP case

Hi all, there has been some discussion whether regarding the case of
the taglib tags.  This article is meant as an invitation to a
discussion on the subject.


As much as I try to, I cannot understand why anyone would want to
write uppercase tags.

## The JSR-000052 JavaServer Pages (tm) Standard Tag Library Specification states that:

<blockquote>
"JSTL adopts capitalization conventions of Java variables for
compound words in action and attribute names. Recommended
tag prefixes are kept lowercase. Thus, we have
```&lt;sql:transaction&gt;``` and
```&lt;c:forEach&gt;```, as well as attributes such
as```xmlUrl``` and
```varDom```."
</blockquote>
<a href="http://jcp.org/aboutJava/communityprocess/final/jsr052/">
jsr052, section 2.6
</a>

## Sun's JSP code Conventions states the following on tag prefix names:

<blockquote>
"A tag prefix should be a short yet meaningful noun in title case, and
the first character in lower-case. A tag prefix should not contain
non-alphabetic characters."
</blockquote>

- <a href="http://java.sun.com/developer/technicalArticles/javaserverpages/code_convention/">
JSP code conventions
</a>


This could imply camel notation, in our case would it mean only lower
case, as our taglibs have only one word; article, category, relation,
util and so on.

## All the Struts Taglibs use lowercase in their documentation:


<a href="http://struts.apache.org/struts-taglib/tagreference-struts-bean.html">
struts-bean
</a>

<a href="http://struts.apache.org/struts-taglib/tagreference-struts-html.html">
struts-html
</a>

<a href="http://struts.apache.org/struts-taglib/tagreference-struts-logic.html">
struts-logic
</a>

<a href="http://struts.apache.org/struts-taglib/tagreference-struts-nested.html">
struts-nested
</a>


## The Prime pro-uppercaes argument

The prime argument for UPPERCASE taglib tags, is that they
are easier to spot. While this is true for arcane and
hopeless editors, such as notepad, all proper text editors
and IDEs support XML and thus highlights both the tag prefix
and suffix in different colours, making them easy to
differentiate. This argument is therefore not, IMHO, worth
its salt.

## Strain on Eyes

Lowercase letters are easier on the eyes, UPPERCASE LETTERS SCREAM
AT YOU!

## Look around

Just about all XML documents everywhere, not forgetting all O'Reilly
title I've come by, are written in lowercase

## The XHTML does it

Also, the XHTML standard stresses lowercase;
the <a href="http://www.w3.org/TR/html/#h-4.2">XHTML
specification</a> states that:

>XHTML documents must use lower case for all HTML element and attribute names.

## Time to type

It takes longer to constantly switch case. You either have
to switch the capslock key on and off, or press shift while
typing the entire tag name. Why go through this, when you
don't need to? I believe not all UPPERCASE writers have
considered this point. Just try one day, writing everything
lowercase and feel the difference in speed and strain on
your fingers :-)

So, I ask again (and please take a good think before answering), why
do we argue about this, why don't everyone just use lowercase?

<address>-Torstein</address>
