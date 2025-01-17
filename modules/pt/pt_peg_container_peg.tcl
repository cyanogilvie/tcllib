# -*- tcl -*-
# Parsing Expression Grammar 'PEG'.
# Definition of a human-readable form of parsing expression grammar specification.

package require Tcl 8.5 9
package require snit
package require pt::peg::container

snit::type pt::peg::container::peg {
    constructor {} {
        install myg using pt::peg::container ${selfns}::G
        $myg start {n Grammar}
        $myg add   ALNUM ALPHA AND APOSTROPH ASCII Attribute Char CharOctalFull CharOctalPart CharSpecial CharUnescaped CharUnicode Class CLOSE CLOSEB COLON COMMENT DAPOSTROPH DDIGIT Definition DIGIT DOT END EOF EOL Expression Final Grammar GRAPH Header Ident Identifier IS LEAF Literal LOWER NOT OPEN OPENB PEG PLUS Prefix Primary PRINTABLE PUNCT QUESTION Range SEMICOLON Sequence SLASH SPACE STAR StartExpr Suffix TO UPPER VOID WHITESPACE WORDCHAR XDIGIT
        $myg modes {
            ALNUM         leaf
            ALPHA         leaf
            AND           leaf
            APOSTROPH     void
            ASCII         leaf
            Attribute     value
            Char          value
            CharOctalFull leaf
            CharOctalPart leaf
            CharSpecial   leaf
            CharUnescaped leaf
            CharUnicode   leaf
            Class         value
            CLOSE         void
            CLOSEB        void
            COLON         void
            COMMENT       void
            DAPOSTROPH    void
            DDIGIT        leaf
            Definition    value
            DIGIT         leaf
            DOT           leaf
            END           void
            EOF           void
            EOL           void
            Expression    value
            Final         void
            Grammar       value
            GRAPH         leaf
            Header        value
            Ident         leaf
            Identifier    value
            IS            void
            LEAF          leaf
            Literal       value
            LOWER         leaf
            NOT           leaf
            OPEN          void
            OPENB         void
            PEG           void
            PLUS          leaf
            Prefix        value
            Primary       value
            PRINTABLE     leaf
            PUNCT         leaf
            QUESTION      leaf
            Range         value
            SEMICOLON     void
            Sequence      value
            SLASH         void
            SPACE         leaf
            STAR          leaf
            StartExpr     value
            Suffix        value
            TO            void
            UPPER         leaf
            VOID          leaf
            WHITESPACE    void
            WORDCHAR      leaf
            XDIGIT        leaf
        }
        $myg rules {
            ALNUM         {x {t <} {t a} {t l} {t n} {t u} {t m} {t >} {n WHITESPACE}}
            ALPHA         {x {t <} {t a} {t l} {t p} {t h} {t a} {t >} {n WHITESPACE}}
            AND           {x {t &} {n WHITESPACE}}
            APOSTROPH     {t '}
            ASCII         {x {t <} {t a} {t s} {t c} {t i} {t i} {t >} {n WHITESPACE}}
            Attribute     {x {/ {n VOID} {n LEAF}} {n COLON}}
            Char          {/ {n CharSpecial} {n CharOctalFull} {n CharOctalPart} {n CharUnicode} {n CharUnescaped}}
            CharOctalFull {x {t \134} {.. 0 2} {.. 0 7} {.. 0 7}}
            CharOctalPart {x {t \134} {.. 0 7} {? {.. 0 7}}}
            CharSpecial   {x {t \134} {/ {t n} {t r} {t t} {t '} {t \42} {t \133} {t \135} {t \134}}}
            CharUnescaped {x {! {t \134}} dot}
            CharUnicode   {x {t \134} {t u} xdigit {? {x xdigit {? {x xdigit {? xdigit}}}}}}
            Class         {x {n OPENB} {* {x {! {n CLOSEB}} {n Range}}} {n CLOSEB} {n WHITESPACE}}
            CLOSE         {x {t \51} {n WHITESPACE}}
            CLOSEB        {t \135}
            COLON         {x {t :} {n WHITESPACE}}
            COMMENT       {x {t #} {* {x {! {n EOL}} dot}} {n EOL}}
            DAPOSTROPH    {t \42}
            DDIGIT        {x {t <} {t d} {t d} {t i} {t g} {t i} {t t} {t >} {n WHITESPACE}}
            Definition    {x {? {n Attribute}} {n Identifier} {n IS} {n Expression} {n SEMICOLON}}
            DIGIT         {x {t <} {t d} {t i} {t g} {t i} {t t} {t >} {n WHITESPACE}}
            DOT           {x {t .} {n WHITESPACE}}
            END           {x {t E} {t N} {t D} {n WHITESPACE}}
            EOF           {! dot}
            EOL           {/ {x {t \r} {t \n}} {t \n} {t \r}}
            Expression    {x {n Sequence} {* {x {n SLASH} {n Sequence}}}}
            Final         {x {n END} {n SEMICOLON} {n WHITESPACE}}
            Grammar       {x {n WHITESPACE} {n Header} {* {n Definition}} {n Final} {n EOF}}
            GRAPH         {x {t <} {t g} {t r} {t a} {t p} {t h} {t >} {n WHITESPACE}}
            Header        {x {n PEG} {n Identifier} {n StartExpr}}
            Ident         {x {/ {t _} {t :} alpha} {* {/ {t _} {t :} alnum}}}
            Identifier    {x {n Ident} {n WHITESPACE}}
            IS            {x {t <} {t -} {n WHITESPACE}}
            LEAF          {x {t l} {t e} {t a} {t f} {n WHITESPACE}}
            Literal       {/ {x {n APOSTROPH} {* {x {! {n APOSTROPH}} {n Char}}} {n APOSTROPH} {n WHITESPACE}} {x {n DAPOSTROPH} {* {x {! {n DAPOSTROPH}} {n Char}}} {n DAPOSTROPH} {n WHITESPACE}}}
            LOWER         {x {t <} {t l} {t o} {t w} {t e} {t r} {t >} {n WHITESPACE}}
            NOT           {x {t !} {n WHITESPACE}}
            OPEN          {x {t \50} {n WHITESPACE}}
            OPENB         {t \133}
            PEG           {x {t P} {t E} {t G} {n WHITESPACE}}
            PLUS          {x {t +} {n WHITESPACE}}
            Prefix        {x {? {/ {n AND} {n NOT}}} {n Suffix}}
            Primary       {/ {n ALNUM} {n ALPHA} {n ASCII} {n DDIGIT} {n DIGIT} {n GRAPH} {n LOWER} {n PRINTABLE} {n PUNCT} {n SPACE} {n UPPER} {n WORDCHAR} {n XDIGIT} {n Identifier} {x {n OPEN} {n Expression} {n CLOSE}} {n Literal} {n Class} {n DOT}}
            PRINTABLE     {x {t <} {t p} {t r} {t i} {t n} {t t} {t >} {n WHITESPACE}}
            PUNCT         {x {t <} {t p} {t u} {t n} {t c} {t t} {t >} {n WHITESPACE}}
            QUESTION      {x {t ?} {n WHITESPACE}}
            Range         {/ {x {n Char} {n TO} {n Char}} {n Char}}
            SEMICOLON     {x {t \73} {n WHITESPACE}}
            Sequence      {+ {n Prefix}}
            SLASH         {x {t /} {n WHITESPACE}}
            SPACE         {x {t <} {t s} {t p} {t a} {t c} {t e} {t >} {n WHITESPACE}}
            STAR          {x {t *} {n WHITESPACE}}
            StartExpr     {x {n OPEN} {n Expression} {n CLOSE}}
            Suffix        {x {n Primary} {? {/ {n QUESTION} {n STAR} {n PLUS}}}}
            TO            {t -}
            UPPER         {x {t <} {t u} {t p} {t p} {t e} {t r} {t >} {n WHITESPACE}}
            VOID          {x {t v} {t o} {t i} {t d} {n WHITESPACE}}
            WHITESPACE    {* {/ {t \40} {t \t} {n EOL} {n COMMENT}}}
            WORDCHAR      {x {t <} {t w} {t o} {t r} {t d} {t c} {t h} {t a} {t r} {t >} {n WHITESPACE}}
            XDIGIT        {x {t <} {t x} {t d} {t i} {t g} {t i} {t t} {t >} {n WHITESPACE}}
        }
        return
    }

    component myg
    delegate method * to myg
}

package provide pt::peg::container::peg 1.1
return
