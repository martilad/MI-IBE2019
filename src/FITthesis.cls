\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FITthesis}[2013/05/06 CTU FIT standard class for theses]

% created by Ondrej Guth <ondrej.guth@fit.cvut.cz>

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% options
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
\newif\if@thesistypedefined
\DeclareOption{thesis=B}{\gdef\@thesistype{B}\@thesistypedefinedtrue}
\DeclareOption{thesis=M}{\gdef\@thesistype{M}\@thesistypedefinedtrue}

\DeclareOption{czech}{
	\AtBeginDocument{\selectlanguage{czech}}
	\PassOptionsToPackage{\CurrentOption}{babel}
	\def\@lang{1}
}
\DeclareOption{english}{
	\AtBeginDocument{\selectlanguage{UKenglish}}
	\PassOptionsToPackage{UKenglish}{babel}
	\def\@lang{0}
}
\DeclareOption{slovak}{
	\AtBeginDocument{\selectlanguage{slovak}}
	\PassOptionsToPackage{\CurrentOption}{babel}
	\def\@lang{2}
}
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{memoir}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{memoir}}

\ExecuteOptions{11pt}
\ProcessOptions

\ifx\@lang\undefined
	\ClassError{FITthesis}{Language not specified}{Add option czech for Czech language or option english for English language or option slovak for Slovak language.}
\fi

\LoadClass[a4paper,twoside]{memoir}[2008/08/07]
\setsecnumdepth{subsubsection}
\chapterstyle{madsen}

\RequirePackage{babel}[2008/07/06]
\RequirePackage{hyperref}

\RequirePackage{chngcntr}
\counterwithout*{footnote}{chapter}

\if\@lang1
	\RequirePackage[T1]{fontenc}
	\RequirePackage{lmodern}
\else
	\if\@lang2
		\RequirePackage[T1]{fontenc}
		\RequirePackage{lmodern}
	\else
		\AtBeginDocument{\selectlanguage{UKenglish}}
	\fi
\fi

\setlrmargins{4cm}{*}{*}\checkandfixthelayout

\RequirePackage{etoolbox}

\AtEndEnvironment{table}{\gdef\there@is@a@table{}}
\AtEndDocument{\ifdefined\there@is@a@table\label{tab:was:used:in:doc}\fi}
\DeclareRobustCommand{\listoftablescond}{\@ifundefined{r@tab:was:used:in:doc}{}{\listoftables*}}

