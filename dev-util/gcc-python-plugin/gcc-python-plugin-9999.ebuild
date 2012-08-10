# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="*"
PYTHON_EXPORT_PHASE_FUNCTIONS="1"

inherit git-2 python

DESCRIPTION="GCC Python plugin for static analysis"
HOMEPAGE="https://fedorahosted.org/gcc-python-plugin"
EGIT_REPO_URI="git://git.fedorahosted.org/gcc-python-plugin.git"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="doc"

DEPEND="${DEPEND}
>=sys-devel/gcc-4.6
dev-python/six
dev-python/pygments
media-gfx/graphviz
doc? (
  dev-python/sphinx
  dev-python/pycairo
)
"

RDEPEND="${DEPEND}"

DEPEND="${DEPEND}
doc? (
  dev-python/sphinx
  dev-python/pycairo
)
"

src_configure() {
	return
}

src_compile() {
	rename_items() {
		PLUGIN_NAME="python$(python_get_version --major)"
		GCC_WITH_PYTHON_SCRIPT_NAME="gcc-with-${PLUGIN_NAME}"

		cp python.so "${PLUGIN_NAME}.so"
		cp gcc-with-python "${GCC_WITH_PYTHON_SCRIPT_NAME}"
		sed -i -e"s|-fplugin=[^ ]*|-fplugin=${PLUGIN_NAME}|" "${GCC_WITH_PYTHON_SCRIPT_NAME}"
		sed -i -e"s|-fplugin-arg-python-script|-fplugin-arg-${PLUGIN_NAME}-script|" "${GCC_WITH_PYTHON_SCRIPT_NAME}"
	}

	python_execute_function -d -s plugin
	python_execute_function -s rename_items

	cd "${WORKDIR}/${P}-$(python_get_version -f)"

	emake man

	if use doc; then
		emake html
	fi
}

src_test() {
	emake testcpybuilder test-suite testcpychecker
}

src_install() {
	GCC_PLUGIN_DIR="$(gcc --print-file-name=plugin)"

	install_plugin_files() {
		dobin "gcc-with-python$(python_get_version --major)"
		insinto "${GCC_PLUGIN_DIR}"
		doins "python$(python_get_version --major).so"
		insinto "$(python_get_sitedir)"
		doins gccutils.py
		doins -r libcpychecker
	}

	python_execute_function -s install_plugin_files
	dobin "${FILESDIR}/gcc-with-python"

	cd "${WORKDIR}/${P}-$(python_get_version -f)"

	doman docs/_build/man/*

	if use doc; then
		dodoc -r examples
		dodoc -r docs/_build/html
	fi
}
