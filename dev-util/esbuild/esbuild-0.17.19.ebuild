# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

EGO_SUM=(
	"golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8"
	"golang.org/x/sys v0.0.0-20220715151400-c0bba94af5f8/go.mod"
)

go-module_set_globals

DESCRIPTION="An extremely fast JavaScript and CSS bundler and minifier"
HOMEPAGE="https://esbuild.github.io/"
SRC_URI="
	https://github.com/evanw/esbuild/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin esbuild
	einstalldocs
}
