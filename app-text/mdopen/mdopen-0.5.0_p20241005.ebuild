# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ascii@1.1.0
	bitflags@2.6.0
	chunked_transfer@1.5.0
	env_filter@0.1.0
	env_logger@0.11.3
	httpdate@1.0.3
	humantime@2.1.0
	is-docker@0.2.0
	is-wsl@0.4.0
	lexopt@0.3.0
	libc@0.2.153
	log@0.4.21
	memchr@2.7.1
	nanotemplate@0.3.0
	once_cell@1.19.0
	open@5.1.2
	pathdiff@0.2.1
	percent-encoding@2.3.1
	pulldown-cmark-escape@0.11.0
	pulldown-cmark@0.12.1
	tiny_http@0.12.0
	unicase@2.7.0
	version_check@0.9.5
"

inherit cargo

EGIT_COMMIT="94e238d2a77316847c23032e10fe54dbc4d4588e"

DESCRIPTION="Preview markdown files in a browser"
HOMEPAGE="https://github.com/immanelg/mdopen"
SRC_URI="
	https://github.com/immanelg/mdopen/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="BSD"
LICENSE+=" MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"/${PN}-${EGIT_COMMIT}
