# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Log in and work on behalf of other users without their credentials"
HOMEPAGE="https://github.com/django-hijack/django-hijack"
SRC_URI="https://github.com/django-hijack/django-hijack/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/django-4.2[${PYTHON_USEDEP}]"

RESTRICT="test"

src_prepare() {
	printf 'version = "%s"\nversion_tuple = (%s,)\n' "${PV}" "${PV//./, }" \
		> hijack/_version.py || die
	sed -i \
		-e 's|build-backend = "flit_gettext.scm"|build-backend = "flit_core.buildapi"|' \
		-e 's|requires = \["flit-gettext", "flit_scm", "wheel"\]|requires = ["flit_core"]|' \
		pyproject.toml || die
	distutils-r1_src_prepare
}
