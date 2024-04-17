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