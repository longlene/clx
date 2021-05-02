# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Contributed Rack Middleware and Utilities"
HOMEPAGE="http://github.com/rack/rack-contrib/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-2.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/git-version-bump-0.15"
ruby_add_rdepend ">=dev-ruby/github-release-0.1"
ruby_add_rdepend ">=dev-ruby/i18n-0.6"
ruby_add_rdepend ">=dev-ruby/json-2.0"
ruby_add_rdepend ">=dev-ruby/mime-types-3.0"
ruby_add_rdepend ">=dev-ruby/minitest-5.6"
ruby_add_rdepend ">=dev-ruby/minitest-hooks-1.0"
ruby_add_rdepend ">=dev-ruby/mail-2.3"
ruby_add_rdepend ">=dev-ruby/nbio-csshttprequest-1.0"
ruby_add_rdepend ">=dev-ruby/rake-10.4"
ruby_add_rdepend ">=dev-ruby/rdoc-5.0"
ruby_add_rdepend ">=dev-ruby/ruby-prof-0.13.0"

