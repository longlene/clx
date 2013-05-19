# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
#!/bin/bash

EAPI=2

inherit distutils

DESCRIPTION="An easy (and up to date) way to access Twitter data with Python."
HOMEPAGE="https://github.com/ryanmcgrath/twython"
SRC_URI="http://pypi.python.org/packages/source/t/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="|| ( >=dev-lang/python-2.6 dev-python/simplejson )
        dev-python/oauth2"
RDEPEND="${DEPEND}"

src_prepare() {
	distutils_src_prepare

	rm -rf twython3k MANIFEST.in oauth_django_example
}
