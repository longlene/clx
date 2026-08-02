# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )
inherit distutils-r1

MY_P="jax-${PV}"

DESCRIPTION="XLA library for JAX"
HOMEPAGE="https://github.com/jax-ml/jax"
SRC_URI="https://github.com/jax-ml/jax/archive/refs/tags/jax-v${PV}.tar.gz -> ${MY_P}.tar.gz"
S="${WORKDIR}"/jax-jax-v${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cuda"
# tests require the Bazel-compiled XLA backend which is not installed here
RESTRICT="test"
RDEPEND="
	dev-python/scipy[${PYTHON_USEDEP}]
	>=dev-python/numpy-2.0[${PYTHON_USEDEP}]
	dev-python/ml-dtypes[${PYTHON_USEDEP}]
"

# S points to repo root so that packages=['jaxlib'] resolves to jaxlib/ subdir

src_prepare() {
	# Root setup.py is for the jax package; replace with jaxlib's setup.py
	cp jaxlib/setup.py setup.py || die
	# version.py is shared between jax and jaxlib; Bazel copies it during build
	cp jax/version.py jaxlib/version.py || die
	# Bazel renames init.py -> __init__.py during assembly; do it manually
	mv jaxlib/init.py jaxlib/__init__.py || die
	distutils-r1_src_prepare
}

python_compile() {
	# JAXLIB_RELEASE=1 causes version.py to return a clean "x.y.z" version
	# without attempting git queries or date-based dev suffixes
	JAXLIB_RELEASE=1 distutils-r1_python_compile
}
