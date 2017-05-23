# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Simple authorization solution for Rails"
HOMEPAGE="https://github.com/CanCanCommunity/cancancan"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rubocop-0.46"
ruby_add_rdepend ">=dev-ruby/rake-10.1.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.2.0"
ruby_add_rdepend ">=dev-ruby/appraisal-2.0.0"

