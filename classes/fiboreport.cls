%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Author: Wuttipat Chokananatasab [Liews]
%% Date:   March 11, 2018
%% Email:  sweilz.w@gmail.com, wuttipat.sero@mail.kmutt.ac.th
%%
%% This is a LaTeX class for project report and thesis at FIBO,KMUTT
%% Credits:
%% 1) Nattee Niparnan - May 4, 2007
%% 2) Peerapon Siripongwutikorn - Dec 25, 2007
%% 3) Supasate Choochaisri - April 19, 2012
%% 4) Thanathip Limna - Nov 16, 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Identification %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fibo}[2018/03/11 A FIBO thesis class file by Liews Wuttipat]
\typeout{https://github.com/sweilz/}

\LoadClass[12pt,a4paper,oneside]{report}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Identification %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen} %% สำหรับใช้ if-else
\usepackage[utf8]{inputenc}
\usepackage{graphicx} %% สำหรับการจัดการภาพ
\usepackage{fontspec,xltxtra,xunicode,polyglossia} %% สำหรัลการสร้างเอกสารโดยใช้ Unicode
\usepackage{parskip}
\usepackage[hidelinks]{hyperref}

\graphicspath{{images/}}
\usepackage{caption}
\usepackage{subcaption}

\usepackage{setspace}
\usepackage{enumitem} %% สำหรับเรียงไอเทม
\usepackage{natbib}
\usepackage{bibentry}
\usepackage{tikz} %% สำหรับวาดแผนภาพต่างๆ
\usepackage{ulem} %% สำหรับพิมพ์ตัวเอียง ตัวขีดเส้นใต้ ตัวขีดกลาง
\usetikzlibrary{shapes,automata, positioning, arrows}
\usepackage{amsmath}

\tikzstyle{topic} = [rectangle, draw, fill=blue!20,text width=8em, text badly centered, node distance=2cm]
\tikzstyle{line} = [draw, -latex',line width=0.75mm]
\tikzstyle{node} = [draw, ellipse,fill=red!20, node distance=3cm]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% FIBO Report Template %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macro Definitions %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\quotes}[1]{``#1''}
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}

\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}

