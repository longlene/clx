# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2:2.5:2.7"
RESTRICT_PYTHON_ABIS="3.*"

inherit distutils

DESCRIPTION="Enhancements to virtualenv"
HOMEPAGE="http://www.doughellmann.com/projects/virtualenvwrapper/"
SRC_URI="http://pypi.python.org/packages/source/v/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc +linguas_en"

LANGS="es ja"

for lang in ${LANGS}; do
	IUSE="${IUSE} linguas_${lang}"
done

DEPEND="dev-python/virtualenv"
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install

	if use doc; then
		for lang in en ${LANGS}; do
			if use linguas_${lang}; then
				insinto /usr/share/doc/${PF}/${lang}
				doins -r docs/html/${lang}/* || die
			fi
		done
	fi
}

