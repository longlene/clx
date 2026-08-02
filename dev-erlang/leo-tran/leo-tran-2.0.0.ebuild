# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

REBAR_APP_SRC="src/leo_tran.app.src"

inherit rebar

DESCRIPTION="Erlang data-transaction manager library"
HOMEPAGE="https://github.com/leo-project/leo_tran"
SRC_URI="https://github.com/leo-project/leo_tran/archive/refs/tags/${PV}.tar.gz
	-> ${P}.gh.tar.gz"
S="${WORKDIR}/leo_tran-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-erlang/leo-commons-2.0.1"

src_prepare() {
	rebar_src_prepare
	# upstream pins ancient OTP releases and fails the build on
	# deprecation warnings with modern OTP
	sed -i \
		-e '/require_otp_vsn/d' \
		-e 's/warnings_as_errors,\?//' \
		rebar.config || die
}
