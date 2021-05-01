# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit common-lisp-3

DESCRIPTION="Common Lisp macros for generating lexical analyzers automatically"
HOMEPAGE="https://code.google.com/p/cl-lex"
SRC_URI="https://cl-lex.googlecode.com/files/cl-lex_${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-lisp/cl-ppcre
"

S="${WORKDIR}"/${PN}