\newcommand{\@coverimage}{}
\newcommand{\coverimage}[1]{\renewcommand{\@coverimage}{#1}}

\newcommand{\@covertext}{}
\newcommand{\covertext}[1]{\renewcommand{\@covertext}{#1}}

\newcommand{\@academicyear}{2560}
\newcommand{\academicyear}[1]{\renewcommand{\@academicyear}{#1}}

\newcommand{\@Modifydate}{}
\newcommand{\Modifydate}[1]{\renewcommand{\@Modifydate}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Set Font %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\XeTeXlinebreaklocale "th_TH"
\XeTeXlinebreakskip = 0pt plus 1pt
\defaultfontfeatures{Scale=1.23,Mapping=tex-text}
\setmainfont[Mapping=tex-text]{TH Sarabun New}
\newfontfamily{\thaifont}[]{TH Sarabun New}
\setdefaultlanguage{thai}
\setotherlanguage{english}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Page layout %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{3} %% ความลึกของ section
\setcounter{tocdepth}{3} %% ความลึกของสารบัญ
\usepackage[a4paper,left=40mm,top=30mm,bottom=20mm,right=20mm]{geometry}

\usepackage{fancyhdr}

\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{
	\fancyhead{}
	\fancyhf{}
	\fancyhead[R]{\thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}

\usepackage{titlesec}
\titleformat{\chapter}[display]
{\bfseries\large}
{\filcenter\chaptertitlename\ \thechapter}
{-0.7ex} {
    \vspace{1ex}
    \centering
} 
[\vspace{1em}] 
\titlespacing{\chapter}{0pt}{-20pt}{0pt}
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\titlespacing{\subsubsection}{5mm}{0pt}{0pt}
\titlespacing{\paragraph}{10mm}{0pt}{10pt}
\titleformat{\section}[block]{\large\bfseries}{\thesection}{1ex}{}
\titleformat{\subsection}[block]{\normalfont\bfseries}{\thesubsection}{1ex}{}
\titleformat{\subsubsection}[block]{\normalfont\bfseries}{\thesubsubsection}{1ex}{}

\renewcommand*{\thesubfigure}{\thaiAlph{subfigure}}
\renewcommand*{\thesubtable}{\thaiAlph{subtable}}
\renewcommand\baselinestretch{1.2}
\setlength{\parindent}{10mm}

% ************************* Table of Contents layout **************************
\usepackage{titletoc}
\usepackage{atbegshi}
\usepackage{tocloft}
\RequirePackage[title,titletoc]{appendix}
\usepackage{floatrow}
\usepackage{float}
\floatsetup[table]{capposition=top}
\newfloat{eqa}{htbp}{eqa}\floatname{eqa}{{สมการที่}}

\newcommand{\contenttopchapter}{เรื่อง}
\newcommand{\contenttoppage}{หน้า}
\newcommand{\contenttopfigure}{รูป}
\newcommand{\contenttoptable}{ตาราง}
\newcommand{\contenttopcontinued}{~(ต่อ)}
\addto{\captionsthai}{
    \renewcommand{\contentsname}{สารบัญ} %% ชื่อรายการสารบัญ
    \renewcommand{\listtablename}{รายการตาราง} %% ชื่อรายการสารบัญตาราง
    \renewcommand{\listfigurename}{รายการรูปภาพ} %% ชื่อรายการสารบัญรูป
    \renewcommand{\appendixname}{ภาคผนวก}		
    \renewcommand{\contenttopchapter}{เรื่อง}
    \renewcommand{\contenttoppage}{หน้า}
    \renewcommand{\contenttopfigure}{รูป}
    \renewcommand{\contenttoptable}{ตาราง}
    \renewcommand{\contenttopcontinued}{~(ต่อ)}
}
\titlecontents{chapter}% <section-type>
	[0pt]% <left>
	{}% <above-code>
	{\bfseries\chaptername\ \thecontentslabel\quad}% <numbered-entry-format>
	{\bfseries\thecontentslabel}% <numberless-entry-format>
	{\bfseries\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>

\titlecontents{section}% <section-type>
	[25pt]% <left>
	{}% <above-code>
	{\thecontentslabel\quad}% <numbered-entry-format>
	{\thecontentslabel}% <numberless-entry-format>
	{\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>

\titlecontents{subsection}% <section-type>
	[50pt]% <left>
	{}% <above-code>
	{\thecontentslabel\quad}% <numbered-entry-format>
	{\thecontentslabel}% <numberless-entry-format>
	{\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>

\titlecontents{subsubsection}% <section-type>
	[65pt]% <left>
	{}% <above-code>
	{\thecontentslabel\quad}% <numbered-entry-format>
	{\thecontentslabel}% <numberless-entry-format>
	{\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>

\titlecontents{figure}% <section-type>
	[0pt]% <left>
	{}% <above-code>
	{\figurename\ \thecontentslabel~}% <numbered-entry-format>
	{\figurename}% <numberless-entry-format>
	{\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>

\titlecontents{table}% <section-type>
	[0pt]% <left>
	{}% <above-code>
	{\tablename\ \thecontentslabel~}% <numbered-entry-format>
	{\tablename}% <numberless-entry-format>
    {\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>

\AtBeginDocument{
	\setlength{\parskip}{1ex}
	\setlength{\baselineskip}{1.25em}
	\setcounter{tocdepth}{4}

	\renewcommand{\tableofcontents}{
		\cleardoublepage
		\begingroup
		\parindent\z@\parskip\cftparskip
		\FIBOContentsHeader{\contentsname}{}{\contenttopchapter}{\contenttoppage}
		\addcontentsline{toc}{chapter}{\contentsname}
		\@starttoc{toc}
		\endgroup
	}

	\renewcommand{\listoftables}{
		\cleardoublepage
		\begingroup
		\parindent\z@\parskip\cftparskip
		\FIBOContentsHeader{\listtablename}{}{\contenttoptable}{\contenttoppage}
		\addcontentsline{toc}{chapter}{\listtablename}
		\@starttoc{lot}
		\endgroup
	}

	\renewcommand{\listoffigures}{
		\cleardoublepage
		\begingroup
		\parindent\z@\parskip\cftparskip
		\FIBOContentsHeader{\listfigurename}{}{\contenttopfigure}{\contenttoppage}
		\addcontentsline{toc}{chapter}{\listfigurename}
		\@starttoc{lof}
		\endgroup
	}
}

\AtEndDocument{
}

\newcommand{\FIBOContentsHeader}[4]{
	\chapter*{#1#2} \noindent #3 \hfill #4\par\kern.5\baselineskip
}

\newcommand{\FIBOContentsHeaderContinued}{\FIBOContentsHeader{\contentsname}{\contenttopcontinued}{\contenttopchapter}{\contenttoppage}}
\newcommand{\FIBOtableofcontents}{
	\AtBeginShipout{\FIBOContentsHeaderContinued}
	\tableofcontents
	\renewcommand{\FIBOContentsHeaderContinued}{}
}

\newcommand{\FIBOLotHeaderContinued}{\FIBOContentsHeader{\listtablename}{\contenttopcontinued}{\contenttoptable}{\contenttoppage}}
\newcommand{\FIBOlistoftables}{
	\AtBeginShipout{\FIBOLotHeaderContinued}
	\listoftables
	\renewcommand{\FIBOLotHeaderContinued}{}
}

\newcommand{\FIBOLofHeaderContinued}{\FIBOContentsHeader{\listfigurename}{\contenttopcontinued}{\contenttopfigure}{\contenttoppage}}
\newcommand{\FIBOlistoffigures}{
	\AtBeginShipout{\FIBOLofHeaderContinued}
	\listoffigures
	\renewcommand{\FIBOLofHeaderContinued}{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Cover Page %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{tudelft-cyan}{cmyk}{1,0,0,0}
\definecolor{tudelft-black}{cmyk}{0,0,0,1}
\definecolor{tudelft-white}{cmyk}{0,0,0,0}
\definecolor{tudelft-sea-green}{cmyk}{0.54,0,0.32,0}
\definecolor{tudelft-green}{cmyk}{1,0.15,0.4,0}
\definecolor{tudelft-dark-blue}{cmyk}{1,0.66,0,0.4}
\definecolor{tudelft-purple}{cmyk}{0.98,1,0,0.35}
\definecolor{tudelft-turquoise}{cmyk}{0.82,0,0.21,0.08}
\definecolor{tudelft-sky-blue}{cmyk}{0.45,0,0.06,0.06}
\definecolor{tudelft-lavender}{cmyk}{0.45,0.2,0,0.07}
\definecolor{tudelft-orange}{cmyk}{0.02,0.56,0.84,0}
\definecolor{tudelft-warm-purple}{cmyk}{0.58,1,0,0.02}
\definecolor{tudelft-fuchsia}{cmyk}{0.19,1,0,0.19}
\definecolor{tudelft-bright-green}{cmyk}{0.36,0,1,0}
\definecolor{tudelft-yellow}{cmyk}{0.02,0,0.54,0}
\definecolor{tudelft-blue}{cmyk}{1,0.40,0,0}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Title Page %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newlength\@cover@margin
\setlength\@cover@margin{12pt}
\newlength\@cover@splitboxwidth
\setlength\@cover@splitboxwidth{6.375in}
\newlength\@cover@splitboxheight
\setlength\@cover@splitboxheight{0.5\paperheight}
\newlength\@cover@fronttextwidth
\newlength\@cover@fronttextheight
\renewcommand{\maketitle}{\makeFIBOthesistitle}
\newcommand{\makeFIBOthesistitle}
{
	\newgeometry{margin=0pt}
	\thispagestyle{empty}
	\begin{tikzpicture}[remember picture,overlay]
		\node at (current page.west)[anchor=north west,inner sep=0pt] {
			\includegraphics[width=\paperwidth]{\@coverimage}};
		\node at (current page.south west)[anchor=south west,inner sep=20pt]{
			\includegraphics{classes/fibo_logo.jpeg}};
		\setlength\@cover@fronttextwidth{\@cover@splitboxwidth}
        \addtolength\@cover@fronttextwidth{+10\@cover@margin}
		\setlength\@cover@fronttextheight{\@cover@splitboxheight}
		\addtolength\@cover@fronttextheight{-4\@cover@margin}
		
        \node at (current page.north west)[anchor=north west,inner sep=3\@cover@margin]{
			\begin{minipage}[t][\@cover@fronttextheight]{\@cover@fronttextwidth}
				{\color{tudelft-white}\fontsize{32}{35}\selectfont\textbf{REPORT}
				\fontsize{16}{16}\selectfont\textbf\@Modifydate}
				% {\color{tudelft-white}\fontsize{23}{23}\selectfont\textbf\@subject}
				\vspace{5pt} \\
				{\color{tudelft-white}\fontsize{23}{23}\selectfont\textbf\@subject}
				\vfill
				\vfill
				{\color{tudelft-black}\fontsize{40}{40}\selectfont\textbf\@title}
				\\
				\vspace{5pt}
				{\color{tudelft-black}\fontsize{30}{30}\selectfont\textbf\@subtitle}
				\vfill
				\vfill
				{\color{tudelft-white}\fontsize{22}{22}\selectfont\textbf{Member}}
				\vspace{5pt} \\
				{\color{tudelft-white}\fontsize{18}{18}\selectfont\@covertext}
				\vfill
				{\color{tudelft-white}\fontsize{22}{22}\selectfont\textbf{Insitude of Field Robotics, KMUTT}}
			\end{minipage}
		};
	\end{tikzpicture}
	\restoregeometry
	\pagecolor{white}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Thesis Abstract %%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{abstract}{
\cleardoublepage
\setcounter{page}{1}
\begin{onehalfspacing}
\begin{flushleft}
    \begin{tabular*}{\textwidth}{@{}p{.17\textwidth}p{.70\textwidth}@{}}
		\textbf{ชื่อหัวข้อ}& {\@title} \\
		{} & {\@subtitle}\\
        \textbf{รายวิชา} & {\@subject}\\
		\textbf{สาขาวิชา}& {วิศวกรรมหุ่นยนต์และระบบอัตโนมัติ} \\
		\textbf{คณะ}& {สถาบันวิทยาการหุ่นยนต์ภาคนาม} \\
		\textbf{สถาบัน}& {มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี} \\
		\textbf{ปีการศึกษา}& \@academicyear \\
    \end{tabular*}
\end{flushleft}
\end{onehalfspacing}
\hrule height .7pt
\vspace{2em}
\begingroup
	\let\clearpage\relax
	\chapter*{บทคัดย่อ}
	\addcontentsline{toc}{chapter}{บทคัดย่อ}
\endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Abbreviations and Symbols  %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{abbreviations}
{
    \cleardoublepage
    \onecolumn
    \chapter*{\centering ประมวลศัพท์และตัวย่อ}
    \addcontentsline{toc}{chapter}{ประมวลศัพท์และตัวย่อ}
    \begingroup
    }{
    \vfill
	\endgroup
}

\newenvironment{symbols}
{
    \cleardoublepage
    \onecolumn
    \chapter*{\centering รายการสัญลักษณ์}
    \addcontentsline{toc}{chapter}{รายการสัญลักษณ์}
    \begingroup
    }{
    \vfill
    \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Appendices  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{lipsum}
\renewenvironment{appendices}
{
    \cleardoublepage
    \clearpage\thispagestyle{empty}\addtocounter{page}{-1}
    \vspace*{\fill}
    \begin{center}
        {\bfseries\Huge \appendixname}
    \end{center}
    \vspace*{\fill}
	\appendix
	\renewcommand{\thechapter}{\thaiAlph{chapter}}
	
	\titlecontents{chapter}% <section-type>
  		[0pt]% <left>
  		{}% <above-code>
  		{\bfseries\appendixname\ \thecontentslabel\quad}% <numbered-entry-format>
  		{\bfseries\thecontentslabel}% <numberless-entry-format>
  		{\bfseries\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

