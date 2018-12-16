# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="DataMapper plugin enabling models to be created from matching a regex"
HOMEPAGE="http://github.com/locomote/dm-regex"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dm-core-1.0"
ruby_add_rdepend ">=dev-ruby/dm-migrations-1.0"
ruby_add_rdepend ">=dev-ruby/dm-sqlite-adapter-1.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.0"

