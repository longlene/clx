# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby22 ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provides flexible, ORM-agnostic, fully customizable and simple OAuth2 support for Grape APIs"
HOMEPAGE="http://github.com/nbulaj/grape-oauth2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/grape-0.16"
ruby_add_rdepend ">=dev-ruby/rack-oauth2-1.3.0"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.4.0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-1.5.0"

