%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 堀川高校版論文の形式
% 2023年度版に則り作成。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{horikawa}[2024/02/17]

% jlreqクラスを基底に使用。
% フォントサイズは10.5P
\LoadClass[
    fontsize=10.5pt,
    jafontsize=10.5pt,
    head_space=20mm, foot_space=25mm, gutter=25mm, fore-edge=25mm
]{jlreq}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% フォントの設定

\usepackage{luatexja-fontspec}
\setmainfont[
    BoldFont           = MS-Gothic,
    BoldFeatures       = {FakeBold=2},
    ItalicFont         = MS-Mincho,
    ItalicFeatures     = {FakeSlant=0.33},
    BoldItalicFont     = MS-Gothic,
    BoldItalicFeatures = {FakeBold=2, FakeSlant=0.33}
]{MS-Mincho}
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

% フォントサイズの設定
\renewcommand\small{\@setfontsize\small{9bp}{12bp}}
\renewcommand\normalsize{\@setfontsize\normalsize{10.5bp}{15bp}}
\renewcommand\large{\@setfontsize\large{12bp}{15bp}}
\renewcommand\Large{\@setfontsize\Large{14bp}{16bp}}
\renewcommand\LARGE{\@setfontsize\LARGE{18bp}{20bp}}

% 行間の設定
\renewcommand{\baselinestretch}{1.2}

% 図表のキャプションのフォントサイズ
\usepackage{caption}
\captionsetup[figure]{format=plain, labelformat=simple, font={small,bf}}
\captionsetup[table]{format=plain, labelformat=simple, font={small,bf}}
\captionsetup[lstlisting]{format=plain, labelformat=simple, font={small,bf}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% タイトルの設定
\def\@maketitle{
    \newpage\null
    \begin{center}%
        {
            {\LARGE \textbf{\@title} \par}
        }
        {
            \begin{tabular}[t]{c} \large \textsf{\@author} \end{tabular}%
            \par
        }
    \end{center}%
    \par
    \vskip\baselineskip
}

\renewcommand{\thanks}[1]{(#1)}

% 要旨
\renewcommand{\abstractname}{\large \textbf{要旨}}
\renewenvironment{abstract}{
\begin{center}
    \abstractname
\end{center}


}{\vskip\baselineskip}

% 副題設定用のコマンド
\usepackage{etoolbox}
\makeatletter
\providecommand{\subtitle}[1]{% add subtitle to \maketitle
	\apptocmd{\@title}{\\\large \textbf{――#1――} \par}{}{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 見出しの設定
\RenewBlockHeading{section}{1}{%
    font={\Large\bfseries},
    after_label_space=0.5em,
    label_format={\thesection.}
}
\RenewBlockHeading{subsection}{1}{%
    font={\normalsize\bfseries},
    after_label_space=0.5em,
    label_format={\thesubsection}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 読点「、」を全角カンマ「，」に置換
\usepackage{luacode,luatexbase}
\begin{luacode}
local function zenkakuToComma (line)
  line = string.gsub(line, "、", "，")
  line = string.gsub(line, "（", "(")
  line = string.gsub(line, "）", ")")
  return line
end
luatexbase.add_to_callback( "process_input_buffer",  zenkakuToComma, "zenkaku_to_comma")
\end{luacode}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 出力するPDFにハイパーリンクを効かせる
\usepackage[hidelinks]{hyperref}
% 参考文献のスタイルを変更
\renewcommand{\refname}{\normalsize\\ 参考文献}