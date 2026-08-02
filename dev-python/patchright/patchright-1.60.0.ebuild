# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

MY_DRIVER="https://github.com/Kaliiiiiiiiii-Vinyzu/patchright/releases/download"

DESCRIPTION="Undetected Python version of the Playwright testing and automation library"
HOMEPAGE="https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-python"
SRC_URI="
	https://github.com/Kaliiiiiiiiii-Vinyzu/patchright-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/microsoft/playwright-python/archive/refs/tags/v${PV}.tar.gz -> playwright-python-${PV}.gh.tar.gz
	amd64? ( ${MY_DRIVER}/v${PV}/playwright-${PV}-linux.zip -> patchright-driver-${PV}-linux.zip )
	arm64? ( ${MY_DRIVER}/v${PV}/playwright-${PV}-linux-arm64.zip -> patchright-driver-${PV}-linux-arm64.zip )
"
S="${WORKDIR}/playwright-python-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/greenlet-3.1.1[${PYTHON_USEDEP}]
	>=dev-python/pyee-13[${PYTHON_USEDEP}]
"

BDEPEND="
	app-arch/unzip
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
"

RESTRICT="test"

QA_PREBUILT="usr/lib/python*/site-packages/patchright/driver/*"

src_unpack() {
	# Driver zips are consumed by setup.py directly from DISTDIR; don't unpack them
	unpack "${P}.gh.tar.gz"
	unpack "playwright-python-${PV}.gh.tar.gz"
}

src_prepare() {
	# Set up directory structure expected by patch_python_package.py
	ln -s "${WORKDIR}/playwright-python-${PV}" \
		"${WORKDIR}/patchright-python-${PV}/playwright-python" || die

	# Pre-place driver zip to prevent network access during build
	mkdir -p "${S}/driver" || die
	local zip_name
	use arm64 && zip_name="linux-arm64" || zip_name="linux"
	cp "${DISTDIR}/patchright-driver-${PV}-${zip_name}.zip" \
		"${S}/driver/playwright-${PV}-${zip_name}.zip" || die

	# Provide toml module via shim (uses stdlib tomllib, Python 3.11+)
	cp "${FILESDIR}/toml_shim.py" "${WORKDIR}/toml.py" || die

	# Patch playwright-python source to become patchright
	pushd "${WORKDIR}/patchright-python-${PV}" || die
	PYTHONPATH="${WORKDIR}:${PYTHONPATH}" \
		patchright_release="${PV}" python patch_python_package.py || die
	popd || die

	export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
	distutils-r1_src_prepare
}
