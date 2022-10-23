# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="27662498f0bd79cc906198f3ffed9fe3836fc240"

DESCRIPTION="Wrap and call GObject Introspection FFI function in LISP style"
HOMEPAGE="https://github.com/bohonghuang/cl-gobject-introspection-wrapper"
SRC_URI="https://github.com/bohonghuang/cl-gobject-introspection-wrapper/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-gobject-introspection
	dev-lisp/cl-ppcre
"
BDEPEND=""
