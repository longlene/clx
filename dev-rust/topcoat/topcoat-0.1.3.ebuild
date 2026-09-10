# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A batteries-included framework for building web apps"
HOMEPAGE="https://github.com/tokio-rs/topcoat"

PV_Prefix="topcoat-view-v"
PV_SUFFIX="0.1.3"
PV="${PV_SUFFIX}"

SRC_URI="https://github.com/tokio-rs/topcoat/archive/refs/tags/${PV_Prefix}${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

CRATES=(
)
CRATES_PENDING=true
