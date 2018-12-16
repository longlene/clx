# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Extends Sinatra with some convenience shortcuts"
HOMEPAGE="http://github.com/blackwinter/sinatra-bells"

LICENSE="AGPL-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/hen-0.8"
ruby_add_rdepend ">=dev-ruby/rake-0"