% line breaks in URL
\def\UrlBreaks{\do\/\do\-}

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% general commands
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\DeclareRobustCommand{\chapterstyletitle}[1]{
	\@makechapterhead{#1}
	\noindent
}

\newenvironment{introduction}{
	\setsecnumdepth{part}
	\if\@lang1\chapter{{\' U}vod}\else\if\@lang2\chapter{{\' U}vod}\else\chapter{Introduction}\fi\fi
}{
	\setsecnumdepth{subsubsection}
}

\newenvironment{conclusion}{
	\setsecnumdepth{part}
	\if\@lang1\chapter{Z{\' a}v{\v e}r}\else\if\@lang2\chapter{Z{\' a}ver}\else\chapter{Conclusion}\fi\fi
}{
	\setsecnumdepth{subsubsection}
}

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% template
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %

\newif\if@departmentdefined
\DeclareRobustCommand{\department}[1]{
	\def\thedepartment{#1}
	\@departmentdefinedtrue
}

\newif\if@acknowledgementsdefined
\DeclareRobustCommand{\acknowledgements}[1]{
	\def\theacknowledgements{#1}
	\@acknowledgementsdefinedtrue
}

\newif\if@abstractcsdefined
\DeclareRobustCommand{\abstractCS}[1]{
	\def\theabstractcs{#1}
	\@abstractcsdefinedtrue
}

\newif\if@abstractendefined
\DeclareRobustCommand{\abstractEN}[1]{
	\def\theabstracten{#1}
	\@abstractendefinedtrue
}

\newif\if@cityfordeclarationdefined
\DeclareRobustCommand{\placeForDeclarationOfAuthenticity}[1]{
	\def\thecityfordeclaration{#1}
	\@cityfordeclarationdefinedtrue
}

\newif\if@keywordscsdefined
\DeclareRobustCommand{\keywordsCS}[1]{
	\def\thekeywordscs{#1}
	\@keywordscsdefinedtrue
}

\newif\if@keywordsendefined
\DeclareRobustCommand{\keywordsEN}[1]{
	\def\thekeywordsen{#1}
	\@keywordsendefinedtrue
}

\newif\if@authorwithdegreesdefined
\DeclareRobustCommand{\authorWithDegrees}[1]{
	\def\theauthorwithdegrees{#1}
	\@authorwithdegreesdefinedtrue
}

\newif\if@authorGNdefined
\DeclareRobustCommand{\authorGN}[1]{
	\def\theauthorGN{#1}
	\@authorGNdefinedtrue
}

\newif\if@authorFNdefined
\DeclareRobustCommand{\authorFN}[1]{
	\def\theauthorFN{#1}
	\@authorFNdefinedtrue
}

%\DeclareRobustCommand{\thesistype}{\if@thesistypedefined\if\@thesistype B\if\@lang1{Bakal{\' a}{\v r}sk{\' a} pr{\' a}ce}\else\if\@lang2{Bakal{\' a}rska pr{\' a}ca}\else{Bachelor's thesis}\fi\fi\else\if\@thesistype M
\DeclareRobustCommand{\thesistype}{\if@thesistypedefined\if\@thesistype B\if\@lang1{Semestr{\' a}ln{\' i} pr{\' a}ce}\else\if\@lang2{Bakal{\' a}rska pr{\' a}ca}\else{Bachelor's thesis}\fi\fi\else\if\@thesistype M
\if\@lang1{Diplomov{\' a} pr{\' a}ce}\else\if\@lang2{Diplomov{\' a} pr{\' a}ca}\else{Master's thesis}\fi\fi\else\ClassError{FITthesis}{Thesis type not specified}{Add option thesis=B for bachelor's thesis or option thesis=M for master's thesis.}\fi\fi\else\ClassError{FITthesis}{Thesis type not specified}{Add option thesis=B for bachelor's thesis or option thesis=M for master's thesis.}\fi}

\DeclareRobustCommand{\titlepage}{
	\begin{titlingpage}
		\begin{center}
			\noindent\begin{tabular*}{\textwidth}{m{.77\textwidth}m{.165\textwidth}}
				{\large\scshape \if\@lang1{
						{\v C}esk{\' e} vysok{\' e} u{\v c}en{\' i} technick{\' e} v~Praze
					}\else\if\@lang2{
						{\v C}esk{\' e} vysok{\' e} u{\v c}en{\' i} technick{\' e} v~Praze
					}\else{
						Czech Technical University in Prague
					}\fi\fi
					
					\vspace{3mm}
					
					\if\@lang1{
						Fakulta informa{\v c}n{\' i}ch technologi{\' i}
					}\else\if\@lang2{
						Fakulta informa{\v c}n{\' i}ch technologi{\' i}
					}\else{
						Faculty of Information Technology
					}\fi\fi
					
					\vspace{4mm}
					
					\if@departmentdefined
						\thedepartment
					\else
						\ClassError{FITthesis}{Department unspecified}{Specify the department using the \department command.}
					\fi
				} & \hfill\includegraphics[width=.16\textwidth]{../img/cvut-logo-bw}
			\end{tabular*}
		\end{center}
		

		\vfill

		{\Large
			\noindent\thesistype
		}
		\vspace{1cm}

		\if\thetitle\empty
			\ClassError{FITthesis}{Thesis' title unspecified}{Specify title of this thesis using the \protect\title\space command.}
		\else
			\noindent\textbf{\LARGE \begin{flushleft}\thetitle\end{flushleft}}
		\fi

		\vspace{4mm}

		\if@authorwithdegreesdefined
			\noindent\textbf{\Large \textit{\theauthorwithdegrees}}
		\else
			\ClassError{FITthesis}{Thesis' author with degrees unspecified}{Specify author of this thesis (i.e. your name \& degrees) using the \protect\theauthorwithdegrees\space command.}
		\fi

		\vfill

		%\noindent\if\@lang1{Vedouc{\' i} pr{\' a}ce:}\else\if\@lang2{Ved\'uci pr{\' a}ce:}\else{Supervisor:}\fi\fi
		%	\if@supervisordefined%
		%		~\thesupervisor
		%	\else
		%		\ClassError{FITthesis}{Thesis' supervisor unspecified}{Specify the supervisor of this thesis using the \protect\thesupervisor\space command.}
		%	\fi

		%\vspace{1cm}

		\noindent\today
	\end{titlingpage}
}

\DeclareRobustCommand{\acknowledgementspage}{
	\if@acknowledgementsdefined
		\cleardoublepage
		\thispagestyle{empty}
		
		~
		
		\vfill
		
		\if\@lang1\chapterstyletitle{Pod{\v e}kov{\' a}n{\' i}}\else\if\@lang2\chapterstyletitle{Po\v dakovanie}\else\chapterstyletitle{Acknowledgements}\fi\fi\theacknowledgements
	\fi
}

\DeclareRobustCommand{\declarationofauthenticitypage}{
	\cleardoublepage
	\thispagestyle{empty}

	~
	
	\vfill
		
	%\if@declarationOptionSelected
	%	\if\@lang1\chapterstyletitle{Prohl{\' a}{\v s}en{\' i}}\else\if\@lang2\chapterstyletitle{Prehl{\' a}senie}\else\chapterstyletitle{Declaration}\fi\fi\thedeclarationofauthenticity{}
	%	
	%	\vspace{2cm}

	%	\noindent
	%		\if@cityfordeclarationdefined
	%			\if\@lang1{}\else\if\@lang2{}\else{In }\fi\fi\thecityfordeclaration{} \if\@lang1{dne}\else\if\@lang2{}\else{on}\fi\fi~\today \hfill \dots\dots\dots\dots\dots\dots\dots
	%		\else
	%			\ClassError{FITthesis}{M{\' i}sto prohl{\' a}{\v s}en{\' i} nebylo zad{\' a}no}{Nastavte m{\' i}sto, kde bylo podeps{\' a}no prohl{\' a}{\v s}en{\' i}, v{\v c}etn{\v e} p{\v r}edlo{\v z}ky (nap{\v r}. V~Praze) pomoc{\' i} p{\v r}{\' i}kazu \placeForDeclaration.}
	%		\fi

	%\else
	%	\ClassError{FITthesis}{Declaration of authenticity unspecified}{Select the declaration of authenticity using the \declarationOfAuthenticityOption command.}
	%\fi
}

\DeclareRobustCommand{\imprintpage}{
	\clearpage
	\thispagestyle{empty}
	
	~
	
	\vfill
}

\DeclareRobustCommand{\abstractpage}{
	\chapter*{Abstrakt}
	\if@abstractcsdefined
		\theabstractcs
	\else
		\ClassError{FITthesis}{Abstract in Czech unspecified}{Specify abstract in Czech language using the \abstractCS command.}
	\fi

	\if@keywordscsdefined
		\paragraph*{Kl{\' i}{\v c}ov{\' a} slova} \thekeywordscs{}
	\else
		\ClassError{FITthesis}{Czech keywords unspecified}{Specify the keywords in Czech of your thesis using \keywordsCS command.}
	\fi
   \clearpage
	%\vfil

	\if@abstractendefined
		\chapterstyletitle{Abstract}\theabstracten
	\else
		\ClassError{FITthesis}{Abstract in English unspecified}{Specify abstract in English using the \abstractEN command.}
	\fi

	\if@keywordsendefined
		\paragraph*{Keywords} \thekeywordsen{}
	\else
		\ClassError{FITthesis}{English keywords unspecified}{Specify the keywords in English of your thesis using \keywordsEN command.}
	\fi
	\clearpage
}

\AfterEndPreamble{
	%\pagestyle{plain}
	%\cleardoublepage
	\titlepage
	%\setcounter{page}{5}
	%\acknowledgementspage
	%\declarationofauthenticitypage
	%\imprintpage
	\abstractpage
	%\cleardoublepage
	\tableofcontents*
	
	\clearpage
	%\listoffigures*
	%\cleardoublepage
	%\listoftablescond
	\pagestyle{ruled}
	\mainmatter
}
