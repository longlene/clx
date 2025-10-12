# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

CURL_PV="8.15.0"
CURL_VERSION="curl-${CURL_PV//./_}"
CURL_IMPERSONATE_PV="1.2.0"

DESCRIPTION="libcurl ffi bindings for Python"
HOMEPAGE="
	https://pypi.org/project/curl-cffi/
	https://github.com/lexiforest/curl_cffi
"
SRC_URI="
	https://github.com/lexiforest/curl_cffi/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/curl/curl/archive/${CURL_VERSION}.tar.gz -> curl-${CURL_PV}.tar.gz
	https://github.com/lexiforest/curl-impersonate/archive/refs/tags/v${CURL_IMPERSONATE_PV}.tar.gz -> curl-impersonate-${CURL_IMPERSONATE_PV}.tar.gz
	https://github.com/lexiforest/curl-impersonate/releases/download/v${CURL_IMPERSONATE_PV}/libcurl-impersonate-v${CURL_IMPERSONATE_PV}.x86_64-linux-gnu.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/cffi-1.12.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2024.2.2[${PYTHON_USEDEP}]
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}"/curl_cffi-${PV}

export DOWNLOAD_DIR="${WORKDIR}"
export INC_DIR="${WORKDIR}"/curl-${CURL_VERSION}/include

src_prepare() {
	default
	eapply "${FILESDIR}"/build-fix.patch
	pushd "${WORKDIR}"/curl-${CURL_VERSION} \
		&& eapply "${WORKDIR}"/curl-impersonate-${CURL_IMPERSONATE_PV}/patches/curl.patch \
		&& popd
}
