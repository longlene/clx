# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6e11b0d92ccf7cacee5c7f03d50148d68fe8e04d"

DESCRIPTION="GTK4/Libadwaita/WebKit bindings for Common Lisp"
HOMEPAGE="https://github.com/bohonghuang/cl-gtk4"
SRC_URI="https://github.com/bohonghuang/cl-gtk4/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	gui-libs/gtk:4
	dev-libs/gobject-introspection
	dev-lisp/bordeaux-threads
	dev-lisp/cl-gobject-introspection-wrapper
	dev-lisp/cl-glib
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem cl-gtk4\/example/,$d' \
		-i ${PN}.asd
	rm -rf examples
}
