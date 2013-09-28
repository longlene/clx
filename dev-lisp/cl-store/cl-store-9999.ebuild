# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit common-lisp-3 eutils git-2

DESCRIPTION="CL-STORE is a Common Lisp library for serializing and deserializing Common Lisp objects."
HOMEPAGE="http://common-lisp.net/project/cl-store/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/skypher/cl-store.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE="doc"

DEPEND="sys-apps/texinfo
		doc? ( virtual/texi2dvi )"

#src_compile() {
#	cd doc
#	makeinfo ${PN}.texi -o ${PN}.info || die "Cannot build info docs"
#	if use doc ; then
#		VARTEXFONTS="${T}"/fonts \
#			texi2pdf ${PN}.texi -o ${PN}.pdf || die "Cannot build PDF docs"
#	fi
#}

