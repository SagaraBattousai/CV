% intro options
\ProvidesClass{resume-knyte}[2017/08/02 resume class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}
\pagenumbering{gobble}
\setlength{\topsep}{0pt}
\setlength{\partopsep}{0pt}
\setlength{\parskip}{0pt}

% Misc. package Imports
\usepackage[hmargin=0.4in, vmargin=0.4in]{geometry}
\usepackage{verbatim} % to enable multiline comments
\usepackage[hidelinks]{hyperref}

% Table setup
\usepackage{tabularx,tabulary}
\newcolumntype{s}{>{\raggedright\hsize=2\hsize}l} % section column

% Color definitions
\usepackage[usenames, dvipsnames]{xcolor} 
% \definecolor{NAME}{HTML}{HEXHEX}
\definecolor{primary}{HTML}{000000}

% Set main fonts
\usepackage{fontspec}
% extra-explicit below for ease of editing later
\setmainfont[Color=primary,
             Scale=MatchLowercase,
             Ligatures=TeX,
             Path=resources/fonts/PT_Sans/,
             BoldItalicFont=PT_Sans-Web-BoldItalic,
             BoldFont=PT_Sans-Web-Bold,
             ItalicFont=PT_Sans-Web-Italic]{PT_Sans-Web-Regular}
\setsansfont[Color=primary,
             Scale=MatchLowercase,
             Ligatures=TeX,
             Path=resources/fonts/Muli/,
             BoldItalicFont=Muli-BoldItalic,
             BoldFont=Muli-Bold,
             ItalicFont=Muli-Italic]{Muli-Light}

% Commands
%% variables
%%% entryspace
\newcommand{\entryspace}{6pt}

%%% labeltab
\newcommand{\labeltab}{1.5in}

%%% datetab
\newcommand{\datetab}{6.2in}

%%% desctab - description tab
\newcommand{\desctab}{6.05in}

%%% section header
\newcommand{\sechead}[1]{
    \fontsize{9pt}{12pt}
    \fontspec[Path=resources/fonts/Muli/]{Muli-Bold}\selectfont #1
}

%%% section subheader
\newcommand{\secsub}[1]{
    \fontsize{10pt}{12pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Bold}\selectfont #1
}

%% makeheader
\newcommand{\makeheader}[1]{
	\centering{
		\color{primary}
		\fontsize{40pt}{48pt}
		\fontspec[Path=resources/fonts/Muli/]{Muli-Regular}\selectfont #1
        \\[0.2ex]
	}
}

%% entry
\newcommand{\entry}[4]{
    \>\secsub{#1} \> \content{#2} \' \\
    \>\shortdesc{#3}\\[\entryspace]
    \>\ 
    \begin{minipage}{\desctab}
    \content{#4} \\
    \end{minipage}\\
}

% Environments
%% entrytab - tabbing with modified spacing
\newenvironment{entrytab}{
    \setlength{\topsep}{2pt}%
    \setlength{\partopsep}{0pt}%
    \tabbing
}{
    \endtabbing
}

%% subheader
\newenvironment{subheader}[1]{
     \centering
     \hrulefill\\[1ex]
}{
     \hrulefill\\[1ex]
}

%% topic
\newenvironment{topic}[1]{
    \begin{entrytab}
        \hspace*{\labeltab}\= \hspace*{\datetab}\= \kill
        \sechead{#1}
}{
    \end{entrytab}
}

%My Commands
\newcommand{\headDetail}[2]{
    \fontsize{9pt}{12pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Bold}\selectfont
    \fontsize{10pt}{10pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Regular}\selectfont
    \ifthenelse{\equal{#2}{}}
    {#1}{\href{#2}{#1}}
}

\newcommand{\BulletSymbol}{{\char"2022}}
\newcommand{\TildeSymbol}{{\char"007E}}

%% entry
\newcommand{\elementStart}[6]{
    \>\headding{#1}{#2} \location{#5} \hfill \dates{#3}{#4}
    %\>\headding{#1}{#2} \dates{#3}{#4}\\
    %\>\location{#5}
    \ifthenelse{\equal{#6}{}}
    {}{\\ \>\subHeadding{#6}}
    \\ [\entryspace]
}

\newcommand{\headding}[2]{
    \fontsize{10pt}{12pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Bold}\selectfont
    \ifthenelse{\equal{#2}{}}
    {#1}{\href{#2}{#1}}
}

\newcommand{\dates}[2]{
    \fontsize{8pt}{10pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Regular}\selectfont {#1} - {#2}
}

\newcommand{\location}[1]{
    \fontsize{8pt}{10pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Regular}\selectfont #1
}

\newcommand{\subHeadding}[1]{
    \fontsize{8.5pt}{11pt}
    \fontspec[Path=resources/fonts/PT_Sans/]
    {PT_Sans-Web-Regular}\selectfont #1
    }

\newcommand{\details}{
    \fontsize{8.5pt}{11pt}
    \fontspec[Path=resources/fonts/PT_Sans/]{PT_Sans-Web-Regular}\selectfont
}

\newcommand{\detail}[1]{  
    \>
    \begin{minipage}{\desctab}
    \details{#1} \hfill \break
    \end{minipage}\\
}

\newcommand{\BulletItem}{\par%
\noindent\hangafter=1\hangindent=1.55em\ignorespaces%
\hspace{0.8em}\BulletSymbol\hspace{0.4em}\ignorespaces}

\newcommand{\awardSet}[3]{
    \> 
    \ifthenelse{\equal{#3}{}}
    {\details{#1: #2}}
    {\details{#1: #2 (#3)}}
    \\
}

\newcommand{\skillTitle}[1]{
	\> \textbf{#1} \\
}

\newcommand{\skillItem}[1]{
	\> \BulletItem #1 \\
}

\newcommand{\comm}[2]{
	\> \textbf{#1} - #2.\\
}

\newcommand{\proj}[5]{
 	\>\headding{#1}{#2} \location{#5} \hfill\dates{#3} {#4} \\
}























