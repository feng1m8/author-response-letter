% An article class for author response to reviewer comment.
% Copyright (C) 2017 Martin Schroen
% Modifications Copyright (C) 2020 Kaishuo Zhang
% Further Modifications Copyright (C) 2022 Hayato Itoh
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ar2rc}[2020/08/04 Author response to reviewer comment class]
\LoadClass[11pt]{article}

\RequirePackage[includeheadfoot,top=20mm, bottom=20mm, left=44mm, right=32mm, footskip=2.5cm]{geometry}

% Typography
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
%\RequirePackage{mathptmx} % math also in times font
\RequirePackage{amssymb,amsmath}
\RequirePackage{microtype}
\RequirePackage[utf8]{inputenc}

% Misc
\RequirePackage{graphicx}
\RequirePackage{hyperref} 
\RequirePackage{soul} % Highlight using \hl{}

% Table
\RequirePackage{adjustbox} % center large tables across textwidth by surrounding tabular with \begin{adjustbox}{center}
\renewcommand{\arraystretch}{1.5} % enlarge spacing between rows
\RequirePackage{caption} 
\captionsetup[table]{skip=10pt} % enlarge spacing between caption and table

% Section styles
\RequirePackage{titlesec}
\titleformat{\section}{\normalfont\large}{\makebox[0pt][r]{\bf \thesection.\hspace{4mm}}}{0em}{\bfseries}
\titlespacing{\section}{0em}{4.0em}{-1.2em} 
\titleformat{\subsection}{\normalfont}{\makebox[0pt][r]{\bf \thesubsection.\hspace{4mm}}}{0em}{\bfseries}
\titlespacing{\subsection}{0em}{0.0em}{0.0em} % left before after

% Paragraph styles
\setlength{\parskip}{0.6\baselineskip}%
\setlength{\parindent}{0pt}%

% Quotation styles
\RequirePackage{mdframed}
\renewmdenv[leftmargin=0.4em, rightmargin=0.4em%
innerleftmargin=0.6em,innerrightmargin=0.6em, linewidth=1pt]{quote}

% Table styles
\let\oldtabular=\tabular
\let\endoldtabular=\endtabular
\renewenvironment{tabular}[1]{\begin{adjustbox}{center}\begin{oldtabular}{#1}}{\end{oldtabular}\end{adjustbox}}

% Shortcuts
%% Let textbf be both, bold and italic
%\DeclareTextFontCommand{\textbf}{\bfseries\em}

%% Add RC and AR to the left of a paragraph
%\def\RC{\makebox[0pt][r]{\bf RC:\hspace{4mm}}}
%\def\AR{\makebox[0pt][r]{AC:\hspace{4mm}}}

% New counter for Comments
\newcounter{CntRComment}[section]
%\setcounter{CntRComment}{0}
\newcommand{\CommentNum}{
   \ifnum\theCntRComment<1 \stepcounter{CntRComment}\fi
   \theCntRComment
   \stepcounter{CntRComment}
}

%% Define that \RC and \AR should start and format the whole paragraph 
\RequirePackage{suffix}
\long\def\RC#1\par{\makebox[0pt][r]{\bf Comment \CommentNum:\hspace{4mm}}\textbf{\textit{#1}}\par} %\RC
\WithSuffix\long\def\RC*#1\par{\textbf{\textit{#1}}\par} %\RC*
\long\def\AR#1\par{\makebox[0pt][r]{Response:\hspace{4mm}}#1\par} %\AR
\WithSuffix\long\def\AR*#1\par{#1\par} %\AR*



%%%
%DIF PREAMBLE EXTENSION ADDED BY LATEXDIFF
%DIF UNDERLINE PREAMBLE %DIF PREAMBLE
\RequirePackage[normalem]{ulem} %DIF PREAMBLE
\RequirePackage{xcolor} %DIF PREAMBLE
\providecommand{\DIFadd}[1]{{\protect\color{blue}\uwave{#1}}} %DIF PREAMBLE
\providecommand{\DIFdel}[1]{{\protect\color{red}\sout{#1}}}                      %DIF PREAMBLE
%DIF SAFE PREAMBLE %DIF PREAMBLE
\providecommand{\DIFaddbegin}{} %DIF PREAMBLE
\providecommand{\DIFaddend}{} %DIF PREAMBLE
\providecommand{\DIFdelbegin}{} %DIF PREAMBLE
\providecommand{\DIFdelend}{} %DIF PREAMBLE
%DIF FLOATSAFE PREAMBLE %DIF PREAMBLE
\providecommand{\DIFaddFL}[1]{\DIFadd{#1}} %DIF PREAMBLE
\providecommand{\DIFdelFL}[1]{\DIFdel{#1}} %DIF PREAMBLE
\providecommand{\DIFaddbeginFL}{} %DIF PREAMBLE
\providecommand{\DIFaddendFL}{} %DIF PREAMBLE
\providecommand{\DIFdelbeginFL}{} %DIF PREAMBLE
\providecommand{\DIFdelendFL}{} %DIF PREAMBLE
%DIF END PREAMBLE EXTENSION ADDED BY LATEXDIFF

% Define title defaults if not defined by user
\providecommand{\lettertitle}{Authors' Responses to Reviews}
\let\@journal\@empty
\let\@doi\@empty
\newcommand{\journal}[1]{\gdef\@journal{#1}}
\newcommand{\doi}[1]{\gdef\@doi{#1}}

% Make title and legend
\renewcommand\maketitle{
{\LARGE\bf \lettertitle}\\[1em]
{\large \@title}\\[1em]
%{\@author}\\
%{\it \@journal, }\texttt{\@doi}\\
%\hrule
%\hfill {\bfseries RC:} \textbf{\textit{Reviewers' Comment}},\(\quad\) AR: Authors' Response, \(\quad\square\) Manuscript Text
}
