

# CoffeeNode TeaCup

**About**: This is an extension of [TeaCup templates](https://github.com/goodeggs/teacup). All tags are
defined in UPPER CASE and are meant to be included like this in your template module(s):

```coffeescript
teacup = require 'coffeenode-teacup'
for name_ of teacup
  eval "#{name_} = teacup[ #{rpr name_} ]"
```

If you feel it's icky to merge namespaces with `eval` (and it somehow is), i suggest to go with, like,
`t = require 'coffeenode-teacup'`, `t.DIV => t.SPAN 'yo'`.

Teacup's `renderable` is not inlcuded in this version, as i found it, well, somewhat strange. Instead, you
can use `render DIV 'helo world'` to turn a tag into a string.

In addition to Teacup's tags, CoffeeNode TeaCup introduces the following conveience methods (`Q` is my
shorthand for an options object):


*	`CONFIRM_PASSWORD = ( Q ) ->`
	A `LABELLED_INPUT` field for password confirmation.

*	`EMAIL = ( Q ) ->`
	A `LABELLED_INPUT` field for an email address.

*	`LABELLED_INPUT = ( Q, label ) ->`
	A text input with a label.

*	`PASSWORD = ( Q ) ->`
	A `LABELLED_INPUT` field for passwords.

*	`SUBMIT = ( Q ) ->`
	A submit button.

*	`TEXT_INPUT = ( Q ) ->`
	A text input.



`CEDE`
`COFFEESCRIPT`
`COMMENT`
`DOCTYPE`
`ESCAPE`
`IE`
`RAW`
`SCRIPT`
`TAG`
`TEXT`
`A`
`ABBR`
`ADDRESS`
`ARTICLE`
`ASIDE`
`AUDIO`
`B`
`BDI`
`BDO`
`BLOCKQUOTE`
`BODY`
`BUTTON`
`CANVAS`
`CAPTION`
`CITE`
`CODE`
`COLGROUP`
`DATALIST`
`DD`
`DEL`
`DETAILS`
`DFN`
`DIV`
`DL`
`DT`
`EM`
`FIELDSET`
`FIGCAPTION`
`FIGURE`
`FOOTER`
`FORM`
`H1`
`H2`
`H3`
`H4`
`H5`
`H6`
`HEAD`
`HEADER`
`HGROUP`
`HTML`
`I`
`IFRAME`
`INS`
`KBD`
`LABEL`
`LEGEND`
`LI`
`MAP`
`MARK`
`MENU`
`METER`
`NAV`
`NOSCRIPT`
`OBJECT`
`OL`
`OPTGROUP`
`OPTION`
`OUTPUT`
`P`
`PRE`
`PROGRESS`
`Q`
`RP`
`RT`
`RUBY`
`S`
`SAMP`
`SECTION`
`SELECT`
`TABLE`
`TBODY`
`TD`
`TEXTAREA`
`TFOOT`
`TH`
`THEAD`
`TIME`
`TITLE`
`TR`
`U`
`UL`
`VIDEO`
`APPLET`
`ACRONYM`
`BGSOUND`
`DIR`
`FRAMESET`
`NOFRAMES`
`ISINDEX`
`LISTING`
`NEXTID`
`NOEMBED`
`PLAINTEXT`
`RB`
`STRIKE`
`XMP`
`BIG`
`BLINK`
`CENTER`
`FONT`
`MARQUEE`
`MULTICOL`
`NOBR`
`SPACER`
`TT`
`STYLE`
`AREA`
`BASE`
`BR`
`COL`
`COMMAND`
`EMBED`
`HR`
`IMG`
`INPUT`
`KEYGEN`
`LINK`
`META`
`PARAM`
`SOURCE`
`TRACK`
`WBR`
`BASEFONT`
`FRAME`
`TEACUP`
`SMALL`
`SPAN`
`STRONG`
`SUB`
`SUMMARY`
`SUP`
