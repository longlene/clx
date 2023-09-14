# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

IUSE=""
RESTRICT="nomirror"

DESCRIPTION="PyAwale is a Python implementation of the Ivory Coast rules for Awale."
HOMEPAGE="https://gna.org/projects/pyawale/"
SRC_URI="http://download.gna.org/pyawale/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"

DEPEND="dev-lang/python
	dev-python/pygame"

src_install() {
	insinto /usr/share/pyawale
	doins -r data doc src
	dodoc AUTHORS ChangeLog NEWS README
	make_wrapper pyawale "python -O src/pyawale.py" /usr/share/pyawale
}
