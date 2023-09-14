# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/agorf/feed2email"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/feedzirra-0.7.0"
ruby_add_rdepend ">=dev-ruby/mail-2.5.4"
ruby_add_rdepend ">=dev-ruby/sanitize-2.1.0"
ruby_add_rdepend ">=dev-ruby/reverse_markdown-0.6.0"
ruby_add_rdepend ">=dev-ruby/thor-0.19.1"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6.5"
ruby_add_rdepend ">=dev-ruby/sequel-4.18.0"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.10"
ruby_add_rdepend ">=dev-ruby/rspec-2.14.1"
ruby_add_rdepend ">=dev-ruby/fuubar-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/travis-lint-0"
ruby_add_rdepend ">=dev-ruby/aruba-0.6.2"

