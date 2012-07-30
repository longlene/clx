# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/gvdown/gvdown-0.6.3.ebuild, 2008/02/07

inherit python

DESCRIPTION="(g)vdown is an application that can download videos from video sharing websites like YouTube, Google Video, Stage6 and so on."
SRC_URI="http://vdown.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"

IUSE=""

KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-lang/python-2.5
	>=dev-python/pygtk-2"

src_compile() {

python_version

	cat <<-EOF > "${S}"/gvdown
	#!/bin/bash
	cd /usr/$(get_libdir)/python${PYVER}/site-packages/gvdown
	./gui.py
	EOF

	cat <<-EOF > "${S}"/vdown
	#!/bin/bash
	cd /usr/$(get_libdir)/python${PYVER}/site-packages/gvdown
	./cli.py --destination=\"\$CWD\" \"\$@\"
	EOF
}

src_install() { 
	insinto "/usr/$(get_libdir)/python${PYVER}/site-packages/gvdown"
	doins "gvdown.glade"
	exeinto "/usr/$(get_libdir)/python${PYVER}/site-packages/gvdown"
	doexe "cli.py" "gui.py" "main.py"
	doins -r po/
	insinto /usr/share/pixmaps/
	doins nonsrc/gvdown.xpm
	insinto /usr/share/applications/
	doins nonsrc/gvdown.desktop
	exeinto /usr/bin
	dobin gvdown vdown
}
