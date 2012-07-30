# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit eutils linux-info python systemd

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
IUSE="svg"

CONFIG_CHECK="~PROC_EVENTS ~TASKSTATS ~TASK_DELAY_ACCT"

RDEPEND="dev-lang/python
	!app-benchmarks/bootchart
	dev-python/pycairo[svg=]"
DEPEND="${RDEPEND}"

src_unpack() {
	if [[ "${PV}" = "9999" ]]; then
		git_src_unpack
	else
		unpack ${A}
	fi
}

src_prepare() {
	# properly check for bootchart_init=/path on the kernel command line
	epatch "${FILESDIR}"/0001-bootchartd-Look-for-bootchart_init-in-the-environmen.patch

	# correct the version
	if [[ "${PV}" = "9999" ]]; then
		sed -i Makefile -e "s:VER=$(cat Makefile | grep VER= | cut -d"=" -f2):VER=git-$(date +%Y%m%d):"
	fi
}

src_install() {
	# Note: LIBDIR is hardcoded as /lib in collector/common.h, so we shouldn't
	# just change it. Since no libraries are installed, /lib is fine.
	emake \
		DESTDIR="${D}" \
		PY_LIBDIR="$(python_get_libdir)" \
		DOCDIR="/usr/share/doc/${PN}-${PVR}" \
		install || die "died running make install, $FUNCNAME"

	keepdir /lib/bootchart/tmpfs

	doinitd "${FILESDIR}/${PN}"

	# Install systemd units where and whether the eclass wants them:
	mv "${D}"/lib/systemd/system systemd-units || die
	systemd_dounit systemd-units/* || die

	prepalldocs

	dodoc README README.pybootchart AUTHORS MAINTAINERS NEWS TODO || die
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
	elog "If you are not using an initrd, and you are not using /sbin/init as"
	elog "your init system, you must additionally specify something like this"
	elog "on your kernel command line"
	elog "   bootchart_init=/bin/systemd"
	elog
}
