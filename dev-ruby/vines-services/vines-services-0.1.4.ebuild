# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Vines Services are dynamically updated groups of systems"
HOMEPAGE="http://www.getvines.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bcrypt-ruby-3.0.1"
ruby_add_rdepend ">=dev-ruby/blather-0.8.5"
ruby_add_rdepend ">=dev-ruby/citrus-2.4.0"
ruby_add_rdepend ">=dev-ruby/couchrest_model-1.1.2"
ruby_add_rdepend ">=dev-ruby/em-http-request-1.0.3"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.7"
ruby_add_rdepend ">=dev-ruby/vines-0.4.7"
ruby_add_rdepend ">=dev-ruby/vines-couchdb-0.1.0"
ruby_add_rdepend ">=dev-ruby/vines-web-0.1.1"
