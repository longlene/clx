# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="python e-text reader"
HOMEPAGE="http://altline.ru/~e-ai/"
LICENSE="GPL-2"
KEYWORDS="~x86"
SRC_URI="http://altline.ru/~e-ai/downloads/${P}.zip"

RDEPEND="virtual/python
	 >=dev-python/pygtk-2.2
	 >=x11-libs/gtk+-2.2
	|| ( app-arch/unzip app-arch/zip )"
DEPEND="${RDEPEND}"

