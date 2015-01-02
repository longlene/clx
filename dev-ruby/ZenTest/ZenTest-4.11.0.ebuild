# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="ZenTest provides 4 different tools: zentest, unit_diff, autotest, and
multiruby"
HOMEPAGE="https://github.com/seattlerb/zentest"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5.4"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.13"

