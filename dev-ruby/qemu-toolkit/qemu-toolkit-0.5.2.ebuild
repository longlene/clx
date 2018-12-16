# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="
    qemu-toolkit is a collection of small tools that help in managing and
    running QEMU virtual machines on Illumos/OmniOS"
HOMEPAGE="http://kschiess.bitbucket.org/qemu-toolkit/README.7.html"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/clamp-0.5"

