# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9e52827cce1cbb3962536b6a5e628febab593f57"

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
