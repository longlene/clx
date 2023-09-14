# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This Sinatra extension, derived from omniauth_pure by Marcus Proske, adds OmniAuth authorization to your Sinatra application, so your users can login using FaceBook, Twitter and many other authorization providers, as long as you supply the API keys"
HOMEPAGE="http://github.com/cjheath/sinatra_omniauth"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/omniauth-0"
ruby_add_rdepend ">=dev-ruby/omniauth-twitter-0"
ruby_add_rdepend ">=dev-ruby/dm-core-0"
ruby_add_rdepend ">=dev-ruby/addressable-0"
ruby_add_rdepend ">=dev-ruby/dm-migrations-0"
ruby_add_rdepend ">=dev-ruby/dm-postgres-adapter-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/rack-flash3-0"
ruby_add_rdepend ">=dev-ruby/uuidtools-0"
ruby_add_rdepend ">=dev-ruby/haml-3.1.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.0.0"
ruby_add_rdepend ">=dev-ruby/jeweler-1.6.2"
ruby_add_rdepend ">=dev-ruby/rcov-0.9.11"
ruby_add_rdepend ">=dev-ruby/simplecov-0.6.4"
ruby_add_rdepend ">=dev-ruby/rdoc-2.4.0"
ruby_add_rdepend ">=dev-ruby/dm-sqlite-adapter-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.6.0"

