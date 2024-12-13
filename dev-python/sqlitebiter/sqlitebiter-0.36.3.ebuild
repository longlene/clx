# Copyright 2024 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..13} )
inherit distutils-r1

DESCRIPTION="A CLI tool to convert CSV/Excel/HTML/JSON/LTSV/Markdown/SQLite/TSV/Google-Sheets to a SQLite database file"
HOMEPAGE="http://sqlitebiter.rtfd.io/"
SRC_URI="https://github.com/thombashi/sqlitebiter/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
appconfigpy>=1.0.1
click>=6.2
envinfopy>=0.0.7
loguru>=0.4.1
msgfy>=0.1.0
nbformat>=4.4.0
path>=13
pathvalidate>=2.5.2
pytablereader>=0.31.3
retryrequests>=0.0.2
SimpleSQLite>=1.3.2
tcolorpy>=0.0.5
typepy>=1.2.0
"
#BDEPEND="
#	test? (
#	)
#"

distutils_enable_tests pytest
