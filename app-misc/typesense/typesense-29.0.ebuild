# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

LIBFOR_COMMIT="49611808d08d4e47116aa2a3ddcabeb418f405f7"
H2O_COMMIT="1491a703195790278091fd7aee547fbba78e89af"

SRC_URI="
	https://github.com/typesense/typesense/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/cruppstahl/libfor/archive/${LIBFOR_COMMIT}.tar.gz -> libfor-${LIBFOR_COMMIT}.tar.gz
	https://github.com/h2o/h2o/archive/${H2O_COMMIT}.tar.gz -> h2o-${H2O_COMMIT}.tar.gz
"

SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

export FOR_DIR="${WORKDIR}"/libfor-${LIBFOR_COMMIT}
export H2O_DIR="${WORKDIR}"/h2o-${H2O_COMMIT}

PATCHES=(
	"${FILESDIR}"/build-fix.patch
)
