# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="DB Schema management tool"
HOMEPAGE="https://github.com/nishio-dens/convergence"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/mysql2-0"
ruby_add_rdepend ">=dev-ruby/diff-lcs-0"
ruby_add_rdepend ">=dev-ruby/diffy-0"
ruby_add_rdepend ">=dev-ruby/slop-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/guard-0"
ruby_add_rdepend ">=dev-ruby/guard-rspec-0"

