# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.rdoc"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Contributed Rack Middleware and Utilities"
HOMEPAGE="http://github.com/rack/rack-contrib/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-0.9.1"
ruby_add_rdepend ">=dev-ruby/test-spec-0.9.0"
ruby_add_rdepend ">=dev-ruby/tmail-1.2"
ruby_add_rdepend ">=dev-ruby/json-1.1"

