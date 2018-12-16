# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Repository abstraction for rom-rb"
HOMEPAGE="http://rom-rb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rom-mapper-1.0"
ruby_add_rdepend ">=dev-ruby/dry-struct-0.3"
ruby_add_rdepend ">=dev-ruby/rake-11.2"
ruby_add_rdepend ">=dev-ruby/rspec-3.5"

