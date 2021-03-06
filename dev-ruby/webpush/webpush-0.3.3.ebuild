# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/zaru/webpush"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hkdf-0.2"
ruby_add_rdepend ">=dev-ruby/jwt-2.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.11"
ruby_add_rdepend ">=dev-ruby/pry-0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/webmock-1.24"
ruby_add_rdepend ">=dev-ruby/ece-0.2"

