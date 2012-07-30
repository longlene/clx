# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils multilib python linux-info

DESCRIPTION="Performance analysis and visualization of the system boot process"
HOMEPAGE="https://github.com/mmeeks/bootchart"

if [[ "${PV}" = "9999" ]]; then
	SRC_URI=""
	KEYWORDS=""
	EGIT_REPO_URI="git://github.com/mmeeks/bootchart.git"
	inherit git
else
	SRC_URI="https://github.com/downloads/mmeeks/bootchart/bootchart2-${PV}.tar.bz2"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="svg systemd"

CONFIG_CHECK="~PROC_EVENTS ~TASKSTATS ~TASK_DELAY_ACCT"

RDEPEND="dev-lang/python
	!app-benchmarks/bootchart
	systemd? ( sys-apps/systemd )
	dev-python/pycairo[svg=]"
DEPEND="${RDEPEND}"

pkg_setup() {
	linux-info_pkg_setup
}

src_unpack() {
	if [[ "${PV}" = "9999" ]]; then
		git_src_unpack
	else
		unpack ${A}
	fi
}

src_prepare() {
	# apply patches
	epatch "${FILESDIR}/bootchartd_usagehelp.diff"

	# correct the version
	if [[ "${PV}" = "9999" ]]; then
		sed -i Makefile -e "s:VER=$(cat Makefile | grep VER= | cut -d"=" -f2):VER=git-$(date +%Y%m%d):"
	else
		sed -i Makefile -e "s:VER=$(cat Makefile | grep VER= | cut -d"=" -f2):VER=${PV}:"
	fi
}

src_compile() {
	emake \
		LIBDIR="/$(get_libdir)" || die "died running make, $FUNCNAME"
}

src_install() {
	emake \
		DESTDIR="${D}" \
		LIBDIR="$(get_libdir)" \
		PY_LIBDIR="$(python_get_libdir)" \
		DOCDIR="/usr/share/doc/${PN}-${PVR}" \
		install || die "died running make install, $FUNCNAME"

	keepdir /$(get_libdir)/bootchart/tmpfs

	use systemd || rm -R "${D}/$(get_libdir)/systemd"

	doinitd "${FILESDIR}/${PN}"

	prepalldocs

	if ! [[ "${PV}" = "9999" ]]; then
		dodoc README README.pybootchart || die
	fi
	dodoc AUTHORS MAINTAINERS NEWS TODO || die
}

pkg_postinst() {
	elog "To generate the chart, generate a ramdisk with bootchart support,"
	elog "append this to your kernel commandline"
	elog "   initcall_debug printk.time=y quiet init=/sbin/bootchartd"
	elog "and reboot"
	elog
	elog "Note: genkernel users should replace init= with real_init= in the above"
	elog "see https://bugs.gentoo.org/show_bug.cgi?id=275251 for more info"
	elog
}

