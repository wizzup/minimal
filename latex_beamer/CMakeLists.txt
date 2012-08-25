cmake_minimum_required(VERSION 2.8)

# # finding latex 
# find_package(LATEX REQUIRED)
# 
# 
# ## LATEX_COMPILER:       path to the LaTeX compiler
# ## PDFLATEX_COMPILER:    path to the PdfLaTeX compiler
# ## BIBTEX_COMPILER:      path to the BibTeX compiler
# ## MAKEINDEX_COMPILER:   path to the MakeIndex compiler
# ## DVIPS_CONVERTER:      path to the DVIPS converter
# ## PS2PDF_CONVERTER:     path to the PS2PDF converter
# ## LATEX2HTML_CONVERTER: path to the LaTeX2Html converter
# 
# ## make pdf file
# message(using @PDFLATEX_COMPILER@)

include(UseLATEX.cmake)

ADD_LATEX_DOCUMENT(beamer.tex DEFAULT_PDF)
#                  [USE_INDEX] [USE_GLOSSARY] [USE_NOMENCL]
#                  [DEFAULT_PDF] [DEFAULT_SAFEPDF]
#                  [MANGLE_TARGET_NAMES])
#
