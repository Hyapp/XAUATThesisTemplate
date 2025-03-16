%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Version Information ********************************
%%
%% Copyright (C) Huangrui Mo <huangrui.mo@gmail.com>
%% This is free software: you can redistribute it and/or modify it
%% under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%

%%%%%---------------------------------------------------------------------------------
%% This template has been modified from the original file provided by Huangrui Mo. 
%% Thanks to him for the original file.
%% Copyright (C) Hongyi Li <hyappstolz@outlook.com>
%% Time: January 7th, 2025.
%%%%%---------------------------------------------------------------------------------


\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{Style/xauat}
  [2025/01/07 v1.0 xauat document class]
%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Declare Options **************************************
%%
%% end-user parameters, each option is declared by one declare option command
\newif\ifXAUAT@versioninfo \XAUAT@versioninfofalse
\DeclareOption{draftversion}{% draft information reminder
  \XAUAT@versioninfotrue%
}
\newif\ifXAUAT@singlesided \XAUAT@singlesidedfalse
\DeclareOption{singlesided}{% enable single-sided printing
  \XAUAT@singlesidedtrue%
}
\newif\ifXAUAT@doublesided \XAUAT@doublesidedfalse
\DeclareOption{doublesided}{% enable double-sided printing
  \XAUAT@doublesidedtrue%
}
\newif\ifXAUAT@printcopy \XAUAT@printcopyfalse
\DeclareOption{printcopy}{% enable print copy layout
  \XAUAT@doublesidedtrue% auto enable double-sided style
  \XAUAT@printcopytrue%
}
\DeclareOption*{% handle non-implemented options
  \PassOptionsToClass{\CurrentOption}{ctexbook}%
}
%% terminates all options processing
\ProcessOptions\relax

%%%%% --------------------------------------------------------------------------------
%%
%%%%*************************** Loadclass Infomation *********************************
%%
\ifXAUAT@doublesided% if double-sided printing enabled
  \LoadClass[UTF8,a4paper,twoside,fntef,12pt]{ctexbook}
\else% if double-sided printing isn't enabled
  \LoadClass[UTF8,a4paper,oneside,fntef,12pt]{ctexbook}
\fi
%%%%% --------------------------------------------------------------------------------
%%
%%%%***************************** Package Infomation *********************************
%%
%% color packages
\RequirePackage[usenames,dvipsnames,table]{xcolor}%
%% math packages
\RequirePackage{amsmath,amssymb,amstext}
\RequirePackage{amscd,amssymb,amsfonts,amsbsy,amsmath,verbatim,color}
\RequirePackage{multirow}
\RequirePackage{tabularx}

