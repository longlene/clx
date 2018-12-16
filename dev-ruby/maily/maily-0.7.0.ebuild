# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Maily is a Rails Engine to manage, test and navigate through all your email templates of your app, being able to preview them directly in your browser"
HOMEPAGE="https://github.com/markets/maily"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-3.0.0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-0"
ruby_add_rdepend ">=dev-ruby/appraisal-0"
ruby_add_rdepend ">=dev-ruby/byebug-0"

