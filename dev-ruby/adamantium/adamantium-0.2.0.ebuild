# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Immutable extensions to objects"
HOMEPAGE="https://github.com/dkubb/adamantium"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ice_nine-0.11.0"
ruby_add_rdepend ">=dev-ruby/memoizable-0.4.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.5.2"