%%%%% --------------------------------------------------------------------------------
%%
%%%%************************ Load Class Configuretion ********************************
%%
\AtEndOfPackage{%class cfg loaded after package, makes commands at preamble take effect
  \makeatletter
  \InputIfFileExists{Style/xauat.cfg}{}{}
  \makeatother
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%******************************* Page Layout **************************************
%%
%% part one -- horizontal widths
%% left side width + textwidth + right side width = paperwidth
%% left side width of [odd, even] page = [odd, even]sidemargin + 1.0in (fixed) + hoffset
%% binding side width + textwidth + nonbinding side width = paperwidth
%% binding side width of [odd, even] page = [left, right] side width
%% assuming A4 paper (210mm x 297mm)
\setlength{\textwidth}{146.6mm}% set required text width first
\ifXAUAT@printcopy% if print copy layout enabled
  \setlength{\oddsidemargin}{12.6mm}% binding side width
  \setlength{\evensidemargin}{0mm}% ensure uniform binding side width for printing
\else
  \setlength{\oddsidemargin}{6.3mm}% left side width
  \setlength{\evensidemargin}{6.3mm}% ensure uniform left side width for EThesis
\fi
 %% set margin for notes to zero
\setlength{\marginparwidth}{35pt}% width of margin notes
\setlength{\marginparsep}{10pt}% width of space between body text and margin notes
%% part two -- vertical heights
%% top height + textheight + bottom height = paperheight
%% top height = 1.0in (fixed) + voffset + topmargin + headheight + headsep

\setlength{\textheight}{235mm}% set required text height first整体文本高度
\setlength{\voffset}{-17.4mm}% set vertical offset
\setlength{\topmargin}{14mm}% vertical margin above header横线距上面高度
\setlength{\headheight}{5mm}% header height
\setlength{\headsep}{12pt}% vertical margin between header and body text 文本与上方横线距离
\setlength{\footskip}{29.5pt}% vertical margin between footer and body text

%- specifies the amount of space between paragraphs.
\setlength{\parskip}{0.5ex plus 0.25ex minus 0.25ex}
%% line spacing
\renewcommand{\baselinestretch}{1.5} % line space setting
\linespread{1.5}
\raggedbottom % prevent adding vertical white space in strange places
%% default pagestyle is page number at bottom without headers and footers
\pagestyle{plain}
 \newenvironment{shrinkeq}[1] { \bgroup \addtolength\abovedisplayshortskip{#1}
  \addtolength\abovedisplayskip{#1} \addtolength\belowdisplayshortskip{#1}
  \addtolength\belowdisplayskip{#1}} {\egroup\ignorespacesafterend}
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************* Some Style Control Commands ********************************
%%
%% redefine cleardoublepage to empty pages
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \thispagestyle{empty}%
\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
%% underline
\newcommand{\CJKunderlinecolor}{\color[rgb]{0,0,0}}
\def\XAUAT@underline[#1]#2{%
    \CJKunderline{\hbox to #1{\hfill#2\hfill}}}
\def\XAUATunderline{\@ifnextchar[\XAUAT@underline\CJKunderline}
% 引用上标
\newcommand{\supercite}[1]{\textsuperscript{\cite{#1}}}
%%%%% --------------------------------------------------------------------------------
%%
%%%%********************** Chinese Titlepage Items ***********************************
%%
\newcommand\classification[1]   {\def\XAUAT@value@classification{#1}}
\newcommand\confidential[1]{\def\XAUAT@value@confidential{#1}}
\newcommand\schoollogo[2]{\def\XAUAT@value@schoollogo{\includegraphics[#1]{#2}}}
\renewcommand\title[2][\XAUAT@value@title]{%
  \def\XAUAT@value@title{#2}
  %\def\XAUAT@value@titlemark{\MakeUppercase{#1}}}
  \def\XAUAT@value@titlemark{#1}}
\def\@title{\XAUAT@value@titlemark}
\renewcommand\author[1]{\def\XAUAT@value@author{#1}}
\newcommand\advisor[1]{\def\XAUAT@value@advisor{#1}}
\newcommand\advisorinstitute[1]{\def\XAUAT@value@advisorinstitute{#1}}
\newcommand\degree[1]{\def\XAUAT@value@degree{#1}}
\newcommand\degreetype[1]{\def\XAUAT@value@degreetype{#1}}
\newcommand\major[1]{\def\XAUAT@value@major{#1}}
\newcommand\institute[1]{\def\XAUAT@value@institute{#1}}
\newcommand\chinesedate[1]{\def\XAUAT@value@chinesedate{#1}}
\newcommand\tijiao[1]{\def\XAUAT@value@tijiao{#1}}
\newcommand\dabian[1]{\def\XAUAT@value@dabian{#1}}
\newcommand\zhuxi[1]{\def\XAUAT@value@zhuxi{#1}}
\newcommand\pingyueren[1]{\def\XAUAT@value@pingyueren{#1}}
\newcommand\pingyuerens[1]{\def\XAUAT@value@pingyuerens{#1}}
\newcommand\school[1]{\def\XAUAT@value@school{#1}}
\newcommand\defensedate[1]{\def\XAUAT@value@defensedate{#1}}


\RequirePackage{fontspec}% fontspec package.
\defaultfontfeatures{Ligatures=TeX}% use tex style to support LaTeX quoting style.
\setmainfont{Times New Roman}
\setCJKmainfont{SimSun}[AutoFakeBold, AutoFakeSlant]
\newCJKfontfamily\songbf{SimSun}[AutoFakeBold]
\newCJKfontfamily\songit{SimSun}[AutoFakeSlant]

%%%%% --------------------------------------------------------------------------------
%%
%%%%**************************** Make Chinese Titlepage ******************************
%%
\renewcommand\maketitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vskip \stretch{10}
    \vskip \stretch{6}
    \XAUAT@value@schoollogo
    \vskip \stretch{1}

    {\zihao{1}\songti{{硕士毕业论文}}} 

    {\zihao{3}\heiti{{(学术学位)}}}
    \vskip \stretch{6}
    \def\tabcolsep{1pt}
    {\zihao{3}\heiti{\XAUAT@value@title}}
    \def\arraystretch{1.4}
    \vskip \stretch{8}

    \heiti{
    \begin{tabular}{rc}
    {\XAUAT@label@author} & \XAUATunderline[120pt]{\XAUAT@value@author}
    \\
    {\ziju{2}\XAUAT@label@confidential} & \XAUATunderline[120pt]{\XAUAT@value@confidential}
    \\
    {\XAUAT@label@school} & \XAUATunderline[120pt]{\XAUAT@value@school}
    \\
    {\XAUAT@label@major} & \XAUATunderline[120pt]{\XAUAT@value@major}
    \\
    {\XAUAT@label@advisor} & \XAUATunderline[120pt]{\XAUAT@value@advisor}
    \\
    {\XAUAT@label@defensedate} & \XAUATunderline[120pt]{\XAUAT@value@defensedate} 
    \\
    \end{tabular}
    }
    \vskip \stretch{4}
    %\XAUAT@value@chinesedate
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \ifXAUAT@versioninfo
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        %Draft Version (\today)
      \end{footnotesize}
    \fi
    \cleardoublepage
  \else
    \ifXAUAT@versioninfo
      \thispagestyle{empty}
      \vspace*{\stretch{1}}
      \begin{footnotesize}
        \noindent
        %Draft Version (\today)
      \end{footnotesize}
      \cleardoublepage
    \fi
  \fi
}
%%%%% --------------------------------------------------------------------------------
%%
%%%%*********************** English Titlepage Items **********************************
%%
\newcommand\englishtitle[1]{\def\XAUAT@value@englishtitle{#1}} 
\newcommand\englishauthor[1]{\def\XAUAT@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\XAUAT@value@englishadvisor{#1}}
\newcommand\englishmajor[1]{\def\XAUAT@value@englishmajor{#1}}
\newcommand\englishdate[1]{\def\XAUAT@value@englishdate{#1}}
\newcommand\englishDegreeType[1]{\def\XAUAT@value@englishDegreeType{#1}}
%%%%% --------------------------------------------------------------------------------
%%
%%%%*********************** Make English Titlepage ***********************************
%%
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{20pt}
    {\zihao{3}\bfseries\XAUAT@value@englishtitle}
    \vskip \stretch{4}
    
    \zihao{4}
    \begin{tabular}{c}
      A dissertation submitted to \\
      Xi'an University of Arcitecture and Technology \\
      in partital fulfillment of the requirements \\
      for the degree of \\
      Master of Science
    \end{tabular}

    \vskip \stretch{5}
    \begin{tabular}{c}
      By \\
      \XAUAT@value@englishauthor \\
      Supervisor: \XAUAT@value@englishadvisor \\
      \XAUAT@value@englishmajor \\
      \XAUAT@value@englishdate \\
    \end{tabular}

    \vskip \stretch{2}
    \zihao{4}
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}


\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}

\newcommand\makecommittee{
  \cleardoublepage
  \thispagestyle{empty}

  \chapter*[学位论文答辩委员会]{}
  \vskip 20pt
  \begin{center}
      {\zihao{2}\heiti 硕士学位论文答辩委员会}
  \end{center}

  \vskip 30pt

  \begin{center}
    {\zihao{3}\heiti \XAUAT@value@title}
  \end{center}

  \vskip 15pt

  \begin{center}
    {\zihao{3}\textit{（涉密论文以下不填写）}}
  \end{center}

  \vskip 15pt

  \begin{table}[h]
    \centering
    \renewcommand\arraystretch{1.5}
    \heiti{
    \begin{tabularx}{\linewidth}{|P{3cm}|P{2cm}|P{2cm}|C|}
      \hline
      答辩人姓名  & \multicolumn{3}{c|}{\XAUAT@value@author} \\ \hline
      答辩时间    & \multicolumn{3}{c|}{\XAUAT@value@defensedate} \\ \hline
      答辩委员会  & 姓名 & 职称 & 工作单位 \\ \hline
      主席        & \XAUAT@value@chiefname & \XAUAT@value@chiefTilte & \XAUAT@value@chiefOrganisation \\ \hline
      \multirow{6}{*}{委员} 
        & \XAUAT@value@staffNameOne & \XAUAT@value@staffTitleOne & \XAUAT@value@staffOrganisationOne \\ \cline{2-4}
        & \XAUAT@value@staffNameTwo & \XAUAT@value@staffTitleTwo & \XAUAT@value@staffOrganisationTwo \\ \cline{2-4}
        & \XAUAT@value@staffNameThree & \XAUAT@value@staffTitleThree & \XAUAT@value@staffOrganisationThree \\ \cline{2-4}
        & \XAUAT@value@staffNameFour & \XAUAT@value@staffTitleFour & \XAUAT@value@staffOrganisationFour \\ \cline{2-4}
        & \XAUAT@value@staffNameFive & \XAUAT@value@staffTitleFive & \XAUAT@value@staffOrganisationFive \\ \cline{2-4}
        & \XAUAT@value@staffNameSix & \XAUAT@value@staffTitleSix & \XAUAT@value@staffOrganisationSix \\ 
      \hline                    
    \end{tabularx}
    }
  \end{table}

  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}


%%
%%%%*********************** Make Committee ***********************************
%%
%\renewcommand\author[1]{\def\XAUAT@value@author{#1}}
\newcommand{\chiefName}[1]{\def\XAUAT@value@chiefname{#1}}
\newcommand{\chiefTitle}[1]{\def\XAUAT@value@chiefTilte{#1}}
\newcommand{\chiefOrganisation}[1]{\def\XAUAT@value@chiefOrganisation{#1}}
%1
\newcommand{\staffNameOne}[1]{\def\XAUAT@value@staffNameOne{#1}}
\newcommand{\staffTitleOne}[1]{\def\XAUAT@value@staffTitleOne{#1}}
\newcommand{\staffOrganisationOne}[1]{\def\XAUAT@value@staffOrganisationOne{#1}}

%2
\newcommand{\staffNameTwo}[1]{\def\XAUAT@value@staffNameTwo{#1}}
\newcommand{\staffTitleTwo}[1]{\def\XAUAT@value@staffTitleTwo{#1}}
\newcommand{\staffOrganisationTwo}[1]{\def\XAUAT@value@staffOrganisationTwo{#1}}

%3
\newcommand{\staffNameThree}[1]{\def\XAUAT@value@staffNameThree{#1}}
\newcommand{\staffTitleThree}[1]{\def\XAUAT@value@staffTitleThree{#1}}
\newcommand{\staffOrganisationThree}[1]{\def\XAUAT@value@staffOrganisationThree{#1}}

%4
\newcommand{\staffNameFour}[1]{\def\XAUAT@value@staffNameFour{#1}}
\newcommand{\staffTitleFour}[1]{\def\XAUAT@value@staffTitleFour{#1}}
\newcommand{\staffOrganisationFour}[1]{\def\XAUAT@value@staffOrganisationFour{#1}}

%5
\newcommand{\staffNameFive}[1]{\def\XAUAT@value@staffNameFive{#1}}
\newcommand{\staffTitleFive}[1]{\def\XAUAT@value@staffTitleFive{#1}}
\newcommand{\staffOrganisationFive}[1]{\def\XAUAT@value@staffOrganisationFive{#1}}

%6
\newcommand{\staffNameSix}[1]{\def\XAUAT@value@staffNameSix{#1}}
\newcommand{\staffTitleSix}[1]{\def\XAUAT@value@staffTitleSix{#1}}
\newcommand{\staffOrganisationSix}[1]{\def\XAUAT@value@staffOrganisationSix{#1}}


%%%%% --------------------------------------------------------------------------------
%%
%%%%*********************** Make Author Declaration ***********************************
%%
\newcommand\makedeclaration{%
  \cleardoublepage
  \chapter*[声明]{}
  \begin{center}
      {\zihao{3}\heiti \XAUAT@value@declare@create}
  \end{center}

  \XAUAT@value@declare@creativity\\

  \XAUAT@value@declare@s  \qquad \qquad \qquad \qquad \qquad \qquad \quad  \XAUAT@value@declare@d \\

  \vskip 20pt

  \begin{center}
      {\zihao{3}\heiti \XAUAT@value@declare@right}
  \end{center}

  \XAUAT@value@declare@rights
   \vskip 20pt
  \XAUAT@value@declare@s  \qquad \qquad \qquad \qquad \qquad \qquad \quad  \XAUAT@value@declare@d

  \XAUAT@value@declare@t \qquad \qquad \qquad \qquad \qquad \qquad \quad  \XAUAT@value@declare@d
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}
%%%%% --------------------------------------------------------------------------------
%%

%%%%****************************** New Environments **********************************
%%
%% define chinese abstract
\newenvironment{abstract}
{\chapter[\XAUAT@label@abstract]{
\zihao{-2}\heiti \XAUAT@value@title 
\vskip -12pt
\makebox[1em][r]{\zihao{-4}{\kaishu\XAUAT@label@degreeType}}\makebox[1em][s]{\zihao{-4}{\kaishu\XAUAT@value@degreeType}}
\vskip -12pt
\makebox[1em][r]{\zihao{-4}{\kaishu\XAUAT@label@majorType}}\makebox[1em][s]{\zihao{-4}{\kaishu\XAUAT@value@majorType}}\\
{\zihao{3}\textbf{\heiti \XAUAT@label@abstract}}}}

  {}
%% define chinese keywords
\newcommand\keywords[1]{%
    \vspace{2ex}\noindent{\zihao{-4}\heiti \XAUAT@label@keywords} #1}


%% define engish abstract
\newenvironment{englishabstract}
{\chapter[{\bfseries \XAUAT@label@englishabstract}]{
\zihao{-2}\textbf{\heiti \XAUAT@value@englishtitle}
\vskip -12pt
\makebox[2em][r]{\zihao{-4}{Type of Degree:\quad}}\makebox[1em][s]{\zihao{-4}{\textnormal{\XAUAT@value@englishDegreeType}}}
\vskip -12pt
\makebox[2em][r]{\zihao{-4}{\kaishu{Speciality:\quad}}}\makebox[1em][s]{\zihao{-4}{\textnormal{\XAUAT@value@englishmajor}}}\\\vskip 5pt
{\zihao{-3}\textbf{\heiti \XAUAT@label@englishabstract}}}}

%% define engish keywords
\newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\zihao{-4}\bfseries \XAUAT@label@englishkeywords} #1}



%%%%% --------------------------------------------------------------------------------
%%
% 章节标题的格式设置
\CTEXsetup[number={\arabic{chapter}}]{chapter}
%\CTEXsetup[number={\arabic{section}},name={,}]{section}

%%%%**************************** Dotted Line in TOC **********************************
%%
%% define spacing and length
\def\@dotsep{1.5mu}% spacing for dots
\def\@pnumwidth{2em}% spacing between titles and page numbers
\def\@tocrmarg{2em}% right margin indentation
\def\@chaptervspace{1ex}% spacing between chapter titles
%- redefine dottedtocline from classes.dtx and latex.ltx
\renewcommand*{\@dottedtocline}[5]{% [<level>,<indent>,<numwidth>,<title>,<page>]
    \ifnum #1>\c@tocdepth \else
        \vskip \z@ \@plus.2\p@
        {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
        \parindent #2\relax\@afterindenttrue
        \interlinepenalty\@M
        \leavevmode \zihao{-4}\sffamily
        \@tempdima #3\relax
        \advance \leftskip \@tempdima \null\nobreak\hskip -\leftskip
        {#4}\nobreak
        \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}\hfill
        \nobreak
        \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
        \par\penalty\@highpenalty}%
    \fi
}
%- redefine l@part from book.cls to add dotted toc line
\renewcommand*{\l@part}[2]{% [<title>,<page>]
    \ifnum \c@tocdepth >-2\relax
        \addpenalty{-\@highpenalty}%
        \addvspace{2.25em \@plus\p@}%
        \setlength\@tempdima{3em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            {\leavevmode
            \zihao{4}\sffamily #1
            \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
            \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
            \nobreak
            \global\@nobreaktrue
            \everypar{\global\@nobreakfalse\everypar{}}%
        \endgroup
    \fi
}
%- redefine l@chapter from book.cls to add dotted toc line
\renewcommand*{\l@chapter}[2]{% [<title>,<page>]
    \ifnum \c@tocdepth >\m@ne
        \addpenalty{-\@highpenalty}%
        \vskip \@chaptervspace \@plus\p@
        \setlength\@tempdima{1.5em}%
        \begingroup
            \parindent \z@ \rightskip \@pnumwidth
            \parfillskip -\@pnumwidth
            \leavevmode \zihao{4}\sffamily
            \advance\leftskip\@tempdima
            \hskip -\leftskip
            #1\nobreak
            \leaders\hbox{$\m@th\mkern \@dotsep \cdot\mkern \@dotsep$}% add dotted toc line
            \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
            \penalty\@highpenalty
        \endgroup
    \fi
}

%%%%% --------------------------------------------------------------------------------

\endinput
%% End of file
%%%%% --------------------------------------------------------------------------------
