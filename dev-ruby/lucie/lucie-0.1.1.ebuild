# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Command line utility framework"
HOMEPAGE="http://my.luc.ie"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "=dev-ruby/lucie-lib-0.1.1"
ruby_add_rdepend "=dev-ruby/lucie-bin-0.1.1"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7"

