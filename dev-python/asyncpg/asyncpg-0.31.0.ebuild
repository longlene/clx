# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="An asyncio PostgreSQL driver"
HOMEPAGE="https://pypi.org/project/asyncpg/ https://github.com/MagicStack/asyncpg"

LICENSE="Apache-2.0 PSF-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="kerberos"
RESTRICT="test"

RDEPEND="
	kerberos? ( dev-python/gssapi[${PYTHON_USEDEP}] )
"
BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/cython-3.2.1[${PYTHON_USEDEP}]
		<dev-python/cython-4[${PYTHON_USEDEP}]
	')
"

PATCHES=(
	"${FILESDIR}"/${PN}-0.30.0-cflags.patch
)

python_prepare_all() {
	cat <<-EOF >> setup.cfg || die
		[build_ext]
		debug=False
		cython_always=True
		cython_annotate=False
		cython_directives=
	EOF

	rm asyncpg/{pgproto/pgproto,protocol/protocol}.c || die

	distutils-r1_python_prepare_all
}
