# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="SQL databases support for ROM"
HOMEPAGE="http://rom-rb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sequel-4.18"
ruby_add_rdepend ">=dev-ruby/dry-equalizer-0.2"
ruby_add_rdepend ">=dev-ruby/rom-1.0.0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"

