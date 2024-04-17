\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{horikawa}[2024/02/17]

\LoadClass[fontsize=10.5pt,jafontsize=10.5pt]{jlreq}

\def\@maketitle{
    \newpage\null
    %\vskip 2\baselineskip
    \begin{center}%
        {
            {\LARGE \textbf{\@title} \par}
            %\vskip\baselineskip
            \ifx\@subtitle\@empty\else
            {\large \textbf{------\@subtitle ------} \par}
            \fi
        }
        %\vskip\baselineskip
        {
            %\jlreq@keepbaselineskip{\large}%
            \lineskip .5\jlreq@zh
            \begin{tabular}[t]{c} \large \textsf{\@author} \end{tabular}%
            \par
        }
    \end{center}%
    \par
    \vskip\baselineskip
    \ifvoid\jlreq@abstractbox\else\unvbox\jlreq@abstractbox\fi
}

\DeclareRobustCommand\subtitle[1]{\gdef\@subtitle{#1}}

\renewcommand{\abstractname}{\large \textbf{要旨}}

\usepackage{luatexja-fontspec}

\setmainjfont[
    YokoFeatures       = {JFM=jlreq},
    TateFeatures       = {JFM=jlreqv},
    BoldFont           = MS-Gothic,
    BoldFeatures       = {FakeBold=2},
    ItalicFont         = MS-Mincho,
    ItalicFeatures     = {FakeSlant=0.33},
    BoldItalicFont     = MS-Gothic,
    BoldItalicFeatures = {FakeBold=2, FakeSlant=0.33}
]{MS-Mincho}
\setsansjfont[
    YokoFeatures       = {JFM=jlreq},
    TateFeatures       = {JFM=jlreqv},
    BoldFont           = MS-Gothic,
    BoldFeatures       = {FakeBold=2},
    ItalicFont         = MS-Gothic,
    ItalicFeatures     = {FakeSlant=0.33},
    BoldItalicFont     = MS-Gothic,
    BoldItalicFeatures = {FakeBold=2, FakeSlant=0.33}
]{MS-Gothic}