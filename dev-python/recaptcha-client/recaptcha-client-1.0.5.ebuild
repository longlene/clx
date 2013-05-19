# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

PYTHON_DEPEND="*"
SUPPORT_PYTHON_ABIS="1"

inherit distutils python

DESCRIPTION="Provides a CAPTCHA for Python using the reCAPTCHA service"
HOMEPAGE="http://pypi.python.org/pypi/recaptcha-client"
SRC_URI="http://pypi.python.org/packages/source/r/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-python/pycrypto"

src_install() {
	mv PKG-INFO README || die
	dodoc README || die
}
