# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_SINGLE_IMPL=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..14} )

inherit distutils-r1

DESCRIPTION="Making Megatron training as simple as Transformers"
HOMEPAGE="
	https://pypi.org/project/mcore-bridge/
	https://github.com/modelscope/mcore-bridge
"
SRC_URI="https://github.com/modelscope/mcore-bridge/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-ml/megatron-lm-0.15.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/peft-0.11[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/transformers-4.33[${PYTHON_SINGLE_USEDEP}]
	$(python_gen_cond_dep '
		sci-ml/modelscope[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	')
"
#BDEPEND="
#	test? (
#	)
#"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

python_prepare_all() {
	# exec() inside a function does not inject into locals() in Python 3;
	# pass an explicit namespace dict to capture __version__.
	sed -i \
		-e "s/exec(compile(f.read(), version_file, 'exec'))/_ns = {}; exec(compile(f.read(), version_file, 'exec'), _ns)/" \
		-e "s/return locals()\['__version__'\]/return _ns['__version__']/" \
		setup.py || die
	distutils-r1_python_prepare_all
}
