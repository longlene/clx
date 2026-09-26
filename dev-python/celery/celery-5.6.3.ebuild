# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit check-reqs distutils-r1 optfeature shell-completion

MY_PV="${PV/_beta/b}"
DESCRIPTION="Asynchronous task queue/job queue based on distributed message passing"
HOMEPAGE="
	https://pypi.org/project/celery/
	https://github.com/celery/celery
"
SRC_URI="https://github.com/celery/celery/archive/v${MY_PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${MY_PV}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="examples"
# Tests require a lot of dependencies that are not packaged for Gentoo
RESTRICT="test"

RDEPEND="
	>=dev-python/billiard-4.2.1[${PYTHON_USEDEP}]
	<dev-python/billiard-5.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.2[${PYTHON_USEDEP}]
	<dev-python/click-9.0[${PYTHON_USEDEP}]
	>=dev-python/click-didyoumean-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/click-plugins-1.1.1[${PYTHON_USEDEP}]
	>=dev-python/click-repl-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/kombu-5.6.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
	dev-python/tzlocal[${PYTHON_USEDEP}]
	>=dev-python/vine-5.1.0[${PYTHON_USEDEP}]
	<dev-python/vine-6.0[${PYTHON_USEDEP}]
"

CHECKREQS_MEMORY="2G"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

pkg_setup() {
	use test && check-reqs_pkg_setup
}

pkg_pretend() {
	use test && check-reqs_pkg_pretend
}

python_install_all() {
	# Main celeryd init.d and conf.d
	newinitd "${FILESDIR}/celery.initd-r2" celery
	newconfd "${FILESDIR}/celery.confd-r2" celery

	if use examples; then
		docinto examples
		dodoc -r examples/.
		docompress -x /usr/share/doc/${PF}/examples
	fi

	newbashcomp extra/bash-completion/celery.bash "${PN}"

	distutils-r1_python_install_all
}

pkg_postinst() {
	optfeature "msgpack support" dev-python/msgpack
	optfeature "redis support" dev-python/redis
	optfeature "auth support" dev-python/pyopenssl
	optfeature "yaml support" dev-python/pyyaml
	optfeature "memcache support" dev-python/pylibmc
	optfeature "mongodb support" dev-python/pymongo
	optfeature "sqlalchemy support" dev-python/sqlalchemy
	optfeature "sqs support" dev-python/boto3
}
