# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit elisp-common eutils
RESTRICT="mirror"

SUBVERSION_REVISION="r=${PV}"
DESCRIPTION="The google styleguide for C++ together with a verifyer and an emacs file"
HOMEPAGE="http://code.google.com/p/google-styleguide/"
SRC_URI="http://google-styleguide.googlecode.com/svn/trunk/cppguide.xml?${SUBVERSION_REVISION} -> cpplint-${PV}.xml
											       http://google-styleguide.googlecode.com/svn/trunk/cpplint/cpplint.py?${SUBVERSION_REVISION} -> cpplint-${PV}.py
											       http://google-styleguide.googlecode.com/svn/trunk/cpplint/README?${SUBVERSION_REVISION} -> cpplint-${PV}.txt
											       emacs? ( http://google-styleguide.googlecode.com/svn/trunk/google-c-style.el?${SUBVERSION_REVISION} -> cpplint-${PV}.el )"
LICENSE="CC-BY-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="emacs"

EMACSNAME="google-c-style"
COMMON="emacs? ( virtual/emacs )"
DEPEND="${COMMON}"
RDEPEND="dev-lang/python
	${COMMON}"

S="${WORKDIR}"

src_unpack() {
	     cp -- "${DISTDIR}/cpplint-${PV}.xml" cppguide.xml || die
	     cp -- "${DISTDIR}/cpplint-${PV}.py" cpplint.py || die
	     cp -- "${DISTDIR}/cpplint-${PV}.txt" README || die
	     if use emacs
	     then   cp -- "${DISTDIR}/cpplint-${PV}.el" "${EMACSNAME}.el" || die
	     	    mkdir sitefile
		    	  cat >"sitefile/50${EMACSNAME}-gentoo.el" <<EOF
(add-to-list 'load-path "@SITELISP@")
(autoload 'google-set-c-style "${EMACSNAME}"
  "Set the current buffer's c-style to Google C/C++ Programming
  Style. Meant to be added to \`c-mode-common-hook'." t)
(add-hook 'c-mode-common-hook 'google-set-c-style)

; If you want the RETURN key to go to the next line and space over
; to the right place, uncomment the following line
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)
EOF
	fi
}

src_prepare() {
	      epatch_user
}

src_compile() {
	      if use emacs
	      then   elisp-compile *.el || die
	      fi
}

src_install() {
	      dobin cpplint.py
	      dodoc README cppguide.xml
	      if use emacs
	      then   elisp-install "${EMACSNAME}" "${EMACSNAME}".{el,elc} || die
	      	     elisp-site-file-install "sitefile/50${EMACSNAME}-gentoo.el" "${EMACSNAME}" || die
		     fi
}

pkg_postinst() {
	       elisp-site-regen
}

pkg_postrm() {
	     elisp-site-regen
}

