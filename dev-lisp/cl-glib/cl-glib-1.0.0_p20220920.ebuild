# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="1c33f1f024be993d0425d3ab59092bea0a486552"

DESCRIPTION="GLib binding for Common Lisp"
HOMEPAGE="https://github.com/bohonghuang/cl-glib"
SRC_URI="https://github.com/bohonghuang/cl-glib/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-gobject-introspection-wrapper
	dev-lisp/bordeaux-threads
"
BDEPEND=""
